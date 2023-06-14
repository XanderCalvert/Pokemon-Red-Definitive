CableClubNPC:: ; Beginning of the CableClubNPC routine
	ld hl, CableClubNPCWelcomeText ; Load the address of the welcome text
	call PrintText ; Call function to print text
	CheckEvent EVENT_GOT_POKEDEX ; Check if the Pokedex event has occurred
	jp nz, .receivedPokedex ; If the event occurred (the bit was set), jump to the .receivedPokedex label
; if the player hasn't received the pokedex
	ld c, 60 ; Load 60 into register c
	call DelayFrames ; Call a function that causes a delay for a number of frames specified in register c
	ld hl, CableClubNPCMakingPreparationsText ; Load the address of the text for when preparations are being made
	call PrintText ; Call function to print text
	jp .didNotConnect ; Jump to the .didNotConnect label
.receivedPokedex ; Label for the case where the Pokedex event has occurred
	ld a, $1 ; Load 1 into register a
	ld [wMenuJoypadPollCount], a ; Write the value of register a to the address of the Joypad poll count
	ld a, 90 ; Load 90 into register a
	ld [wLinkTimeoutCounter], a ; Write the value of register a to the address of the link timeout counter
.establishConnectionLoop ; Beginning of the loop that attempts to establish a connection
	ldh a, [hSerialConnectionStatus] ; Load the value of the serial connection status into register a
	cp USING_INTERNAL_CLOCK ; Compare the value of register a with the value of USING_INTERNAL_CLOCK
	jr z, .establishedConnection ; If they are equal, jump to the .establishedConnection label
	cp USING_EXTERNAL_CLOCK ; Compare the value of register a with the value of USING_EXTERNAL_CLOCK
	jr z, .establishedConnection ; If they are equal, jump to the .establishedConnection label
	ld a, CONNECTION_NOT_ESTABLISHED ; Load the value of CONNECTION_NOT_ESTABLISHED into register a
	ldh [hSerialConnectionStatus], a ; Write the value of register a to the address of the serial connection status
	ld a, ESTABLISH_CONNECTION_WITH_EXTERNAL_CLOCK ; Load the value of ESTABLISH_CONNECTION_WITH_EXTERNAL_CLOCK into register a
	ldh [rSB], a ; Write the value of register a to the SB register
	xor a ; Clear register a
	ldh [hSerialReceiveData], a ; Write the value of register a to the address of the serial receive data
	ld a, START_TRANSFER_EXTERNAL_CLOCK ; Load the value of START_TRANSFER_EXTERNAL_CLOCK into register a

; This vc_hook causes the Virtual Console to set [hSerialConnectionStatus] to
; USING_INTERNAL_CLOCK, which allows the player to proceed past the link
; receptionist's "Please wait." It assumes that hSerialConnectionStatus is at
; its original address.
	vc_hook Link_fake_connection_status
	vc_assert hSerialConnectionStatus == $ffaa, \
		"hSerialConnectionStatus is no longer located at 00:ffaa"
	vc_assert USING_INTERNAL_CLOCK == $02, \
		"USING_INTERNAL_CLOCK is no longer equal to $02."
	ldh [rSC], a
	ld a, [wLinkTimeoutCounter]
	dec a
	ld [wLinkTimeoutCounter], a
	jr z, .failedToEstablishConnection
	ld a, ESTABLISH_CONNECTION_WITH_INTERNAL_CLOCK
	ldh [rSB], a
	ld a, START_TRANSFER_INTERNAL_CLOCK
	ldh [rSC], a
	call DelayFrame
	jr .establishConnectionLoop
.establishedConnection
	call Serial_SendZeroByte
	call DelayFrame
	call Serial_SendZeroByte
	ld c, 50
	call DelayFrames
	ld hl, CableClubNPCPleaseApplyHereHaveToSaveText
	call PrintText
	xor a
	ld [wMenuJoypadPollCount], a
	call YesNoChoice
	ld a, $1
	ld [wMenuJoypadPollCount], a
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .choseNo
	vc_hook Wireless_TryQuickSave_block_input
	callfar SaveSAVtoSRAM
	call WaitForSoundToFinish
	ld a, SFX_SAVE
	call PlaySoundWaitForCurrent
	ld hl, CableClubNPCPleaseWaitText
	call PrintText
	ld hl, wUnknownSerialCounter
	ld a, $3
	ld [hli], a
	xor a
	ld [hl], a
	ldh [hSerialReceivedNewData], a
	vc_hook Wireless_prompt
	ld [wSerialExchangeNybbleSendData], a
	call Serial_SyncAndExchangeNybble
	vc_hook Wireless_net_recheck
	ld hl, wUnknownSerialCounter
	ld a, [hli]
	inc a
	jr nz, .connected
	ld a, [hl]
	inc a
	jr nz, .connected
	ld b, 10
.syncLoop
	call DelayFrame
	call Serial_SendZeroByte
	dec b
	jr nz, .syncLoop
	call CloseLinkConnection
	ld hl, CableClubNPCLinkClosedBecauseOfInactivityText
	call PrintText
	jr .didNotConnect
.failedToEstablishConnection
	ld hl, CableClubNPCAreaReservedFor2FriendsLinkedByCableText
	call PrintText
	jr .didNotConnect
.choseNo
	call CloseLinkConnection
	ld hl, CableClubNPCPleaseComeAgainText
	call PrintText
.didNotConnect
	xor a
	ld hl, wUnknownSerialCounter
	ld [hli], a
	ld [hl], a
	ld hl, wd72e
	res 6, [hl]
	xor a
	ld [wMenuJoypadPollCount], a
	ret
.connected
	xor a
	ld [hld], a
	ld [hl], a
	jpfar LinkMenu

CableClubNPCAreaReservedFor2FriendsLinkedByCableText:
	text_far _CableClubNPCAreaReservedFor2FriendsLinkedByCableText
	text_end

CableClubNPCWelcomeText:
	text_far _CableClubNPCWelcomeText
	text_end

CableClubNPCPleaseApplyHereHaveToSaveText:
	text_far _CableClubNPCPleaseApplyHereHaveToSaveText
	text_end

CableClubNPCPleaseWaitText:
	text_far _CableClubNPCPleaseWaitText
	text_pause
	text_end

CableClubNPCLinkClosedBecauseOfInactivityText:
	text_far _CableClubNPCLinkClosedBecauseOfInactivityText
	text_end

CableClubNPCPleaseComeAgainText:
	text_far _CableClubNPCPleaseComeAgainText
	text_end

CableClubNPCMakingPreparationsText:
	text_far _CableClubNPCMakingPreparationsText
	text_end

CloseLinkConnection:
	call Delay3
	ld a, CONNECTION_NOT_ESTABLISHED
	ldh [hSerialConnectionStatus], a
	ld a, ESTABLISH_CONNECTION_WITH_EXTERNAL_CLOCK
	ldh [rSB], a
	xor a
	ldh [hSerialReceiveData], a
	ld a, START_TRANSFER_EXTERNAL_CLOCK
	ldh [rSC], a
	ret

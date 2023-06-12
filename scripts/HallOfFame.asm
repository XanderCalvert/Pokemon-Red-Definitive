HallOfFame_Script:
	call EnableAutoTextBoxDrawing
	ld hl, HallOfFame_ScriptPointers
	ld a, [wHallOfFameCurScript]
	jp CallFunctionInTable

HallofFameRoomScript_5a4aa:
	xor a
	ld [wJoyIgnore], a
	ld [wHallOfFameCurScript], a
	ret

HallOfFame_ScriptPointers:
	dw HallofFameRoomScript0
	dw HallofFameRoomScript1
	dw HallofFameRoomScript2
	dw HallofFameRoomScript3

HallofFameRoomScript3:
	ret

HallofFameRoomScript2:
	call Delay3
	ld a, [wLetterPrintingDelayFlags]
	push af
	xor a
	ld [wJoyIgnore], a
	predef HallOfFamePC
	pop af
	ld [wLetterPrintingDelayFlags], a
	ld hl, wFlags_D733
	res 1, [hl]
	inc hl
	set 0, [hl]
	xor a
	ld hl, wLoreleisRoomCurScript
	ld [hli], a ; wLoreleisRoomCurScript
	ld [hli], a ; wBrunosRoomCurScript
	ld [hl], a ; wAgathasRoomCurScript
	ld [wLancesRoomCurScript], a
	ld [wHallOfFameCurScript], a
	; Elite 4 events
	ResetEventRange INDIGO_PLATEAU_EVENTS_START, INDIGO_PLATEAU_EVENTS_END, 1
	xor a
	ld [wHallOfFameCurScript], a
	ld a, PALLET_TOWN
	ld [wLastBlackoutMap], a
	farcall SaveSAVtoSRAM
	ld b, 5
.delayLoop
	ld c, 600 / 5
	call DelayFrames
	dec b
	jr nz, .delayLoop
	call WaitForTextScrollButtonPress
	jp Init

HallofFameRoomScript0:
	ld a, $ff
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEMovement5a528
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wHallOfFameCurScript], a
	ret

RLEMovement5a528:
	db D_UP, 5
	db -1 ; end

HallofFameRoomScript1:
    ld a, [wSimulatedJoypadStatesIndex] ; Load the value at memory address wSimulatedJoypadStatesIndex into register A
    and a ; Perform a bitwise AND operation on the value in register A with itself
    ret nz ; Return if the previous operation did not result in zero (i.e., if wSimulatedJoypadStatesIndex is non-zero)
    ld a, PLAYER_DIR_RIGHT ; Load the value representing the player's right direction into register A
    ld [wPlayerMovingDirection], a ; Store the value of register A at memory address wPlayerMovingDirection (force the player to face right)
    ld a, $1 ; Load 1 into register A
    ldh [hSpriteIndex], a ; Load the value of register A into memory address hSpriteIndex (probably referring to a sprite to be moved)
    call SetSpriteMovementBytesToFF ; Call a subroutine that presumably initializes sprite movement data
    ld a, SPRITE_FACING_LEFT ; Load the value representing a sprite facing left into register A
    ldh [hSpriteFacingDirection], a ; Store the value of register A at memory address hSpriteFacingDirection (force the sprite to face left)
    call SetSpriteFacingDirectionAndDelay ; Call a subroutine that sets the sprite's facing direction and possibly imposes a delay
    call Delay3 ; Call a subroutine that causes a short delay
    xor a ; Perform a bitwise XOR on the value in register A with itself, resulting in 0
    ld [wJoyIgnore], a ; Store the value of register A at memory address wJoyIgnore (effectively unblocking the joystick)
    inc a ; Increment the value in register A by 1 (since A was 0, this will make A 1, i.e., PLAYER_DIR_RIGHT)
    ld [wPlayerMovingDirection], a ; Store the value of register A at memory address wPlayerMovingDirection (force the player to face right)
    ld a, $1 ; Load 1 into register A
    ldh [hSpriteIndexOrTextID], a ; Load the value of register A into memory address hSpriteIndexOrTextID (probably to change the displayed sprite or text)
    call DisplayTextID ; Call a subroutine to display the text whose ID was set above
    ld a, $ff ; Load the value $ff into register A
    ld [wJoyIgnore], a ; Store the value of register A at memory address wJoyIgnore (effectively ignoring joystick inputs)
    ld a, HS_CERULEAN_CAVE_GUY ; Load the value representing the guy outside of Cerulean Cave into register A
    ld [wMissableObjectIndex], a ; Store the value of register A at memory address wMissableObjectIndex (probably referring to the character to hide)
    predef HideObject ; Call a predefined subroutine that hides the specified object
        ; if additional things want to hidden or shown after the eilte 4 in the overworld this is where it is done copying the above
        ; ld a, HS_CERULEAN_CAVE_GUY ; Load the value 
        ; ld [wMissableObjectIndex], a ; Store the value of register A at memory address wMissableObjectIndex
        ; predef HideObject ; Call a predefined subroutine that hides the specified object
    ld a, $2 ; Load 2 into register A
    ld [wHallOfFameCurScript], a ; Store the value of register A at memory address wHallOfFameCurScript (probably indicating the current script to run in the Hall of Fame room)
    ret ; Return from this subroutine


HallOfFame_TextPointers:
	dw HallofFameRoomText1

HallofFameRoomText1:
	text_far _HallofFameRoomText1
	text_end

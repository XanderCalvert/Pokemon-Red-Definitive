LoadWildData::
    ; Check if the player has obtained the diploma
    ; CheckEvent EVENT_DIPLOMA_OBTAINED
    ; jr nz, .DiplomaObtained
    ; Check if the player has beaten the Elite 4
    CheckEvent HS_CERULEAN_CAVE_GUY
    jr nz, .E4Beaten
    ; Check if the player has obtained the Pokedex
    CheckEvent EVENT_GOT_POKEDEX
    jr nz, .PokedexObtained
    ; If neither diploma nor Pokedex have been obtained, load from the regular pointer list
    ld hl, WildDataPointers
    jr .LoadWildData

; .DiplomaObtained:
;     ; If the diploma has been obtained, load from the special pointer list
;     ld hl, DiplomaWildDataPointers
;     jr .LoadWildData

.E4Beaten:
    ; If the Elite 4 have been beaten, load from the special pointer list
    ld hl, E4BeatenWildDataPointers
    jr .LoadWildData

.PokedexObtained: ; mainly used for Debugging
    ; If the Pokedex has been obtained, load from the special Pokedex pointer list
    ld hl, PokedexWildDataPointers
    ; No need for a jr instruction here since the next label will be .LoadWildData

.LoadWildData:
	ld a, [wCurMap] ; Load the current map ID

	; get wild data for current map
	ld c, a ; Copy the current map ID to the c register
	ld b, 0 ; Clear the b register
	add hl, bc ; Offset the hl register by twice the current map ID (because each pointer is 2 bytes)
	add hl, bc ; (we do this twice because there's no 'multiply by 2' instruction)
	ld a, [hli] ; Load the first byte of the pointer at hl into a and increment hl
	ld h, [hl] ; Load the second byte of the pointer into h
	ld l, a ; Load the first byte of the pointer into l (hl now points to wild data for current map)
	ld a, [hli] ; Load the encounter rate from the wild data into a
	ld [wGrassRate], a ; Store the encounter rate
	and a ; Perform a bitwise AND on a (checks if the encounter rate is 0)
	jr z, .NoGrassData ; If the encounter rate is 0 (there's no grass data), skip to the water data
	push hl ; Save the current address for later
	ld de, wGrassMons ; Load the address of the grass encounter table
	ld bc, $14 ; The size of the grass encounter table is 20 (0x14)
	call CopyData ; Copy the grass encounter data to the table
	pop hl ; Restore the address of the wild data
	ld bc, $14 ; Offset hl by the size of the grass encounter table
	add hl, bc ; Add the offset to hl
.NoGrassData
	ld a, [hli] ; Load the water encounter rate from the wild data into a
	ld [wWaterRate], a ; Store the encounter rate
	and a ; Perform a bitwise AND on a (checks if the encounter rate is 0)
	ret z ; If the encounter rate is 0 (there's no water data), return
	ld de, wWaterMons ; Load the address of the water encounter table
	ld bc, $14 ; The size of the water encounter table is 20 (0x14)
	jp CopyData ; Copy the water encounter data to the table (and return)

INCLUDE "data/wild/grass_water.asm"
INCLUDE "data/wild/pokedex_grass_water.asm"
INCLUDE "data/wild/e4_grass_water.asm"
; INCLUDE "data/wild/diploma_grass_water.asm"


; CheckEvent EVENT_GOT_POKEDEX

; LoadWildData::
;     ; Check if the player has obtained the diploma
;     CheckEvent EVENT_DIPLOMA_OBTAINED
;     jr nz, .DiplomaObtained
;     ; If the diploma has not been obtained, load from the regular pointer list
;     ld hl, WildDataPointers
;     jr .LoadWildData
; .DiplomaObtained:
;     ; If the diploma has been obtained, load from the special pointer list
;     ld hl, DiplomaWildDataPointers
; .LoadWildData:
;     ld a, [wCurMap]
;     ld c, a
;     ld b, 0
;     add hl, bc
;     add hl, bc
;     ld a, [hli]
;     ld h, [hl]
;     ld l, a       ; hl now points to wild data for current map
;     ld a, [hli]
;     ld [wGrassRate], a
;     and a
;     jr z, .NoGrassData ; if no grass data, skip to surfing data
;     push hl
;     ld de, wGrassMons ; otherwise, load grass data
;     ld bc, $14
;     call CopyData
;     pop hl
;     ld bc, $14
;     add hl, bc
; .NoGrassData
;     ld a, [hli]
;     ld [wWaterRate], a
;     and a
;     ret z        ; if no water data, we're done
;     ld de, wWaterMons  ; otherwise, load surfing data
;     ld bc, $14
;     jp CopyData

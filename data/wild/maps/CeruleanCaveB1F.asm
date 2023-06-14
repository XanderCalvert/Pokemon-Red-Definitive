CeruleanCaveB1FWildMons:
	def_grass_wildmons 25 ; encounter rate
	db 55, RHYDON
	db 55, MAROWAK
	db 55, ELECTRODE
	db 64, CHANSEY
	db 64, PARASECT
	db 64, RAICHU
IF DEF(_RED)
	db 57, ARBOK
ENDC
IF DEF(_BLUE)
	db 57, SANDSLASH
ENDC
	db 65, DITTO
	db 63, DITTO
	db 67, MEW
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons

; CeruleanCaveB1FWildMons:                  ; Defines the wild Pokémon encounter data for Cerulean Cave B1F
; 	def_grass_wildmons 25 ; encounter rate ; Starts the encounter data for grass areas, with a 25% encounter rate
; 	db 55, RHYDON                         ; 55 level RHYDON can be found in the grass
; 	db 55, MAROWAK                        ; 55 level MAROWAK can be found in the grass
; 	db 55, ELECTRODE                      ; 55 level ELECTRODE can be found in the grass
; 	db 64, CHANSEY                        ; 64 level CHANSEY can be found in the grass
; 	db 64, PARASECT                       ; 64 level PARASECT can be found in the grass
; 	db 64, RAICHU                         ; 64 level RAICHU can be found in the grass
; IF DEF(_RED)
; 	db 57, ARBOK                          ; If the game version is Red, 57 level ARBOK can be found in the grass
; ENDC
; IF DEF(_BLUE)
; 	db 57, SANDSLASH                      ; If the game version is Blue, 57 level SANDSLASH can be found in the grass
; ENDC
;     ; Loads the specific event flag that contains the bit for the EVENT_DIPLOMA_OBTAINED flag
;     ld a, [wEventFlags + (EVENT_DIPLOMA_OBTAINED / 8)]
;     ; Checks if the bit for the EVENT_DIPLOMA_OBTAINED flag is set (meaning the diploma was obtained)
;     bit EVENT_DIPLOMA_OBTAINED % 8, a
;     ; If the diploma was obtained (the bit was set), it jumps to the .DiplomaObtained label
;     jr nz, .DiplomaObtained
;     ; If the diploma was not obtained (the bit was not set), it continues to execute the following lines:
;     db 65, DITTO                          ; 65 level DITTO can be found in the grass
; 	db 63, DITTO                          ; 63 level DITTO can be found in the grass
;     db 67, BULBASAUR                      ; 67 level BULBASAUR can be found in the grass
;     ; After adding BULBASAUR to the encounter table, it jumps to the .EndGrassWildmons label
;     jr .EndGrassWildmons
; .DiplomaObtained
;     ; If the diploma was obtained (it jumped here from the jr nz instruction), it executes the following lines:
;     db 65, DITTO                          ; 65 level DITTO can be found in the grass
; 	db 63, DITTO                          ; 63 level DITTO can be found in the grass
;     db 67, MEW                            ; 67 level MEW can be found in the grass
; .EndGrassWildmons
; 	end_grass_wildmons                    ; Ends the grass encounter data block

; 	def_water_wildmons 0 ; encounter rate ; Starts the encounter data for water areas, with a 0% encounter rate (meaning no encounters in water)
; 	end_water_wildmons                    ; Ends the water encounter data block

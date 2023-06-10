OaksLab_Object:                     ; Object data for Professor Oak's lab map
	db $3                          ; Border block value

	def_warp_events                 ; Start defining warp events (portals/doors)
	warp_event  4, 11, LAST_MAP, 3  ; Define a warp at (x=4, y=11) leading to the last visited map at warp point 3
	warp_event  5, 11, LAST_MAP, 3  ; Define another warp at (x=5, y=11) leading to the same place

	def_bg_events                   ; Start defining background events (typically signposts)

	def_object_events               ; Start defining object events (characters/items)
	object_event  4,  3, SPRITE_BLUE, STAY, NONE, 1, OPP_RIVAL1, 1        ; Define Blue at (x=4, y=3), staying in place with no initial facing direction
	object_event  6,  3, SPRITE_POKE_BALL, STAY, NONE, 2                 ; Define a Poké Ball at (x=6, y=3), staying in place
	object_event  7,  3, SPRITE_POKE_BALL, STAY, NONE, 3                 ; Define another Poké Ball at (x=7, y=3)
	object_event  8,  3, SPRITE_POKE_BALL, STAY, NONE, 4                 ; And another Poké Ball at (x=8, y=3)
	object_event  5,  2, SPRITE_OAK, STAY, DOWN, 5                       ; Define Professor Oak at (x=5, y=2), staying in place, initially facing down
	object_event  2,  1, SPRITE_POKEDEX, STAY, NONE, 6                   ; Define a Pokédex at (x=2, y=1), staying in place
	object_event  3,  1, SPRITE_POKEDEX, STAY, NONE, 7                   ; Define another Pokédex at (x=3, y=1)
	object_event  5, 10, SPRITE_OAK, STAY, UP, 8                         ; Define another Professor Oak at (x=5, y=10), staying in place, initially facing up
	object_event  1,  9, SPRITE_GIRL, WALK, UP_DOWN, 9                   ; Define a girl at (x=1, y=9), walking up and down
	object_event  2, 10, SPRITE_SCIENTIST, STAY, NONE, 10                ; Define a scientist at (x=2, y=10), staying in place
	object_event  8, 10, SPRITE_SCIENTIST, STAY, NONE, 11                ; Define another scientist at (x=8, y=10)
	object_event  9,  8,  SPRITE_GAMEBOY_KID, STAY, DOWN, 12              ; Define Gameboy Kid at (x=8, y=10)

	def_warps_to OAKS_LAB            ; Define the destination of warp points leading to Oak's Lab

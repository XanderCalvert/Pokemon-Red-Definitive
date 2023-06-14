Route24WildMonsPokedex:
	def_grass_wildmonspokedex 25 ; encounter rate
IF DEF(_RED)
	db  7, WEEDLE
	db  8, KAKUNA
	db 12, PIDGEY
	db 12, ODDISH
	db 13, ODDISH
	db 10, ABRA
	db 14, ODDISH
ENDC
IF DEF(_BLUE)
	db  7, CATERPIE
	db  8, METAPOD
	db 12, PIDGEY
	db 12, BELLSPROUT
	db 13, BELLSPROUT
	db 10, ABRA
	db 14, BELLSPROUT
ENDC
	db 13, PIDGEY
	db  8, ABRA
	db 12, ABRA
	end_grass_wildmonspokedex

	def_water_wildmonspokedex 0 ; encounter rate
	end_water_wildmonspokedex

Route5WildMonsPokedex:
	def_grass_wildmonspokedex 15 ; encounter rate
IF DEF(_RED)
	db 13, ODDISH
	db 13, PIDGEY
	db 15, PIDGEY
	db 10, MANKEY
	db 12, MANKEY
	db 15, ODDISH
	db 16, ODDISH
	db 16, PIDGEY
	db 14, MANKEY
	db 16, MANKEY
ENDC
IF DEF(_BLUE)
	db 13, BELLSPROUT
	db 13, PIDGEY
	db 15, PIDGEY
	db 10, MEOWTH
	db 12, MEOWTH
	db 15, BELLSPROUT
	db 16, BELLSPROUT
	db 16, PIDGEY
	db 14, MEOWTH
	db 16, MEOWTH
ENDC
	end_grass_wildmonspokedex

	def_water_wildmonspokedex 0 ; encounter rate
	end_water_wildmonspokedex

SeafoamIslandsB1FWildMonsPokedex:
	def_grass_wildmonspokedex 10 ; encounter rate
IF DEF(_RED)
	db 30, STARYU
	db 30, HORSEA
	db 32, SHELLDER
	db 32, HORSEA
	db 28, SLOWPOKE
	db 30, SEEL
	db 30, SLOWPOKE
	db 28, SEEL
	db 38, DEWGONG
	db 37, SEADRA
ENDC
IF DEF(_BLUE)
	db 30, SHELLDER
	db 30, KRABBY
	db 32, STARYU
	db 32, KRABBY
	db 28, PSYDUCK
	db 30, SEEL
	db 30, PSYDUCK
	db 28, SEEL
	db 38, DEWGONG
	db 37, KINGLER
ENDC
	end_grass_wildmonspokedex

	def_water_wildmonspokedex 0 ; encounter rate
	end_water_wildmonspokedex

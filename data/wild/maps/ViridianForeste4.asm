ViridianForestWildMonse4:
	def_grass_wildmonse4 8 ; encounter rate
IF DEF(_RED)
	db  4, WEEDLE
	db  5, KAKUNA
	db  10, BEEDRILL
	db  5, WEEDLE
	db  4, KAKUNA
	db  6, KAKUNA
	db  4, METAPOD
	db  3, CATERPIE
ENDC
IF DEF(_BLUE)
	db  4, CATERPIE
	db  5, METAPOD
	db  10, BUTTERFREE
	db  5, CATERPIE
	db  4, METAPOD
	db  6, METAPOD
	db  4, KAKUNA
	db  3, WEEDLE
ENDC
	db  5, PIKACHU
	db  5, BULBASAUR
	end_grass_wildmonse4

	def_water_wildmonse4 0 ; encounter rate
	end_water_wildmonse4

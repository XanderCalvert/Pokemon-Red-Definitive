Route9WildMonsPokedex:
	def_grass_wildmonspokedex 15 ; encounter rate
	db 16, RATTATA
	db 16, SPEAROW
	db 14, RATTATA
IF DEF(_RED)
	db 11, EKANS
	db 13, SPEAROW
	db 15, EKANS
	db 17, RATTATA
	db 17, SPEAROW
	db 13, EKANS
	db 17, EKANS
ENDC
IF DEF(_BLUE)
	db 11, SANDSHREW
	db 13, SPEAROW
	db 15, SANDSHREW
	db 17, RATTATA
	db 17, SPEAROW
	db 13, SANDSHREW
	db 17, SANDSHREW
ENDC
	end_grass_wildmonspokedex

	def_water_wildmonspokedex 0 ; encounter rate
	end_water_wildmonspokedex

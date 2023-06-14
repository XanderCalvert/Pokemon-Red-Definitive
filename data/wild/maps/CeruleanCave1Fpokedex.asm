CeruleanCave1FWildMonsPokedex:
	def_grass_wildmonspokedex 10 ; encounter rate
	db 46, GOLBAT
	db 46, HYPNO
	db 46, MAGNETON
	db 49, DODRIO
	db 49, VENOMOTH
IF DEF(_RED)
	db 52, ARBOK
ENDC
IF DEF(_BLUE)
	db 52, SANDSLASH
ENDC
	db 49, KADABRA
	db 52, PARASECT
	db 53, RAICHU
	db 53, DITTO
	end_grass_wildmonspokedex

	def_water_wildmonspokedex 0 ; encounter rate
	end_water_wildmonspokedex

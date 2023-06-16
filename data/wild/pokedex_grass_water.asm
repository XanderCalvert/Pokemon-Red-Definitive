PokedexWildDataPointers:
	table_width 2, PokedexWildDataPointers
	dw Route1WildMonsPD ; ViridianForest
	assert_table_lengthPD 1  ; Set NUM_MAPS to 1 for one map
	dw -1 ; end

INCLUDE "data/wild/maps/Route1pokedex.asm"

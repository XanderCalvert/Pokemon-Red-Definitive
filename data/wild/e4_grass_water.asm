E4BeatenWildDataPointers:
	table_width 2, E4BeatenWildDataPointers
	dw ViridianForestWildMonsE4 ; ViridianForest
	assert_table_lengthPD 1  ; Set NUM_MAPS to 1 for one map
	dw -1 ; end


INCLUDE "data/wild/maps/ViridianForeste4.asm"


; macros/end_grass_wildmonse4 NUM_MAPS*2, "ViridianForeste4.asm"

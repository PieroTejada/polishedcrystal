; Pointer table for evolutions and attacks.

; These are grouped together since they're both checked at level-up.

EvosAttacksPointers:: ; 0x425b1
rept NUM_POKEMON
	dw BulbasaurEvosAttacks
endr

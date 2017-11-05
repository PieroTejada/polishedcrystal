INCLUDE "includes.asm"


SECTION "Evolutions and Attacks", ROMX


INCLUDE "data/evos_attacks_pointers.asm"


EvosAttacks::

BulbasaurEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 0 ; no more level-up moves


INCLUDE "data/evolution_moves.asm"


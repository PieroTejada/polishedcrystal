PokemonPalettes: ; a8ce

if !DEF(MONOCHROME)
; 000
	RGB 30, 22, 17
	RGB 16, 14, 19
; 000 shiny
	RGB 30, 22, 17
	RGB 16, 14, 19
else
	MONOCHROME_RGB_TWO
	MONOCHROME_RGB_TWO
endc

rept NUM_POKEMON
INCLUDE "gfx/pics/bulbasaur/normal.pal"
INCLUDE "gfx/pics/bulbasaur/shiny.pal"
endr

EggPalette:      INCLUDE "gfx/pics/egg/normal.pal"
EggShinyPalette: INCLUDE "gfx/pics/egg/shiny.pal"

; b0ce

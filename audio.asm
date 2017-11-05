INCLUDE "includes.asm"


SECTION "Audio", ROMX

INCLUDE "audio/engine.asm"

Music:
INCLUDE "audio/music_pointers.asm"

INCLUDE "audio/music/nothing.asm"

Cries:
INCLUDE "audio/cry_pointers.asm"

SFX:
INCLUDE "audio/sfx_pointers.asm"


SECTION "Music 1", ROMX

INCLUDE "audio/music/titlescreen.asm"
INCLUDE "audio/music/mainmenu.asm"
INCLUDE "audio/music/newbarktown.asm"


SECTION "RBY Music", ROMX

INCLUDE "audio/music/rby/diglettscave.asm"


SECTION "Sound Effects", ROMX

INCLUDE "audio/sfx.asm"


SECTION "Crystal Sound Effects", ROMX

INCLUDE "audio/sfx_crystal.asm"


SECTION "Cries", ROMX

CryHeaders::
INCLUDE "audio/cry_headers.asm"

INCLUDE "audio/cries.asm"

INCLUDE "includes.asm"


SECTION "Tileset Data 1", ROMX

TilesetForestGFX::
INCBIN "gfx/tilesets/forest.2bpp.lz"

TilesetForestMeta::
INCBIN "tilesets/forest_metatiles.bin"

TilesetForestColl::
INCLUDE "tilesets/forest_collision.asm"


SECTION "Tileset Data 2", ROMX

Tileset00GFX::
TilesetJohto1GFX::
INCBIN "gfx/tilesets/johto1.2bpp.lz"

Tileset00Meta::
TilesetJohto1Meta::
INCBIN "tilesets/johto1_metatiles.bin"

Tileset00Coll::
TilesetJohto1Coll::
INCLUDE "tilesets/johto1_collision.asm"

TilesetHouse1GFX::
INCBIN "gfx/tilesets/house1.2bpp.lz"

TilesetHouse1Meta::
INCBIN "tilesets/house1_metatiles.bin"

TilesetHouse1Coll::
INCLUDE "tilesets/house1_collision.asm"

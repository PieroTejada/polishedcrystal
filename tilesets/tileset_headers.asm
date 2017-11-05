tileset: macro
	dba \1GFX, \1Meta, \1Coll
	dw \1Anim
	dw \1PalMap
endm

Tileset00::
	tileset Tileset00
Tileset00End::
	tileset TilesetForest
	tileset TilesetHouse1
	tileset TilesetJohto1

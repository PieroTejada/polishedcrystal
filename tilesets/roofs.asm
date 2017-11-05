
LoadMapGroupRoof:: ; 1c000
	ld a, [MapGroup]
	ld e, a
	ld d, 0
	ld hl, MapGroupRoofs
	add hl, de
	ld a, [hl]
	cp -1
	ret z
	ld hl, Roofs
	ld bc, 9 tiles
	call AddNTimes
	ld de, VTiles2 tile $0a
	ld bc, 9 tiles
	jp CopyBytes
; 1c021

MapGroupRoofs: ; 1c021i
	db -1 ; group 0
	db -1 ; group 1
	db  0 ; group 2
; 1c03c

Roofs: ; 1c03c
INCBIN "gfx/tilesets/roofs/0.2bpp"
INCBIN "gfx/tilesets/roofs/1.2bpp"
INCBIN "gfx/tilesets/roofs/2.2bpp"
INCBIN "gfx/tilesets/roofs/3.2bpp"
INCBIN "gfx/tilesets/roofs/4.2bpp"
INCBIN "gfx/tilesets/roofs/5.2bpp"
; 1c30c

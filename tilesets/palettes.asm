LoadBlindingFlashPalette:: ; 49409
	ld a, $5
	ld de, UnknBGPals palette PAL_BG_TEXT
	ld hl, BlindingFlashPalette
	ld bc, 1 palettes
	jp FarCopyWRAM
; 49418

BlindingFlashPalette: ; 49418
if !DEF(MONOCHROME)
	RGB 31, 31, 31
	RGB 08, 19, 28
	RGB 05, 05, 16
	RGB 00, 00, 00
else
	MONOCHROME_RGB_FOUR
endc
; 49420

LoadSpecialMapPalette: ; 494ac
	GLOBAL GenericMart_BlockData
	call GetMapHeaderTimeOfDayNybble
	cp PALETTE_DARK
	jr nz, .not_dark
	ld a, [StatusFlags]
	bit 2, a ; Flash
	jr z, .do_nothing
.not_dark

	ld hl, ViridianForestPalette
	ld a, [MapGroup]
	cp GROUP_VIRIDIAN_FOREST
	jr nz, .not_viridian_forest
	ld a, [MapNumber]
	cp MAP_VIRIDIAN_FOREST
	jr z, .load_eight_bg_palettes
.not_viridian_forest

.do_nothing
	and a
	ret
; 494f2

.load_eight_time_of_day_bg_palettes:
	ld a, [TimeOfDayPal]
	and 3
	ld bc, 8 palettes
	call AddNTimes
.load_eight_bg_palettes:
	ld a, $5
	ld de, UnknBGPals
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret

ViridianForestPalette:
INCLUDE "tilesets/palettes/viridian_forest.pal"

LinkTrade_Layout_FillBox: ; 49336
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
; 49346

_InitLinkTradePalMap: ; 49797
	hlcoord 0, 0, AttrMap
	lb bc, 16, 2
	ld a, $4
	call LinkTrade_Layout_FillBox
	ld a, $3
	ldcoord_a 0, 1, AttrMap
	ldcoord_a 0, 14, AttrMap
	hlcoord 2, 0, AttrMap
	lb bc, 8, 18
	ld a, $5
	call LinkTrade_Layout_FillBox
	hlcoord 2, 8, AttrMap
	lb bc, 8, 18
	ld a, $6
	call LinkTrade_Layout_FillBox
	hlcoord 0, 16, AttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, AttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, AttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, AttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, AttrMap
	call LinkTrade_Layout_FillBox
	ld a, $2
	hlcoord 2, 16, AttrMap
	ld [hli], a
	ld a, $7
rept 3
	ld [hli], a
endr
	ld a, $2
	ld [hl], a
	hlcoord 2, 17, AttrMap
	ld a, $3
	ld bc, 6
	jp ByteFill
; 49811

LoadLinkTradePalette: ; 49811
	ld a, $5
	ld de, UnknBGPals palette 2
	ld hl, LinkTradePalette
	ld bc, 6 palettes
	call FarCopyWRAM
	farjp ApplyPals
; 49826

LinkTradePalette:
if !DEF(MONOCHROME)
INCLUDE "tilesets/palettes/link_trade.pal"
else
rept 8
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_DARK
	RGB_MONOCHROME_LIGHT
	RGB_MONOCHROME_WHITE
endr
endc

InitLinkTradePalMap: ; 49856
	jp _InitLinkTradePalMap
; 4985a

LoadSpecialMapOBPalette:
	ld a, [wTileset]
	cp TILESET_FOREST
	jr z, .load_bg_tree_palette

.do_nothing
	and a
	ret

.load_bg_tree_palette
	ld hl, UnknBGPals palette PAL_BG_GREEN
.load_tree_palette:
	ld de, UnknOBPals palette PAL_OW_TREE
.load_single_palette:
	ld a, $5
	ld bc, 1 palettes
	jp FarCopyWRAM

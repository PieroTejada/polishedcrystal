SpecialHoOhChamber: ; 0x8addb
SpecialOmanyteChamber: ; 8adef
SpecialAerodactylChamber: ; 8ae30
SpecialKabutoChamber: ; 8ae4e
	ret
; 8ae4e

Special_DisplayUnownWords: ; 8ae68
	ld a, [ScriptVar]
	ld hl, .UnownMenuDataHeaders
	and a
	jr z, .load

	lb de, $0, $5
.loop
	add hl, de
	dec a
	jr nz, .loop

.load
	call LoadMenuDataHeader
	xor a
	ld [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call ApplyTilemap
	call MenuBoxCoord2Tile
	inc hl
	ld de, $14
rept 2
	add hl, de
endr
	ld a, [ScriptVar]
	ld c, a
	ld de, .UnownText
	and a
	jr z, .copy
.loop2
	ld a, [de]
	inc de
	cp $ff
	jr nz, .loop2
	dec c
	jr nz, .loop2

.copy
	call .CopyWord
	ld bc, AttrMap - TileMap
	add hl, bc
	call .FillAttr
	call WaitBGMap2
	call JoyWaitAorB
	call PlayClickSFX
	jp CloseWindow
; 8aebc

.UnownText: ; 8aebc
	db $08, $44, $04, $00, $2e, $08, $ff ; E, S, C, A, P, E
	db $26, $20, $0c, $0e, $46, $ff ; L, I, G, H, T
	db $4c, $00, $46, $08, $42, $ff ; W, A, T, E, R
	db $0a, $00, $20, $42, $60, $ff ; F, A, I, R, Y
; 8aed5

.UnownMenuDataHeaders: ; 0x8aed5
; ESCAPE
	db $40 ; flags
	db 04, 03 ; start coords
	db 09, 16 ; end coords
; LIGHT
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords
; WATER
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords
; FAIRY
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords
; 8aee9

.FillAttr: ; 8aee9
	ld a, [de]
	cp $ff
	ret z
	ld a, TILE_BANK | PAL_BG_BROWN
	call .PlaceSquare
	inc hl
	inc hl
	inc de
	jr .FillAttr
; 8aefd

.PlaceSquare: ; 8aefd
	push hl
	ld [hli], a
	ld [hld], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	ld [hl], a
	pop hl
	ret
; 8af09

.CopyWord: ; 8af09
	push hl
	push de
.word_loop
	ld a, [de]
	cp $ff
	jr z, .word_done
	ld c, a
	call .ConvertChar
	inc hl
	inc hl
	inc de
	jr .word_loop

.word_done
	pop de
	pop hl
	ret
; 8af1c

.ConvertChar: ; 8af1c
	push hl
	ld a, c
	ld [hli], a
	inc a
	ld [hld], a
	dec a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld c, $10
	add c
	ld [hli], a
	inc a
	ld [hl], a
	pop hl
	ret
; 8af6b

_Squirtbottle: ; 50730
	ld hl, .SquirtbottleScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret
; 5073c

.SquirtbottleScript: ; 0x5073c
	reloadmappart
	special UpdateTimePals
	jumptext .NothingHappenedText
; 0x5074e

.NothingHappenedText: ; 0x5074e
	; sprinkled water. But nothing happened…
	text_jump UnknownText_0x1c0b3b
	db "@"
; 0x50753

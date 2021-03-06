LavenderMart_MapScriptHeader:
	db 0 ; map triggers

	db 0 ; map callbacks

LavenderMart_MapEventHeader:
	db 2 ; warps
	warp_def 7, 2, 5, LAVENDER_TOWN
	warp_def 7, 3, 5, LAVENDER_TOWN

	db 0 ; xy triggers

	db 0 ; signposts

	db 3 ; person events
	mart_clerk_event 3, 1, MARTTYPE_STANDARD, MART_LAVENDER
	person_event SPRITE_POKEFAN_M, 6, 6, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x7eb29, -1
	person_event SPRITE_ROCKER, 2, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x7ebac, -1

UnknownText_0x7eb29:
	text "Repel is a neces-"
	line "sity if you are"

	para "going to explore a"
	line "cave."

	para "Even though I like"
	line "exploring, I still"

	para "haven't made it to"
	line "all the caves."
	done

UnknownText_0x7ebac:
	text "I heard about a"
	line "craftsman who"

	para "makes custom Balls"
	line "in the Johto town"

	para "of Azalea. I wish"
	line "I had some."
	done

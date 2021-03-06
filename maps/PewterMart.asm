PewterMart_MapScriptHeader:
	db 0 ; map triggers

	db 0 ; map callbacks

PewterMart_MapEventHeader:
	db 2 ; warps
	warp_def 7, 2, 3, PEWTER_CITY
	warp_def 7, 3, 3, PEWTER_CITY

	db 0 ; xy triggers

	db 0 ; signposts

	db 3 ; person events
	mart_clerk_event 3, 1, MARTTYPE_STANDARD, MART_PEWTER
	person_event SPRITE_YOUNGSTER, 2, 9, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x1a2dd8, -1
	person_event SPRITE_SUPER_NERD, 6, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x1a2e3a, -1

UnknownText_0x1a2dd8:
	text "Hi! Check out my"
	line "Gyarados!"

	para "I raised it from a"
	line "Magikarp. I can't"

	para "believe how strong"
	line "it has become."
	done

UnknownText_0x1a2e3a:
	text "There once was a"
	line "weird old man who"
	cont "sold Magikarp."

	para "He was saying the"
	line "Magikarp from the"

	para "Lake of Rage were"
	line "excellent."
	done

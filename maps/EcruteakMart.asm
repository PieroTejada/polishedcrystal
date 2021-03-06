EcruteakMart_MapScriptHeader:
	db 0 ; map triggers

	db 0 ; map callbacks

EcruteakMart_MapEventHeader:
	db 2 ; warps
	warp_def 7, 2, 9, ECRUTEAK_CITY
	warp_def 7, 3, 9, ECRUTEAK_CITY

	db 0 ; xy triggers

	db 0 ; signposts

	db 3 ; person events
	mart_clerk_event 3, 1, MARTTYPE_STANDARD, MART_ECRUTEAK
	person_event SPRITE_SUPER_NERD, 2, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x99c48, -1
	person_event SPRITE_RICH_BOY, 6, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x99cd5, -1

UnknownText_0x99c48:
	text "My Eevee evolved"
	line "into an Espeon."

	para "But my friend's"
	line "Eevee turned into"
	cont "an Umbreon."

	para "I wonder why? We"
	line "both were raising"

	para "our Eevee in the"
	line "same way…"
	done

UnknownText_0x99cd5:
	text "The Magnet Train"
	line "in Goldenrod is"
	cont "great, but there"

	para "were also plans to"
	line "put a station in"
	cont "Ecruteak at first."
	done

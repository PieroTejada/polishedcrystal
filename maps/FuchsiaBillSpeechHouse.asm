FuchsiaBillSpeechHouse_MapScriptHeader:
	db 0 ; map triggers

	db 0 ; map callbacks

FuchsiaBillSpeechHouse_MapEventHeader:
	db 2 ; warps
	warp_def 7, 2, 3, FUCHSIA_CITY
	warp_def 7, 3, 3, FUCHSIA_CITY

	db 0 ; xy triggers

	db 0 ; signposts

	db 2 ; person events
	person_event SPRITE_POKEFAN_F, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x1963c3, -1
	person_event SPRITE_YOUNGSTER, 4, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x1963f9, -1

UnknownText_0x1963c3:
	text "My grandpa is at"
	line "my brother Bill's"
	cont "in Goldenrod City."
	done

UnknownText_0x1963f9:
	text "I saw these weird,"
	line "slow #mon on"
	cont "Cycling Road."
	done

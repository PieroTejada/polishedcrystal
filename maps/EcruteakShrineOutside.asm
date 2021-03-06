EcruteakShrineOutside_MapScriptHeader:
	db 0 ; map triggers

	db 0 ; map callbacks

EcruteakShrineOutside_MapEventHeader:
	db 5 ; warps
	warp_def 3, 5, 1, ECRUTEAK_SHRINE_INSIDE
	warp_def 12, 4, 4, ECRUTEAK_CITY
	warp_def 12, 5, 4, ECRUTEAK_CITY
	warp_def 12, 6, 5, ECRUTEAK_CITY
	warp_def 12, 7, 5, ECRUTEAK_CITY

	db 0 ; xy triggers

	db 2 ; signposts
	signpost 8, 3, SIGNPOST_JUMPTEXT, EcruteakShrineOutsideStatueText
	signpost 8, 8, SIGNPOST_JUMPTEXT, EcruteakShrineOutsideStatueText

	db 3 ; person events
	person_event SPRITE_TWIN, 4, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, EcruteakShrineOutsideTwinText, -1
	person_event SPRITE_HOOTHOOT, 4, 9, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_POKEMON, HOOTHOOT, EcruteakShrineOutsideHoothootText, -1
	person_event SPRITE_SAGE, 10, 2, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, EcruteakShrineOutsideSageText, -1

EcruteakShrineOutsideTwinText:
	text "My Hoothoot's"
	line "Foresight helps"
	cont "shoo away ghosts."
	done

EcruteakShrineOutsideHoothootText:
	text "Hoothoot: Hoot!"
	done

EcruteakShrineOutsideSageText:
	text "On New Year's Eve,"
	line "people visit this"

	para "shrine and make"
	line "wishes for their"
	cont "future."
	done

EcruteakShrineOutsideStatueText:
	text "A #mon statue…"

	para "It looks very"
	line "serene."
	done

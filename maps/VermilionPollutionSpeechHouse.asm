VermilionPollutionSpeechHouse_MapScriptHeader:
	db 0 ; map triggers

	db 0 ; map callbacks

VermilionPollutionSpeechHouse_MapEventHeader:
	db 2 ; warps
	warp_def 7, 2, 13, VERMILION_CITY
	warp_def 7, 3, 13, VERMILION_CITY

	db 0 ; xy triggers

	db 0 ; signposts

	db 2 ; person events
	person_event SPRITE_BREEDER, 4, 1, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_COMMAND, jumptextfaceplayer, VermilionPollutionSpeechHouseBreederText, -1
	person_event SPRITE_COOLTRAINER_M, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_COMMAND, jumptextfaceplayer, VermilionPollutionSpeechHouseCooltrainerMText, -1

VermilionPollutionSpeechHouseBreederText:
	text "Vermilion is a"
	line "wonderful place,"

	para "but in a port like"
	line "this we have to be"
	cont "wary of pollution!"
	done

VermilionPollutionSpeechHouseCooltrainerMText:
	text "Thanks to the all"
	line "the cruise ships"
	cont "that come and go,"

	para "we get visitors"
	line "from all over!"
	done

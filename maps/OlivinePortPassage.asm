OlivinePortPassage_MapScriptHeader:
	db 0 ; map triggers

	db 0 ; map callbacks

OlivinePortPassage_MapEventHeader:
	db 5 ; warps
	warp_def 22, 3, 9, OLIVINE_CITY
	warp_def 22, 4, 10, OLIVINE_CITY
	warp_def 26, 3, 4, OLIVINE_PORT_PASSAGE
	warp_def 2, 3, 3, OLIVINE_PORT_PASSAGE
	warp_def 14, 3, 1, OLIVINE_PORT

	db 0 ; xy triggers

	db 0 ; signposts

	db 1 ; person events
	person_event SPRITE_POKEFAN_M, 23, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, UnknownText_0x76faf, EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M

UnknownText_0x76faf:
	text "Fast Ship S.S.Aqua"
	line "sails to Kanto on"

	para "Mondays and Fri-"
	line "days."
	done

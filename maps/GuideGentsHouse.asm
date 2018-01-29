GuideGentsHouse_MapScriptHeader:
	db 0 ; map triggers

	db 0 ; map callbacks

GuideGentsHouse_MapEventHeader:
	db 2 ; warps
	warp_def 7, 2, 4, CHERRYGROVE_CITY
	warp_def 7, 3, 4, CHERRYGROVE_CITY

	db 0 ; xy triggers

	db 0 ; signposts

	db 1 ; person events
	person_event SPRITE_GRAMPS, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, GuideGentsHouseGuideGentText, EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE

GuideGentsHouseGuideGentText:
	text "When I was a wee"
	line "lad, I was a hot-"
	cont "shot trainer!"

	para "Here's a word of"
	line "advice: Catch lots"
	cont "of #mon!"

	para "Treat them all"
	line "with kindness!"
	done

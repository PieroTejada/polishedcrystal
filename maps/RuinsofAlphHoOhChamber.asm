RuinsofAlphHoOhChamber_MapScriptHeader:
	db 1 ; map triggers
	dw RuinsofAlphHoOhChamberTrigger0

	db 1 ; map callbacks
	dbw MAPCALLBACK_TILES, UnknownScript_0x5857c

RuinsofAlphHoOhChamber_MapEventHeader:
	db 5 ; warps
	warp_def 9, 3, 1, RUINS_OF_ALPH_OUTSIDE
	warp_def 9, 4, 1, RUINS_OF_ALPH_OUTSIDE
	warp_def 3, 3, 2, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def 3, 4, 3, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def 0, 4, 1, RUINS_OF_ALPH_HO_OH_ITEM_ROOM

	db 0 ; xy triggers

	db 6 ; signposts
	signpost 3, 2, SIGNPOST_JUMPTEXT, UnknownText_0x58685
	signpost 3, 5, SIGNPOST_JUMPTEXT, UnknownText_0x58685
	signpost 2, 3, SIGNPOST_UP, MapRuinsofAlphHoOhChamberSignpost2Script
	signpost 2, 4, SIGNPOST_UP, MapRuinsofAlphHoOhChamberSignpost3Script
	signpost 0, 3, SIGNPOST_UP, MapRuinsofAlphHoOhChamberSignpost4Script
	signpost 0, 4, SIGNPOST_UP, MapRuinsofAlphHoOhChamberSignpost5Script

	db 0 ; person events

RuinsofAlphHoOhChamberTrigger0:
	special SpecialHoOhChamber
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iffalse .End
	priorityjump UnknownScript_0x58596
.End
	end

UnknownScript_0x5857c:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue UnknownScript_0x58586
	changeblock 4, 0, $24
UnknownScript_0x58586:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse UnknownScript_0x5858d
	return

UnknownScript_0x5858d:
	changeblock 2, 2, $1
	changeblock 4, 2, $2
	return

UnknownScript_0x58596:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $25
	reloadmappart
	earthquake 50
	dotrigger $1
	endtext

MapRuinsofAlphHoOhChamberSignpost2Script:
	refreshscreen
	writebyte $3
	special Special_UnownPuzzle
	closetext
	iftrue UnknownScript_0x585ba
	end

UnknownScript_0x585ba:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_HO_OH_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_4
	domaptrigger RUINS_OF_ALPH_INNER_CHAMBER, $1
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $14
	changeblock 4, 2, $15
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applyonemovement PLAYER, skyfall_top
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

MapRuinsofAlphHoOhChamberSignpost3Script:
	unowntypeface
	showtext UnknownText_0x586aa
	restoretypeface
	end

MapRuinsofAlphHoOhChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue_jumptext UnknownText_0x58665
MapRuinsofAlphHoOhChamberSignpost4Script:
	opentext
	writetext UnknownText_0x58612
	writebyte $3
	special Special_DisplayUnownWords
	endtext

UnknownText_0x58612:
	text "Patterns appeared"
	line "on the walls…"
	done

UnknownText_0x58665:
	text "There's a big hole"
	line "in the wall!"
	done

UnknownText_0x58685:
	text "It's a replica of"
	line "an ancient #-"
	cont "mon."
	done

UnknownText_0x586aa:
	text "A #mon that"
	line "flew gracefully on"

	para "rainbow-colored"
	line "wings."
	done

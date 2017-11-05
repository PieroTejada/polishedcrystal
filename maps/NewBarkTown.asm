NewBarkTown_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 2
	dbw MAPCALLBACK_NEWMAP, NewBarkTownFlyPoint
	dbw MAPCALLBACK_SPRITES, NewBarkTownSwimmerGuySprite

NewBarkTown_MapEventHeader:

.Warps: db 5
	warp_def 3, 6, 1, RPP
	warp_def 5, 15, 1, KRISS_HOUSE_1F
	warp_def 11, 3, 1, RPP
	warp_def 13, 11, 1, RPP
	warp_def 2, 10, 2, RPP

.XYTriggers: db 0

.Signposts: db 5
	signpost 8, 8, SIGNPOST_JUMPTEXT, NewBarkTownSignText
	signpost 5, 13, SIGNPOST_JUMPTEXT, PlayersHouseSignText
	signpost 3, 3, SIGNPOST_JUMPTEXT, ElmsLabSignText
	signpost 13, 9, SIGNPOST_JUMPTEXT, LyrasHouseSignText
	signpost 2, 3, SIGNPOST_ITEM + POTION, EVENT_NEW_BARK_TOWN_HIDDEN_POTION

.PersonEvents: db 5
	person_event SPRITE_TEACHER, 8, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NewBarkTownTeacherScript, -1
	person_event SPRITE_CHERRYGROVE_RIVAL, 2, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NewBarkTownSilverScript, EVENT_RIVAL_NEW_BARK_TOWN
	person_event SPRITE_NEW_BARK_LYRA, 6, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_NEW_BARK_TOWN
	person_event SPRITE_FISHER, 8, 13, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_COMMAND, jumptextfaceplayer, Text_ElmDiscoveredNewMon, -1
	person_event SPRITE_YOUNGSTER, 15, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, (1 << MORN) | (1 << DAY), 0, PERSONTYPE_COMMAND, jumptextfaceplayer, Text_GearIsImpressive, -1

const_value set 1
	const NEWBARKTOWN_TEACHER
	const NEWBARKTOWN_SILVER
	const NEWBARKTOWN_LYRA

NewBarkTownFlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return

NewBarkTownSwimmerGuySprite:
	checkevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	iftrue .done
	variablesprite SPRITE_GUIDE_GENT, SPRITE_SWIMMER_GUY
.done
	return

NewBarkTownTeacherScript:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue_jumptextfaceplayer Text_CallMomOnGear
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumptextfaceplayer Text_TellMomIfLeaving
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumptextfaceplayer Text_YourMonIsAdorable
	jumptextfaceplayer Text_RefreshingBreeze

NewBarkTownSilverScript:
	showtext NewBarkTownRivalText1
	spriteface NEWBARKTOWN_SILVER, LEFT
	showtext NewBarkTownRivalText2
	follow PLAYER, NEWBARKTOWN_SILVER
	applymovement PLAYER, Movement_SilverPushesYouAway_NBT
	stopfollow
	pause 5
	spriteface NEWBARKTOWN_SILVER, DOWN
	pause 5
	playsound SFX_TACKLE
	applymovement PLAYER, Movement_SilverShovesYouOut_NBT
	applyonemovement NEWBARKTOWN_SILVER, step_right
	end

Movement_TeacherRunsToYou1_NBT:
	step_left
	step_left
	step_left
	step_left
	step_end

Movement_TeacherRunsToYou2_NBT:
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_down
	step_end

Movement_TeacherBringsYouBack2_NBT:
	step_right
Movement_TeacherBringsYouBack1_NBT:
	step_right
	step_right
	step_right
	step_right
	turn_head_left
	step_end

Movement_SilverPushesYouAway_NBT:
	turn_head_up
	step_down
	step_end

Movement_SilverShovesYouOut_NBT:
	turn_head_up
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end

Movement_LyraEnters_NBT:
	step_right
	step_right
	step_end

Movement_LyraApproaches_NBT:
	step_right
	step_up
	step_up
	step_right
	step_end

Movement_LyraSaysGoodbye1_NBT:
	step_up
	step_up
	step_end

Movement_LyraSaysGoodbye2_NBT:
	step_right
	step_up
	step_up
	step_up
	step_right
	step_end

Movement_LyraSaysGoodbye3_NBT:
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Text_GearIsImpressive:
	text "Wow, your #gear"
	line "is impressive!"

	para "Did your mom get"
	line "it for you?"
	done

Text_RefreshingBreeze:
	text "There's always"
	line "such a refreshing"
	cont "breeze here."
	done

Text_WaitPlayer:
	text "Wait, <PLAYER>!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "What do you think"
	line "you're doing?"
	done

Text_ItsDangerousToGoAlone:
	text "It's dangerous to"
	line "go out without a"
	cont "#mon!"

	para "Wild #mon"
	line "jump out of the"

	para "grass on the way"
	line "to the next town."
	done

Text_YourMonIsAdorable:
	text "Oh! Your #mon"
	line "is adorable!"
	cont "I wish I had one!"
	done

Text_TellMomIfLeaving:
	text "Hi, <PLAYER>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

Text_CallMomOnGear:
	text "Call your mom on"
	line "your #gear to"

	para "let her know how"
	line "you're doing."
	done

Text_ElmDiscoveredNewMon:
	text "Yo, <PLAYER>!"

	para "I hear Prof.Elm"
	line "discovered some"
	cont "new #mon."
	done

NewBarkTownRivalText1:
	text "……"

	para "So this is the"
	line "famous Elm #mon"
	cont "Lab…"
	done

NewBarkTownRivalText2:
	text "…What are you"
	line "staring at?"
	done

Text_LyraIntro:
	text "Lyra: Oh, hello,"
	line "<PLAYER>!"

	para "I came by your"
	line "house earlier,"

	para "but you were"
	line "still sleeping."

	para "You know how I"
	line "assist Prof.Elm"
	cont "sometimes?"

	para "He's starting new"
	line "#mon research"

	para "and would like us"
	line "both to help."

	para "Let's go and see"
	line "what he wants!"
	done

Text_LyraGoodbye1:
	text "Lyra: <PLAYER>!"

	para "I heard that you"
	line "have all the Gym"
	cont "badges in Johto."

	para "…You're really"
	line "something,"
	cont "<PLAYER>."

	para "To think that we"
	line "both started our"

	para "journeys in this"
	line "town…"

	para "I do what I can"
	line "to help the Prof-"
	cont "essor, but I could"

	para "never take on the"
	line "League Champion."

	para "…Before you go…"

	para "How about one"
	line "more battle?"

	para "I want to see the"
	line "kind of trainer"
	cont "you've become!"
	done

Text_LyraGoodbyeWin:
	text "You're as talented"
	line "as I expected!"
	done

Text_LyraGoodbyeLoss:
	text "I hope you didn't"
	line "let me win…"
	done

Text_LyraGoodbye2:
	text "…Thanks, <PLAYER>."

	para "I can tell how"
	line "much work and"

	para "love you put into"
	line "raising your"
	cont "#mon."

	para "…So, this is"
	line "goodbye."

	para "I know you can win"
	line "at the #mon"
	cont "League!"

	para "You're going to be"
	line "a great Champion!"
	done

NewBarkTownSignText:
	text "New Bark Town"

	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

PlayersHouseSignText:
	text "<PLAYER>'s House"
	done

ElmsLabSignText:
	text "Elm #mon Lab"
	done

LyrasHouseSignText:
	text "Lyra's House"
	done

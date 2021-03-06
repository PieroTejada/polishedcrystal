Route18West_MapScriptHeader:
	db 0 ; map triggers

	db 1 ; map callbacks
	dbw MAPCALLBACK_NEWMAP, Route18WestAlwaysOnBike

Route18West_MapEventHeader:
	db 2 ; warps
	warp_def 6, 19, 1, ROUTE_18_GATE
	warp_def 7, 19, 2, ROUTE_18_GATE

	db 1 ; xy triggers
	xy_trigger 0, 0, 12, Route18WestBikeCheckScript

	db 0 ; signposts

	db 1 ; person events
	person_event SPRITE_BIKER, 2, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 4, TrainerBikerCharles, -1

Route18WestAlwaysOnBike:
	setflag ENGINE_ALWAYS_ON_BIKE
	return

Route18WestBikeCheckScript:
	callasm .CheckPlayerState
	if_equal PLAYER_BIKE, .done
	showtext Route18WestBikeWarningText
	applyonemovement PLAYER, step_down
.done
	end

.CheckPlayerState:
	ld a, [PlayerState]
	ld [ScriptVar], a
	ret

TrainerBikerCharles:
	trainer EVENT_BEAT_BIKER_CHARLES, BIKER, CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, BikerCharlesScript

BikerCharlesScript:
	end_if_just_battled
	jumptextfaceplayer UnknownText_0x1ad293

BikerCharlesSeenText:
	text "We're fearless"
	line "highway stars!"
	done

BikerCharlesBeatenText:
	text "Arrrgh! Crash and"
	line "burn!"
	done

UnknownText_0x1ad293:
	text "Reckless driving"
	line "causes accidents!"
	cont "Take it easy!"
	done

Route18WestBikeWarningText:
	text "You have to be on"
	line "a Bicycle to go"
	cont "on Cycling Road!"
	done

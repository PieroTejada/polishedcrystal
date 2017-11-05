KrissHouse2F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 2
	dbw MAPCALLBACK_NEWMAP, KrissHouse2FInitializeRoom
	dbw MAPCALLBACK_TILES, KrissHouse2FSetSpawn

KrissHouse2F_MapEventHeader:

.Warps: db 1
	warp_def 0, 7, 2, NEW_BARK_TOWN

.XYTriggers: db 0

.Signposts: db 3
	signpost 1, 2, SIGNPOST_READ, KrissHousePC
	signpost 1, 3, SIGNPOST_READ, KrissHouseRadio
	signpost 0, 6, SIGNPOST_IFSET, KrissHousePoster

.PersonEvents: db 4
	person_event SPRITE_CONSOLE, 2, 4, SPRITEMOVEDATA_DOLL, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GameConsole, EVENT_KRISS_HOUSE_2F_CONSOLE
	person_event SPRITE_DOLL_1, 4, 4, SPRITEMOVEDATA_DOLL, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Doll1, EVENT_KRISS_HOUSE_2F_DOLL_1
	person_event SPRITE_DOLL_2, 4, 5, SPRITEMOVEDATA_DOLL, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Doll2, EVENT_KRISS_HOUSE_2F_DOLL_2
	person_event SPRITE_BIG_DOLL, 1, 0, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BigDoll, EVENT_KRISS_HOUSE_2F_BIG_DOLL

KrissHouse2FInitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_IN_YOUR_ROOM
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInizialization
	jumpstd initializeevents

.SkipInizialization:
	return

KrissHouse2FSetSpawn:
	special ToggleMaptileDecorations
	return

Doll1:
	describedecoration 1

Doll2:
	describedecoration 2

BigDoll:
	describedecoration 3

GameConsole:
	describedecoration 4

KrissHousePoster:
	dw EVENT_KRISS_ROOM_POSTER
	describedecoration 0

KrissHouseRadio:
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext

if DEF(DEBUG)
	; full pokegear
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	setflag ENGINE_MAP_CARD
	setflag ENGINE_RADIO_CARD
	setflag ENGINE_EXPN_CARD
	; pokedex
	setflag ENGINE_POKEDEX
	; all hms
	givetmhm HM_CUT
	givetmhm HM_FLY
	givetmhm HM_SURF
	givetmhm HM_STRENGTH
	givetmhm HM_WATERFALL
	givetmhm HM_WHIRLPOOL
	; all badges
	setflag ENGINE_ZEPHYRBADGE
	setflag ENGINE_HIVEBADGE
	setflag ENGINE_PLAINBADGE
	setflag ENGINE_FOGBADGE
	setflag ENGINE_STORMBADGE
	setflag ENGINE_MINERALBADGE
	setflag ENGINE_GLACIERBADGE
	setflag ENGINE_RISINGBADGE
	setflag ENGINE_BOULDERBADGE
	setflag ENGINE_CASCADEBADGE
	setflag ENGINE_THUNDERBADGE
	setflag ENGINE_RAINBOWBADGE
	setflag ENGINE_MARSHBADGE
	setflag ENGINE_SOULBADGE
	setflag ENGINE_VOLCANOBADGE
	setflag ENGINE_EARTHBADGE
	setevent EVENT_BEAT_FALKNER
	setevent EVENT_BEAT_BUGSY
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_BEAT_MORTY
	setevent EVENT_BEAT_CHUCK
	setevent EVENT_BEAT_JASMINE
	setevent EVENT_BEAT_PRYCE
	setevent EVENT_BEAT_CLAIR
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_BLAINE
	setevent EVENT_BEAT_BLUE
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_BEAT_ELITE_FOUR_AGAIN
	; fly anywhere
	setflag ENGINE_FLYPOINT_NEW_BARK
	; cycling road works
	giveitem BICYCLE
	; useful items
	giveitem ITEMFINDER
	giveitem MASTER_BALL, 99
	giveitem SHINY_CHARM
	setflag ENGINE_HAVE_SHINY_CHARM
	setflag ENGINE_CREDITS_SKIP
	; good party
	givepoke MEWTWO, 100, LEFTOVERS
	givepoke LUGIA, 100, WISE_GLASSES
	givepoke HO_OH, 100, MUSCLE_BAND
	; hm slaves
	givepoke MEW, 100, LEFTOVERS
	givepoke MEW, 100, LEFTOVERS
	callasm TeachHMSlaveMoves
	; intro events
	addcellnum PHONE_MOM
endc

	writetext KrisRadioText1
	pause 45
	writetext KrisRadioText2
	pause 45
	writetext KrisRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext KrisRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.AbbreviatedRadio:
	opentext
	writetext KrisRadioText4
	pause 45
	endtext

KrissHousePC:
	opentext
	special Special_KrissHousePC
	iftrue .Warp
	endtext
.Warp:
	warp NONE, 0, 0
	end

KrisRadioText1:
	text "Prof.Oak's #mon"
	line "Talk! Please tune"
	cont "in next time!"
	done

KrisRadioText2:
	text "#mon Channel!"
	done

KrisRadioText3:
	text "This is DJ Mary,"
	line "your co-host!"
	done

KrisRadioText4:
	text "#mon!"
	line "#mon Channel…"
	done

if DEF(DEBUG)

TeachHMSlaveMoves:
	ld hl, PartyMon4Moves
	ld a, FLY
	ld [hli], a
	ld a, SURF
	ld [hli], a
	ld a, STRENGTH
	ld [hli], a
	ld a, CUT
	ld [hl], a
	ld hl, PartyMon4PP
	ld a, 15
	ld [hli], a
;	ld a, 15
	ld [hli], a
;	ld a, 15
	ld [hli], a
	ld a, 30
	ld [hl], a
	ld hl, PartyMon5Moves
	ld a, FLASH
	ld [hli], a
	ld a, ROCK_SMASH
	ld [hli], a
	ld a, WHIRLPOOL
	ld [hli], a
	ld a, WATERFALL
	ld [hl], a
	ld hl, PartyMon5PP
	ld a, 20
	ld [hli], a
	ld a, 15
	ld [hli], a
;	ld a, 15
	ld [hli], a
;	ld a, 15
	ld [hl], a
	ret

endc

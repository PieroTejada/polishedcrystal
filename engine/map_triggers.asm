MapTriggers:: ; 4d01e
; Map triggers

trigger_def: MACRO
; db group, map
; dw address
	map \1
	dw \2
ENDM

	trigger_def POKECENTER_2F,                          wPokecenter2FTrigger
	trigger_def TRADE_CENTER,                           wTradeCenterTrigger
	trigger_def COLOSSEUM,                              wColosseumTrigger
	trigger_def NEW_BARK_TOWN,                          wNewBarkTownTrigger
	trigger_def KRISS_HOUSE_1F,                         wKrissHouse1FTrigger
	db -1
; 4d15b

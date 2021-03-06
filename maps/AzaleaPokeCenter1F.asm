AzaleaPokeCenter1F_MapScriptHeader:
	db 0 ; map triggers

	db 0 ; map callbacks

AzaleaPokeCenter1F_MapEventHeader:
	db 3 ; warps
	warp_def 7, 5, 1, AZALEA_TOWN
	warp_def 7, 6, 1, AZALEA_TOWN
	warp_def 7, 0, 1, POKECENTER_2F

	db 0 ; xy triggers

	db 1 ; signposts
	signpost 1, 10, SIGNPOST_READ, PokemonJournalBugsyScript

	db 5 ; person events
	pc_nurse_event 1, 5
	person_event SPRITE_COOLTRAINER_M, 4, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AzaleaPokeCenter1FCooltrainermScript, -1
	person_event SPRITE_GENTLEMAN, 6, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FGentlemanText, -1
	person_event SPRITE_SIGHTSEER_M, 1, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FSightseermText, -1
	person_event SPRITE_POKEFAN_F, 5, 2, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, 0, PERSONTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FPokefanfText, -1

PokemonJournalBugsyScript:
	setflag ENGINE_READ_BUGSY_JOURNAL
	thistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Bugsy!"

	para "Bugsy is reported"
	line "to have won the"

	para "Bug-Catching Con-"
	line "test so often that"

	para "he no longer par-"
	line "ticipates."
	done

AzaleaPokeCenter1FCooltrainermScript:
	checknite
	iftrue_jumptextfaceplayer .NiteText
	thistextfaceplayer

	text "For a guy who"
	line "makes # Balls,"

	para "Kurt isn't much of"
	line "a trainer."

	para "He does have a"
	line "#mon, but he"

	para "doesn't use it"
	line "much."
	done

.NiteText:
	text "Kurt and Prof.Oak"
	line "are old friends."

	para "They're also close"
	line "with Agatha, a"

	para "former member of"
	line "the Elite Four."
	done

AzaleaPokeCenter1FGentlemanText:
	text "Do your #mon"
	line "know HM moves?"

	para "Those moves can"
	line "be used even if"

	para "your #mon has"
	line "fainted."
	done

AzaleaPokeCenter1FSightseermText:
	text "This Bill guy"
	line "created the system"

	para "for storing"
	line "#mon in a PC."

	para "Bill's PC can"
	line "store up to 20"
	cont "#mon per Box."
	done

AzaleaPokeCenter1FPokefanfText:
	text "Do you know about"
	line "Apricorns?"

	para "Crack one open,"
	line "hollow it out and"

	para "fit it with a"
	line "special device."

	para "Then you can catch"
	line "#mon with it."

	para "Before # Balls"
	line "were invented,"

	para "everyone used"
	line "Apricorns."
	done

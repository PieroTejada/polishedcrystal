CianwoodPharmacy_MapScriptHeader:
	db 0 ; map triggers

	db 0 ; map callbacks

CianwoodPharmacy_MapEventHeader:
	db 2 ; warps
	warp_def 7, 3, 4, CIANWOOD_CITY
	warp_def 7, 4, 4, CIANWOOD_CITY

	db 0 ; xy triggers

	db 3 ; signposts
	signpost 1, 5, SIGNPOST_JUMPSTD, radio2
	signpost 1, 6, SIGNPOST_JUMPSTD, difficultbookshelf
	signpost 1, 7, SIGNPOST_JUMPSTD, difficultbookshelf

	db 1 ; person events
	person_event SPRITE_PHARMACIST, 3, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CianwoodPharmacist, -1

CianwoodPharmacist:
	checkevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	iftrue .Mart
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iffalse .Mart
	faceplayer
	opentext
	writetext PharmacistGiveSecretpotionText
	buttonsound
	giveitem SECRETPOTION
	writetext ReceivedSecretpotionText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	writetext PharmacistDescribeSecretpotionText
	waitbutton
	closetext
	spriteface LAST_TALKED, UP
	end

.Mart:
	scall .PokeMart
	spriteface LAST_TALKED, UP
	end

.PokeMart:
	pokemart MARTTYPE_PHARMACY, MART_CIANWOOD

PharmacistGiveSecretpotionText:
	text "Your #mon"
	line "appear to be fine."

	para "Is something"
	line "worrying you?"

	para "…"

	para "The Lighthouse"
	line "#mon is in"
	cont "trouble?"

	para "I got it!"

	para "This ought to do"
	line "the trick."
	done

ReceivedSecretpotionText:
	text "<PLAYER> received"
	line "SecretPotion."
	done

PharmacistDescribeSecretpotionText:
	text "My SecretPotion is"
	line "a tad too strong."

	para "I only offer it in"
	line "an emergency."
	done

CeruleanBikeShop_MapScriptHeader:
	db 0 ; map triggers

	db 0 ; map callbacks

CeruleanBikeShop_MapEventHeader:
	db 2 ; warps
	warp_def 7, 2, 8, CERULEAN_CITY
	warp_def 7, 3, 8, CERULEAN_CITY

	db 0 ; xy triggers

	db 0 ; signposts

	db 1 ; person events
	person_event SPRITE_CLERK, 2, 1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CeruleanBikeShopClerkScript, -1

CeruleanBikeShopClerkScript:
	showtextfaceplayer CeruleanBikeShopClerkText
	spriteface LAST_TALKED, UP
	end

CeruleanBikeShopClerkText:
	text "A long time ago,"
	line "this cool boy rode"
	cont "my Bike around,"

	para "and that started"
	line "a Bicycle boom."

	para "Then I decided to"
	line "open a branch at"
	cont "Goldenrod City."

	para "And they sold"
	line "like the wind!"

	para "But no one comes"
	line "to this shop"
	cont "anymore."

	para "All I have left"
	line "is a bicycle pump…"

	para "Should I sell"
	line "inflatable tubes?"
	done

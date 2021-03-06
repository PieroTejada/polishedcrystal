NavelRockInside_MapScriptHeader:
	db 0 ; map triggers

	db 0 ; map callbacks

NavelRockInside_MapEventHeader:
	db 14 ; warps
	warp_def 81, 7, 3, NAVEL_ROCK_OUTSIDE
	warp_def 64, 8, 3, NAVEL_ROCK_INSIDE
	warp_def 3, 3, 2, NAVEL_ROCK_INSIDE
	warp_def 5, 9, 5, NAVEL_ROCK_INSIDE
	warp_def 85, 23, 4, NAVEL_ROCK_INSIDE
	warp_def 3, 23, 7, NAVEL_ROCK_INSIDE
	warp_def 45, 5, 6, NAVEL_ROCK_INSIDE
	warp_def 42, 2, 9, NAVEL_ROCK_INSIDE
	warp_def 32, 2, 8, NAVEL_ROCK_INSIDE
	warp_def 35, 5, 11, NAVEL_ROCK_INSIDE
	warp_def 25, 5, 10, NAVEL_ROCK_INSIDE
	warp_def 22, 2, 13, NAVEL_ROCK_INSIDE
	warp_def 12, 2, 12, NAVEL_ROCK_INSIDE
	warp_def 15, 5, 1, NAVEL_ROCK_ROOF

	db 0 ; xy triggers

	db 0 ; signposts

	db 2 ; person events
	itemball_event 12, 12, SACRED_ASH, 1, EVENT_NAVEL_ROCK_SACRED_ASH
	itemball_event 12, 37, MASTER_BALL, 1, EVENT_NAVEL_ROCK_MASTER_BALL


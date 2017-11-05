GROUP_N_A  EQU -1
MAP_N_A    EQU -1

GROUP_NONE EQU 0
MAP_NONE   EQU 0

; map group ids
	const_def
	newgroup ;  1
	mapgroup VIRIDIAN_FOREST, 28, 21

	newgroup ; 2

	mapgroup KRISS_HOUSE_2F, 3,  3
	mapgroup NEW_BARK_TOWN, 5, 8



; elevator floors

	const_def
	const _B4F
	const _B3F
	const _B2F
	const _B1F
	const _1F
	const _2F
	const _3F
	const _4F
	const _5F
	const _6F
	const _7F
	const _8F
	const _9F
	const _10F
	const _11F
	const _ROOF

; connection directions
	const_def
	const EAST_F
	const WEST_F
	const SOUTH_F
	const NORTH_F

	const_def
	shift_const EAST
	shift_const WEST
	shift_const SOUTH
	shift_const NORTH

; permissions
const_value SET 1
	const TOWN
	const ROUTE
	const INDOOR
	const CAVE
	const PERM_5
	const GATE
	const DUNGEON

; object struct
	const_def
	const OBJECT_SPRITE
	const OBJECT_MAP_OBJECT_INDEX
	const OBJECT_SPRITE_TILE
	const OBJECT_MOVEMENTTYPE
	const OBJECT_FLAGS1
	const OBJECT_FLAGS2
	const OBJECT_PALETTE
	const OBJECT_DIRECTION_WALKING
	const OBJECT_FACING
	const OBJECT_STEP_TYPE
	const OBJECT_STEP_DURATION
	const OBJECT_ACTION
	const OBJECT_STEP_FRAME
	const OBJECT_FACING_STEP
	const OBJECT_NEXT_TILE
	const OBJECT_STANDING_TILE
	const OBJECT_NEXT_MAP_X
	const OBJECT_NEXT_MAP_Y
	const OBJECT_MAP_X
	const OBJECT_MAP_Y
	const OBJECT_INIT_X
	const OBJECT_INIT_Y
	const OBJECT_RADIUS
	const OBJECT_SPRITE_X
	const OBJECT_SPRITE_Y
	const OBJECT_SPRITE_X_OFFSET
	const OBJECT_SPRITE_Y_OFFSET
	const OBJECT_MOVEMENT_BYTE_INDEX
	const OBJECT_28
	const OBJECT_29
	const OBJECT_30
	const OBJECT_31
	const OBJECT_RANGE

; map object struct
	const_def
	const MAPOBJECT_OBJECT_STRUCT_ID ; 0
	const MAPOBJECT_SPRITE ; 1
	const MAPOBJECT_Y_COORD ; 2
	const MAPOBJECT_X_COORD ; 3
	const MAPOBJECT_MOVEMENT ; 4
	const MAPOBJECT_RADIUS ; 5
	const MAPOBJECT_HOUR ; 6
	const MAPOBJECT_TIMEOFDAY ; 7
	const MAPOBJECT_COLOR ; 8
	const MAPOBJECT_RANGE ; 9
	const MAPOBJECT_SCRIPT_POINTER ; a
	const MAPOBJECT_POINTER_HI ; b
	const MAPOBJECT_EVENT_FLAG ; c
	const MAPOBJECT_FLAG_HI ; d
OBJECT_LENGTH EQU const_value

MAPOBJECT_SCREEN_HEIGHT EQU 11
MAPOBJECT_SCREEN_WIDTH EQU 12

OW_DOWN  EQU DOWN  << 2
OW_UP    EQU UP    << 2
OW_LEFT  EQU LEFT  << 2
OW_RIGHT EQU RIGHT << 2

; see engine/overworld.asm:EmotesPointers
	const_def
	const EMOTE_SHOCK ; 0
	const EMOTE_QUESTION ; 1
	const EMOTE_HAPPY ; 2
	const EMOTE_SAD ; 3
	const EMOTE_HEART ; 4
	const EMOTE_BOLT ; 5
	const EMOTE_SLEEP ; 6
	const EMOTE_FISH ; 7
	const EMOTE_SHADOW ; 8
	const EMOTE_ROD ; 9
	const EMOTE_BOULDER_DUST ; 10
	const EMOTE_SHAKING_GRASS ; 11
	const EMOTE_PUDDLE_SPLASH ; 12
EMOTE_MEM EQU -1

; see engine/events.asm:TryReadSign.signs
	const_def
	const SIGNPOST_READ
	const SIGNPOST_UP
	const SIGNPOST_DOWN
	const SIGNPOST_RIGHT
	const SIGNPOST_LEFT
	const SIGNPOST_IFSET
	const SIGNPOST_IFNOTSET
	const SIGNPOST_JUMPTEXT
	const SIGNPOST_JUMPSTD
	const SIGNPOST_GROTTOITEM
; SIGNPOST_ITEM has to be the last signpost type, since hidden item signposts
; use type SIGNPOST_ITEM + (item id) to save space.
; Note that this requires SIGNPOST_ITEM + (item id) <= $ff, so currently most
; of the mail items cannot be hidden.
SIGNPOST_ITEM EQU const_value


; see engine/spawn_points.asm:SpawnPoints
const_value = -1
	const SPAWN_N_A

	const SPAWN_HOME

	const SPAWN_NEW_BARK
NUM_SPAWNS EQU const_value

	const_def
	const PALETTE_AUTO
	const PALETTE_DAY
	const PALETTE_NITE
	const PALETTE_MORN
	const PALETTE_DARK

; ObjectFlags1
FIXED_FACING EQU 2
SLIDING      EQU 3
EMOTE_OBJECT EQU 7
; ObjectFlags2
INVISIBLE    EQU 0
OVERHEAD     EQU 3

; see engine/events.asm:TryObjectEvent.pointers
	const_def
	const PERSONTYPE_SCRIPT         ; 0
	const PERSONTYPE_POKEBALL       ; 1
	const PERSONTYPE_TRAINER        ; 2
	const PERSONTYPE_GENERICTRAINER ; 3
	const PERSONTYPE_POKEMON        ; 4
	const PERSONTYPE_COMMAND        ; 5
NUM_PERSONTYPES EQU const_value

; fruit trees
; see engine/fruit_trees.asm:FruitTreeItems
const_value SET 1
	const FRUITTREE_ROUTE_29        ; 01
	const FRUITTREE_ROUTE_30_1      ; 02
	const FRUITTREE_ROUTE_30_2      ; 03
	const FRUITTREE_ROUTE_31        ; 04
	const FRUITTREE_VIOLET_CITY     ; 05
	const FRUITTREE_ROUTE_32_COAST  ; 06
	const FRUITTREE_ROUTE_33        ; 07
	const FRUITTREE_AZALEA_TOWN     ; 08
	const FRUITTREE_ROUTE_35        ; 09
	const FRUITTREE_ROUTE_36        ; 0a
	const FRUITTREE_ROUTE_37_1      ; 0b
	const FRUITTREE_ROUTE_37_2      ; 0c
	const FRUITTREE_ROUTE_37_3      ; 0d
	const FRUITTREE_ROUTE_38        ; 0e
	const FRUITTREE_ROUTE_39        ; 0f
	const FRUITTREE_ROUTE_42_1      ; 10
	const FRUITTREE_ROUTE_42_2      ; 11
	const FRUITTREE_ROUTE_42_3      ; 12
	const FRUITTREE_ROUTE_43        ; 13
	const FRUITTREE_ROUTE_44        ; 14
	const FRUITTREE_ROUTE_45        ; 15
	const FRUITTREE_ROUTE_46_1      ; 16
	const FRUITTREE_ROUTE_46_2      ; 17
	const FRUITTREE_ROUTE_27        ; 18
	const FRUITTREE_ROUTE_26        ; 19
	const FRUITTREE_ROUTE_8         ; 1a
	const FRUITTREE_ROUTE_11        ; 1b
	const FRUITTREE_FUCHSIA_CITY    ; 1c
	const FRUITTREE_PEWTER_CITY_1   ; 1d
	const FRUITTREE_PEWTER_CITY_2   ; 1e
	const FRUITTREE_ROUTE_2         ; 1f
	const FRUITTREE_ROUTE_1         ; 20
	const FRUITTREE_LUCKY_ISLAND    ; 21
	const FRUITTREE_SHAMOUTI_ISLAND ; 22
	const FRUITTREE_ROUTE_49        ; 23
NUM_FRUIT_TREES EQU const_value +- 1

; hidden grottoes
; see engine/hidden_grottoes.asm:HiddenGrottoData
const_value SET 1
	const HIDDENGROTTO_ROUTE_32           ; 01
	const HIDDENGROTTO_ROUTE_35           ; 02
	const HIDDENGROTTO_LAKE_OF_RAGE       ; 03
	const HIDDENGROTTO_04                 ; 04
	const HIDDENGROTTO_05                 ; 05
	const HIDDENGROTTO_06                 ; 06
	const HIDDENGROTTO_07                 ; 07
	const HIDDENGROTTO_08                 ; 08
	const HIDDENGROTTO_09                 ; 09
	const HIDDENGROTTO_0A                 ; 0a
	const HIDDENGROTTO_0B                 ; 0b
	const HIDDENGROTTO_0C                 ; 0c
	const HIDDENGROTTO_0D                 ; 0d
	const HIDDENGROTTO_0E                 ; 0e
	const HIDDENGROTTO_0F                 ; 0f
	const HIDDENGROTTO_10                 ; 10
	const HIDDENGROTTO_11                 ; 11
	const HIDDENGROTTO_12                 ; 12
	const HIDDENGROTTO_13                 ; 13
	const HIDDENGROTTO_14                 ; 14
	const HIDDENGROTTO_15                 ; 15
	const HIDDENGROTTO_16                 ; 16
	const HIDDENGROTTO_17                 ; 17
NUM_HIDDEN_GROTTOES EQU const_value +- 1

CMDQUEUE_TYPE  EQU 0
CMDQUEUE_ADDR  EQU 1
CMDQUEUE_03    EQU 3
CMDQUEUE_04    EQU 4
CMDQUEUE_05    EQU 5
CMDQUEUE_ENTRY_SIZE EQU 6

CMDQUEUE_CAPACITY EQU 4

	const_def
	const CMDQUEUE_NONE       ; 0
	const CMDQUEUE_TYPE_1     ; 1
	const CMDQUEUE_STONETABLE ; 2
	const CMDQUEUE_TYPE_3     ; 3
	const CMDQUEUE_TYPE_4     ; 4
NUM_CMDQUEUE_TYPES EQU const_value

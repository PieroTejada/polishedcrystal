MapTriggers:: ; 4d01e
; Map triggers

trigger_def: MACRO
; db group, map
; dw address
	map \1
	dw \2
ENDM

	db -1
; 4d15b

Cry_Bulbasaur: ; f3504
	musicheader 3, 5, Cry_Bulbasaur_Ch5
	musicheader 1, 6, Cry_Bulbasaur_Ch6
	musicheader 1, 8, Cry_Bulbasaur_Ch8
; f350d

Cry_Bulbasaur_Ch5: ; f37e1
	sound_duty 1, 0, 3, 3
	sound __,  5, $f7, $07c0
	sound __, 13, $e6, $07c2
	sound __,  7, $b5, $0680
	sound __,  5, $c4, $0670
	sound __,  5, $b5, $0660
	sound __,  9, $c1, $0640
	endchannel
; f37fc

Cry_Bulbasaur_Ch6: ; f37fc
	sound_duty 0, 3, 0, 3
	sound __,  4, $c7, $0781
	sound __, 13, $b6, $0780
	sound __,  7, $a5, $0641
	sound __,  5, $c4, $0632
	sound __,  7, $b5, $0621
	sound __,  9, $a1, $0602
	endchannel
; f3817

Cry_Bulbasaur_Ch8: ; f3817
	noise __,  4, $e4, $3c
	noise __, 13, $d6, $2c
	noise __,  5, $e4, $3c
	noise __,  9, $b7, $5c
	noise __, 16, $c2, $5d
	endchannel
; f3827

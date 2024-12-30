	.cpu	p2
	.org	1
	mvzl	sp,stack
	call	init
	jmp	main

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	main_segment
init::
	push	lr

	;; main variable
	mvzl	r0,1
	st	r0,state
	mvzl	r0,0
	st	r0,points
	st	r0,misses
	
	;; clocks
	mvzl	r0,24999
	st	r0,CLOCK.PRE		; start clock
	ld	r0,bull_speed		; bullet movement
	st	r0,CLOCK.BCNT2
	ld	r0,side_speed
	st	r0,CLOCK.BCNT3
	ld	r0,down_speed
	st	r0,CLOCK.BCNT4
	
	;; init bullets
	mvzl	r1,0
	st	r1,nuof_bulls
	mvzl	r0,0
init_bullets:
	st	r0,r1,bulls
	inc	r1
	cmp	r1,20
	jnz	init_bullets

	;; init ships
	mvzl	r1,0
	st	r1,nuof_ships
	mvzl	r0,0x0100
init_ships:
	st	r0,r1,ships
	inc	r1
	cmp	r1,20
	jnz	init_ships

	;; init rows
	mvzl	r1,0
init_rows:
	ld	r0,side_steps
	call	rand_max
	mov	r3,r4
	mvzl	r0,1
	call	rand_max
	sz	r4
	Z mvs	r4,-1
	putb	r3,r4,1
	st	r3,r1,rows
	inc	r1
	cmp	r1,25
	jnz	init_rows

	;; start position of gun
	mvzl	r0,36
	st	r0,pos
	;; setup screen and cursor
	call	tu_hide
	mvzl	r0,0
	mvzl	r1,7
	call	tu_color
	call	tu_clear_screen
	
	;; show default objects
	call	show_gun
	call	gen_ships

	;; mark inited state
	mvzl	r0,1
	st	r0,inited
	call	status

	;; test...
	;mvzl	r1,0x0502
	;mvh	r1,0x09270000
	;mvzl	r0,1
	;st	r1,r0,ships
	;call	show_ship
	
	pop	pc

main::
	ld	r0,state
	cmp	r0,1
	Z jmp	main_run
	cmp	r0,2
	Z jmp	main_over
	jmp	main
	
main_run:	
	ld	r0,CLOCK.BCNT2
	sz	r0
	Z call	move_bulls

	ld	r0,CLOCK.BCNT3
	sz	r0
	Z call	move_rows

	ld	r0,CLOCK.BCNT4
	sz	r0
	Z call	move_down

	call	input_avail
	C call	handle_input

	ld	r0,state
	cmp	r0,2
	jnz	main
main_game_over:
	mvzl	r0,1
	mvzl	r1,0xf
	call	tu_color
	mvzl	r0,26
	mvzl	r1,11
	call	tu_go
	mvzl	r0,go_l1
	call	prints
	mvzl	r0,26
	mvzl	r1,12
	call	tu_go
	mvzl	r0,go_l2
	call	prints
	mvzl	r0,26
	mvzl	r1,13
	call	tu_go
	mvzl	r0,go_l3
	call	prints
	jmp	main
	
go_l1:	.db	"                            "
go_l2:	.db	"         GAME OVER          "
go_l3:	.db	"                            "
	
main_over:
	call	input_avail
	jnc	main
	call	read
	cmp	r4,10
	jz	mo_out
	cmp	r4,13
	jz	mo_out
	jmp	main
mo_out:	
	call	init
	jmp	main
	
handle_input::
	push	lr
	call	read
	mvzl	r0,jump_table
	mvzl	r2,0
search_cycle:	
	ld	r3,r2+,r0
	sz	r3
	jz	main
	cmp	r3,r4
	jz	search_find
	plus	r2,1
	jmp	search_cycle
search_find:
	ld	r3,r2,r0
	call	r3,0
	pop	pc
	

jump_table:
	dd	'a'
	dd	move_left
	dd	'A'
	dd	move_left
	dd	'd'
	dd	move_right
	dd	'D'
	dd	move_right
	dd	0x20
	dd	shoot
	dd	10
	dd	shoot
	dd	13
	dd	shoot
	dd	0


status::
	push	lr
	push	r0
	push	r1
	push	r2
	push	r3
	mvzl	r0,1
	mvzl	r1,7
	call	tu_color
	mvzl	r0,1
	mvzl	r1,1
	call	tu_go
	ld	r1,pos
	ld	r2,nuof_bulls
	ld	r3,nuof_ships
	ces	eprintf
	.db	"p=%d  b=%d  s=%d   "
	mvzl	r0,0
	call	tu_bg
	mvzl	r0,50,
	mvzl	r1,1
	call	tu_go
	ld	r1,points
	ld	r2,misses
	ces	eprintf
	.db	"P=%d M=%d "
	pop	r3
	pop	r2
	pop	r1
	pop	r0
	pop	pc
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	gun_segment
	
show_gun::
	push	lr
	push	r0
	push	r1
	mvzl	r0,7
	call	tu_fg
	ld	r0,pos
	mvzl	r1,24
	call	tu_go
	mvzl	r0,0
	mvzl	r1,7
	ces	eprints
	.db	" -^- "
	pop	r1
	pop	r0
	pop	pc
	
move_left::
	push	lr
	ld	r0,pos
	cmp	r0,1
	ULT pop	pc
	add	r0,-1
	st	r0,pos
	call	show_gun
	call	status
	pop	pc
	
move_right::
	push	lr
	ld	r0,pos
	cmp	r0,74
	UGE pop	pc
	add	r0,1
	st	r0,pos
	call	show_gun
	call	status
	pop	pc

shoot::
	push	lr
	ld	r0,nuof_bulls
	cmp	r0,20
	UGE pop	pc
	mvzl	r0,0
seb_cyc:
	cmp	r0,20
	EQ pop	pc
	ld	r1,r0,bulls
	getbz	r2,r1,0		; Check Y
	sz	r2
	NZ plus	r0,1
	NZ jmp	seb_cyc
seb_found:
	mov	r10,r0
	ld	r0,nuof_bulls
	add	r0,1
	st	r0,nuof_bulls
	mvzl	r9,23
	mvzl	r0,6
	call	rand_max
	add	r4,1
	putb	r9,r4,2
	ld	r0,pos
	add	r0,2
	putb	r9,r0,1
	mvzl	r0,0
	putb	r9,r0,3
	st	r9,r10,bulls
	mov	r0,r10
	call	show_bull
	call	status
	pop	pc
	
	.ends


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	bullet_segment

	;; In : R0 bull index
show_bull::
	push	lr
	push	r0
	push	r1
	push	r2
	ld	r2,r0,bulls
	getbz	r0,r2,2
	call	tu_fg
	getbz	r0,r2,1
	getbz	r1,r2,0
	call	tu_go
	mvzl	r0,'O'
	call	putchar
	pop	r2
	pop	r1
	pop	r0
	pop	pc

	;; In : R0 bull index
	;; Out: F.C gone out of screen
move_bull::
	push	lr
	push	r0
	push	r1
	push	r2
	push	r10
	mov	r10,r0
	ld	r2,r10,bulls
	getbz	r0,r2,1
	getbz	r1,r2,0
	call	tu_go
	mvzl	r0,0x20
	call	putchar
	getbz	r1,r2,0
	sub	r1,1
	putb	r2,r1,0
	st	r2,r10,bulls
	cmp	r1,2
	SLT jmp	mb_true
	mov	r0,r10
	call	check_hit
	C jmp	mb_false
	call	show_bull
mb_false:
	clc
	jmp	mb_ret
mb_true:
	sec
mb_ret:
	pop	r10
	pop	r2
	pop	r1
	pop	r0
	pop	pc
	
	;; In : R0 bull index
remove_bull::
	push	lr
	push	r0
	push	r1
	push	r2
	push	r10
	mov	r10,r0
	ld	r2,r10,bulls
	getbz	r0,r2,1
	getbz	r1,r2,0
	sz	r1
	jz	rb_ret
	call	tu_go
	mvzl	r0,0x20
	call	putchar
	mvzl	r2,0
	st	r2,r10,bulls
	ld	r0,nuof_bulls
	sub	r0,1
	st	r0,nuof_bulls
	call	status
rb_ret:
	pop	r10
	pop	r2
	pop	r1
	pop	r0
	pop	pc

	;; In : R0 bull index
	;; Out: F.C true if bull removed (hit a ship)
check_hit::
	push	lr
	push	r0
	push	r1
	push	r2
	push	r3
	push	r4
	push	r5
	push	r9
	push	r10
	mov	r5,r0		; org bull index
	ld	r10,r5,bulls	; bull
	getbz	r2,r10,0	; bull.Y
	sz	r2
	jz	ch_ret
	mvzl	r4,0		; ship index
ch_cyc:
	ld	r9,r4,ships
	getbz	r3,r9,0		; ship.Y
	sz	r3		; is it valid?
	jz	ch_next
	cmp	r2,r3		; compare Y
	jnz	ch_next
	getbz	r3,r9,1		; ship.X
	getbz	r1,r10,1	; bull.X
	cmp	r1,r3
	ULE jmp	ch_next
	add	r3,5
	cmp	r1,r3
	UGT jmp	ch_next
ch_hit:
	mov	r0,r5
	call	remove_bull
	mov	r0,r4
	call	hit_ship
	call	remove_ship
	call	status
	sec
	jmp	ch_ret
ch_next:
	inc	r4
	cmp	r4,20
	jnz	ch_cyc
	clc
ch_ret:
	pop	r10
	pop	r9
	pop	r5
	pop	r4
	pop	r3
	pop	r2
	pop	r1
	pop	r0
	pop	pc
	
	;; In : -
move_bulls::
	push	lr
	ld	r0,bull_speed
	st	r0,CLOCK.BCNT2
	ld	r0,nuof_bulls
	sz	r0
	Z pop	pc
	mvzl	r0,0
mb_cycle:
	ld	r2,r0,bulls
	getbz	r3,r2,0
	sz	r3
	jz	mv_next
	call	move_bull
	C call	remove_bull
mv_next:
	add	r0,1
	cmp	r0,20
	jnz	mb_cycle
	pop	pc
	
	.ends


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	.seg	ship_segment

	;; In : R0 index of ship
show_ship::
	push	lr
	push	r0
	push	r1
	push	r10
	ld	r10,r0,ships
	getbz	r0,r10,1
	getbz	r1,r10,0
	sz	r1
	jz	ss_ret
	call	tu_go
	getbz	r0,r10,3
	btst	r0,0xf
	call	tu_fg
	getbz	r1,r10,2
	shr	r1
	shr	r1
	shr	r1
	add	r1,'A'
ss_s:	getbz	r0,r10,2
	btst	r0,7
	mul	r0,9
	add	r0,ship_forms
	call	printf
ss_ret:
	pop	r10
	pop	r1
	pop	r0
	pop	pc

	;; In : R0 ship index
remove_ship::
	push	lr
	push	r0
	push	r1
	push	r2
	push	r5
	push	r10
	mov	r5,r0
	ld	r10,r5,ships
	getbz	r0,r10,1
	getbz	r1,r10,0
	sz	r1
	jz	rs_ret
	call	tu_go
	ces	eprints
	.db	"      "
	mvzl	r0,0x100
	st	r0,r5,ships
	ld	r0,nuof_ships
	dec	r0
	st	r0,nuof_ships
rs_ret:
	pop	r10
	pop	r5
	pop	r2
	pop	r1
	pop	r0
	pop	pc
	
	;; In : R0 ship index
	;;      R1 delta X
	;;      R2 delta Y
move_ship::
	push	lr
	push	r0
	push	r1
	push	r2
	push	r3
	push	r4
	push	r5
	push	r10
	mov	r5,r0		; orig ship nr
	ld	r10,r5,ships
	getbz	r4,r10,0	; R4:Y
	sz	r4
	Z jmp	ms_ret
ms_ok:
	add	r4,r2
	getbz	r3,r10,1	; R3: X
	add	r3,r1
	cmp	r4,24
	ULT jmp	ms_not_bottom
ms_bottom:
	;; check collision
	ld	r0,pos
	add	r0,1
	mov	r1,r3
	add	r1,5
	cmp	r1,r0
	ULT jmp	ms_no_coll
	add	r0,2
	sub	r1,4
	cmp	r1,r0
	UGT jmp	ms_no_coll
ms_collision:
	mvzl	r0,2
	st	r0,state
ms_no_coll:	
	mov	r0,r5
	call	miss_ship
	call	remove_ship
	jmp	ms_ret
ms_not_bottom:
	sz	r2
	jz	ms_ready
mc_ch_y:
	getb	r0,r10,1	; orig X
	getb	r1,r10,0	; orig Y
	call	tu_go
	ces	eprints
	.db	"       "
ms_ready:
	putb	r10,r4,0	; new Y
	putb	r10,r3,1	; new X
	st	r10,r5,ships	; store new ship
	mov	r0,r5
	call	show_ship
ms_ret:
	pop	r10
	pop	r5
	pop	r4
	pop	r3
	pop	r2
	pop	r1
	pop	r0
	pop	pc
	
ship_forms:
	.db	" /-%c-\\ "
	.db	" v-%c-v "
	.db	" X-%c-X "
	.db	" }-%c-{ "
	.db	" ^-%c-^ "
	.db	" O-%c-O "
	.db	" ~_%c_~ "
	.db	" (-%c-) "

gen_ships::
	push	lr
	mvzl	r0,0
gs_cyc:
	cmp	r0,4
	UGT jmp	gs_ret
	ld	r1,nuof_ships
	cmp	r1,20
	UGE jmp	gs_ret
	mvzl	r1,0
gs_search:
	ld	r2,r1,ships
	zeb	r2
	sz	r2
	jz	gs_found
	inc	r1
	cmp	r1,20
	jz	gs_ret
	jmp	gs_search
gs_found:
	push	r0
	mvzl	r10,0x2		; Y=2
	;mvzl	r0,50
	;call	rand_max
	;add	r4,15
	;; X= 20+i*10 where i=0..4
	mov	r4,r0
	mul	r4,10
	add	r4,20
	putb	r10,r4,1	; X
	mvzl	r0,6
	call	rand_max
	add	r4,1
	putb	r10,r4,3	; color
	mvzl	r0,7
	call	rand_max
	mov	r9,r4		; type
	mvzl	r0,'Z'
	sub	r0,'A'
	call	rand_max
	shl	r4
	shl	r4
	shl	r4
	or	r4,r9
	putb	r10,r4,2	; id, type
	st	r10,r1,ships
	mov	r0,r1
	call	show_ship
	ld	r0,nuof_ships
	inc	r0
	st	r0,nuof_ships
	pop	r0
	inc	r0
	jmp	gs_cyc
gs_ret:
	;; regenerate row[2]
	mvzl	r10,0
	mvzl	r0,1
	call	rand_max
	sz	r4
	Z mvs	r4,-1
	putb	r10,r4,1
	ld	r0,side_steps
	call	rand_max
	putb	r10,r4,0
	mvzl	r1,2
	st	r10,r1,rows
	pop	pc

	;; Move every rows horizontaly
	;; Inverz direction after 'side_steps' steps
	;; Moves all ships left/right by one position
move_rows::
	push	lr
	ld	r0,side_speed
	st	r0,CLOCK.BCNT3
	mvzl	r3,2		; row nr: 2..23
mr_cyc:
	ld	r8,r3,rows	; pick row
	getbz	r7,r8,0		; get steps
	inc	r7		; inc steps
	putb	r8,r7,0		; put back incremented steps
	ld	r6,side_steps	; is it over limit?
	cmp	r7,r6
	ULE jmp	mr_noch_dir
mr_ch_dir:
	getbs	r7,r8,1		; revers direction
	neg	r7
	mvzl	r8,0		; and clear steps
	putb	r8,r7,1
mr_noch_dir:
	st	r8,r3,rows	; store changed row
	;; move all ships in this row
	getbs	r1,r8,1		; delta X
	mvzl	r2,0		; delta Y
	mvzl	r0,0		; ship nr
mr_mrcyc:
	ld	r10,r0,ships	; pick a ship
	getbz	r5,r10,0	; check its Y
	sz	r5		; is it valid?
	jz	mr_noship
mr_ship:
	cmp	r5,r3		; compare row and Y
mr_mv_ship:
	Z call	move_ship
mr_noship:
	inc	r0		; next ship
	cmp	r0,20
	jnz	mr_mrcyc
mr_mr_done:	
	inc	r3		; go to next row
	cmp	r3,23		; is there any more?
	ULE jmp	mr_cyc
mr_ret:
	pop	pc

move_down::
	push	lr
	ld	r0,down_speed
	st	r0,CLOCK.BCNT4
	mvzl	r0,24		; idx of last row
	mvzl	r1,23
	mvzl	r3,rows
md_cyc:
	ld	r2,r1--,r3
	st	r2,r0--,r3
	sz	r1
	jnz	md_cyc
	;; move all ships down
	mvzl	r1,0		; delta X
	mvzl	r2,1		; delta Y
	mvzl	r0,0		; ship nr
md_mrcyc:
	ld	r10,r0,ships	; pick a ship
	getbz	r5,r10,0	; check its Y
	sz	r5		; is it valid?
	NZ call	move_ship
	inc	r0		; next ship
	cmp	r0,20
	jnz	md_mrcyc
	call	gen_ships
	pop	pc

	;; In : R0 ship index
hit_ship::
	push	lr
	push	r0
	push	r1
	ld	r0,r0,ships	; pick ship
	getbz	r0,r0,2		; get type,id byte
	shr	r0		; select type
	shr	r0
	shr	r0
	ld	r1,points	; add type to points
	add	r1,r0
	st	r1,points
	pop	r1
	pop	r0
	pop	pc

	;; In : R0 ship index
miss_ship::
	push	lr
	push	r0
	ld	r0,misses
	inc	r0
	st	r0,misses
	pop	r0
	pop	pc
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	.seg	variables

state::		.ds	1
points::	.ds	1
misses::	.ds	1
pos::		.ds	1
inited::	.dd	0
bull_speed::	.dd	100
down_speed::	.dd	1000
side_speed::	.dd	500
side_steps::	.dd	10
nuof_bulls::	.ds	1
bulls::		.ds	20		; - color X Y
.ds 1
nuof_ships::	.ds	1
ships::		.ds	20		; hits:4,color:4 id:5,type:3 X Y
rows::		.ds	25		; - - dir steps
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.ds	500
stack:	.ds	1

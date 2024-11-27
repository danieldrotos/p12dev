	.cpu	p2
	.org	1
	mvzl	sp,stack
	call	init
	jmp	main

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	main_segment
init::
	push	lr

	mvzl	r0,24999
	st	r0,CLOCK.PRE	; start clock
	ld	r0,bull_speed		; bullet movement
	st	r0,CLOCK.BCNT2
	ld	r0,side_speed
	st	r0,CLOCK.BCNT3
	
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
	ld	r0,CLOCK.BCNT2
	sz	r0
	Z call	move_bulls

	ld	r0,CLOCK.BCNT3
	sz	r0
	Z call	move_rows

	call	input_avail
	C call	handle_input

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
	mvzl	r0,1
	mvzl	r1,7
	call	tu_color
	mvzl	r0,1
	mvzl	r1,1
	call	tu_go
	ld	r1,pos
	ld	r2,nuof_bulls
	call	eprintf
	.db	"p=%d  b=%d   "
	mvzl	r0,0
	call	tu_bg
	pop	r1
	pop	r0
	pop	pc
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	gun_segment
	
show_gun::
	push	lr
	mvzl	r0,7
	call	tu_fg
	ld	r0,pos
	mvzl	r1,24
	call	tu_go
	mvzl	r0,0
	mvzl	r1,7
	call	eprints
	.db	" -^- "
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
	ld	r2,r0,bulls
	getbz	r0,r2,2
	call	tu_fg
	getbz	r0,r2,1
	getbz	r1,r2,0
	call	tu_go
	mvzl	r0,'O'
	call	putchar
	pop	r0
	pop	pc

	;; In : R0 bull index
	;; Out: F.C gone out of screen
move_bull::
	push	lr
	push	r0
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
	call	show_bull
mb_false:
	clc
	jmp	mb_ret
mb_true:
	sec
mb_ret:
	pop	r0
	pop	pc
	
	;; In : R0 bull index
remove_bull::
	push	lr
	push	r0
	mov	r10,r0
	ld	r2,r10,bulls
	getbz	r0,r2,1
	getbz	r1,r2,0
	call	tu_go
	mvzl	r0,0x20
	call	putchar
	mvzl	r2,0
	st	r2,r10,bulls
	ld	r0,nuof_bulls
	sub	r0,1
	st	r0,nuof_bulls
	call	status
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
	ld	r10,r0,ships
	getbz	r0,r10,1
	getbz	r1,r10,0
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
	pop	r0
	pop	pc

	;; In : R0 ship index
	;;      R1 delta X
	;;      R2 delta Y
move_ship::
	push	lr
	ld	r10,r0,ships
	getbz	r4,r10,0	; R4:Y
	sz	r4
	Z pop	pc
	add	r4,r2
	getbz	r3,r10,1	; R3: X
	add	r3,r1
	cmp	r4,24
	jnz	ms_not_bottom
ms_bottom:
ms_not_bottom:
	sz	r2
	jz	ms_noch_y
mc_ch_y:
	getb	r0,r10,1
	getb	r1,r10,0
	call	tu_go
	ces	eprints
	.db	"       "
ms_noch_y:
	putb	r10,r4,0
	putb	r10,r3,1
	st	r10,r0,ships
	call	show_ship
	jmp	ms_ret
ms_ret:
	pop	pc
	
ship_forms:
	.db	" |-%c-| "
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
	mvzl	r10,0x2		; Y
	;mvzl	r0,50
	;call	rand_max
	;add	r4,15
	;; X= 20+i*10
	mov	r4,r1
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

move_nuof_row:
	.ds	1
move_rows::
	push	lr
	ld	r0,side_speed
	st	r0,CLOCK.BCNT3
	mvzl	r0,0
mr_cyc:
	ld	r8,r0,rows
	getbz	r7,r8,0
	inc	r7
	putb	r8,r7,0
	ld	r6,side_steps
	cmp	r7,r6
	ULE jmp	mr_next
mr_ch:
	getbs	r7,r8,1
	mul	r7,-1
	mvzl	r8,0
	putb	r8,r7,1
mr_next:
	st	r8,r0,rows
	;; move all ships in this row
	getbs	r1,r8,1		; delta X
	movzl	r2,0		; delta Y
	push	r0
	st	r0,move_nuof_row	; row nr (Y of ship)
	mvzl	r0,0
mr_mrcyc:
	ld	r10,r0,ships
	getbz	r8,r10,0
	ld	r9,move_nuof_row
	cmp	r8,r9
	Z call	move_ship
	inc	r0
	cmp	r0,20
	jnz	mr_mrcyc
mr_mr_done:	
	pop	r0
	inc	r0
	cmp	r0,25
	jnz	mr_cyc
mr_ret:
	pop	pc
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	.seg	variables
	
pos::		.ds	1
inited::	.dd	0
bull_speed::	.dd	100
down_speed::	.dd	5000
side_speed::	.dd	500
side_steps::	.dd	10
nuof_bulls::	.ds	1
bulls::		.ds	20		; - color X Y
nuof_ships::	.ds	1
ships::		.ds	20		; hits:4,color:4 id:5,type:3 X Y
rows::		.ds	25		; - - dir steps
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.ds	500
stack:	.ds	1

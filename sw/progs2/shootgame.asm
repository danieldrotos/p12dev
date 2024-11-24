	.cpu	p2
	.org	1
	mvzl	sp,stack
	call	init
	jmp	main

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	main_segment
init::
	push	lr
	;; init bullets
	mvzl	r1,0
	st	r1,nuof_bulls
	mvzl	r0,24999
	st	r0,CLOCK.PRE
	mvzl	r0,100
	st	r0,CLOCK.BCNT2
	mvzl	r0,0
init_bullets:
	st	r0,r1,bulls
	inc	r1
	cmp	r1,20
	jnz	init_bullets
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
	;; mark inited state
	mvzl	r0,1
	st	r0,inited
	pop	pc
	
main::
	ld	r0,CLOCK.BCNT2
	sz	r0
	jnz	mc_input
	call	move_bulls
mc_input:
	call	input_avail
	jnc	main
	
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
	jmp	main
	

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
	pop	pc
	
move_right::
	push	lr
	ld	r0,pos
	cmp	r0,74
	UGE pop	pc
	add	r0,1
	st	r0,pos
	call	show_gun
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
	getbz	r2,r0,0		; Check Y
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
	pop	pc
	
	.ends


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	bullet_sergment

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
	pop	r0
	pop	pc

	;; In : -
move_bulls::
	push	lr
	mvzl	r0,100
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
	
	.seg	variables
pos::
	.ds	1
inited::
	.dd	0
nuof_bulls::
	.ds	1
bulls::
	.ds	20		; X color X Y
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.ds	500
stack:	.ds	1

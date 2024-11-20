	.cpu	p2
	.org	1
	mvzl	sp,stack
	call	init
	jmp	main_cyc
	
	.seg	variables
pos::	.ds	1
inited:: .dd	0
	.ends
	
	.seg	main_segment
init::
	push	lr
	mvzl	r0,36
	st	r0,pos
	call	tu_hide
	mvzl	r0,0
	mvzl	r1,7
	call	tu_color
	call	tu_clear_screen
	call	show_gun
	mvzl	r0,1
	st	r0,inited
	pop	pc
	
main_cyc::
	call	input_avail
	jnc	main_cyc
	call	read
	cmp	r4,'a'
	jnz	no_a
	call	move_left
	jmp	main_cyc
no_a:
	cmp	r4,'d'
	jnz	no_d
	call	move_right
	jmp	main_cyc
no_d:
	jmp	main_cyc
	
	.seg	gun_segment
	
show_gun::
	push	lr
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
	
	.ends
	
	.ends
	
	.ds	500
stack:	.ds	1

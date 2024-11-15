	cpu	p2

	org	1

	mvzl	sp,stack

	call	tu_clear_screen
	mvzl	r0,3
	mvzl	r1,2
	call	tu_go
	mvzl	r0,1
	mvzl	r1,10
	call	tu_color
	ces	eprints
	.db	"x=3 y=2 bg=1 red fg=2 green"
	mvzl	r0,0
	mvzl	r1,7
	call	tu_color
	ces	eprints
	.db	"\n"
	mvzl	r6,0		; bg
	mvzl	r7,0		; fg

cyc1:
	call	dsp
	inc	r7
	cmp	r7,16
	jnz	cyc1
	mvzl	r7,0
	inc	r6
	cmp	r6,16
	jnz	cyc1

	mvzl	r0,0
	mvzl	r1,7
	call	tu_color
	ces	eprints
	.db	"\n"
	call	monitor

dsp:
	push	lr
	push	r6
	push	r7
	mov	r0,r6
	mov	r1,r7
	call	tu_color
	mov	r1,r6		; y= bg+5
	add	r1,5
	mov	r0,r7		; x= fg*4+10
	mul	r0,4
	add	r0,10
	call	tu_go
	ld	r1,r6,htab
	ld	r2,r7,htab
	ces	eprintf
	.db	" %c%c "
	pop	r7
	pop	r6
	pop	pc

htab:
	db	"0123456789ABCDEF"
	
	ds	100
stack:	ds	1
	

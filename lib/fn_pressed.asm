	.proc	p2

	.seg	fn_pressed

last_btn:
	ds	1
last_inited:
	db	0
	
	;; Check button press
	;; ----------------------------------------------------------------
	;; Input: R0= bit mask of examined BTN
	;; Output: C=0 if not pressed, C=1 if pressed
pressed::
	push	lr
	push	r1
	push	r2
	push	r3

	ld	r1,last_inited
	sz	r1
	jnz	pressed_inited
	ld	r1,GPIO.BTN
	st	r1,last_btn
	mvzl	r1,1
	st	r1,last_inited
	jmp	pressed_hamis
pressed_inited:	
	ld	r1,last_btn
	ld	r2,GPIO.BTN
	and	r1,r0
	and	r2,r0
	cmp	r1,r2
	EQ jmp	pressed_hamis
	ld	r1,last_btn
	mov	r3,r0
	not	r3
	and	r1,r3
	or	r1,r2
	st	r1,last_btn	
	sz	r2
	Z jmp	pressed_hamis
pressed_igaz:	
	sec
	jmp	pressed_vege
pressed_hamis:
	clc
pressed_vege:
	pop	r3
	pop	r2
	pop	r1
	pop	lr
	ret

	.ends
	

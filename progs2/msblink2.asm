	proc		p2
	
	PRE	= 0xff51
	CLK	= 0xff50
	PA	= 0xff00	; seg7= now
	PB	= 0xff01	; led= blink
	
	org	1

	ldl0	sp,stack
	
	ldl0	r0,25000	; 25 MHz -> 1ms
	st	r0,PRE		; start
	ldl0	r0,0
	st	r0,PB
cyc:
	call	0xf001
	ld	r0,CLK		; now
	st	r0,PA
	ld	r1,last		; last
	mov	r2,r0
	sub	r2,r1		; now-last
	ld	r3,period
	cmp	r2,r3		; now-last > period
	HI jmp	elapsed
	jmp	cyc

elapsed:
	st	r0,last		; last= now
	ld	r1,PB		; PB= PB^1
	xor	r1,1
	st	r1,PB
	jmp	cyc
	
last:	dd	0
period:	dd	2
	ds	100
stack:	

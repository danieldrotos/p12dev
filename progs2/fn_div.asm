	cpu	p2

	;; INPUT  R0= N, R1= D
	;; OUTPUT R2= Q, R3= R
div:
	push	lr
	push	r4
	
	sz	r1
	NZ jmp	div_dok
	mov	r2,r0		; div by zero
	mvzl	r3,0
	jmp	div_ret
div_dok:
	mvzl	r2,0		; Q= 0
	mvzl	r3,0		; R= 0
	mvh	r4,0x80000000	; m= 1<<31
	mvl	r4,0x80000000
div_cyc:
	sz	r4
	Z jmp	div_ret
	shl	r3		; r<<= 1
	test	r0,r4		; if (n&m)
	NZ or	r3,1		; r|= 1
	cmp	r3,r1		; if (r>=d)
	LO jmp	div_cyc_next
	sub	r3,r1		; r-= d
	or	r2,r4		; q|= m
	jmp	div_cyc_next
	jmp	div_cyc
div_cyc_next:
	shr	r4		; m>>= 1
	jmp	div_cyc
div_ret:
	pop	r4
	pop	lr
	ret

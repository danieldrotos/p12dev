	cpu	p2

	;;
	;; R2:quotient,R3:reminder= div      (R0:number,R1:divisor)
	;;                          srand    (R0:seed)
	;; R1=                      rand     ()
	;; R1=                      rand_max (R0:max)
	;; 
	
	.seg	fn_div

	;; INPUT  R0= N, R1= D
	;; OUTPUT R2= Q, R3= R
div::
	push	lr
	push	r4
	
	sz	r1
	NZ jmp	div_dok
	mov	r2,r0		; div by zero
	mvzl	r3,0x0
	jmp	div_ret
div_dok:
div_dummy:
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
	pop	pc
;	ret
	
	.ends
	

	;; Implementation of 32 bit xorshift algorithm by George Marsaglia
	;; https://www.jstatsoft.org/article/view/v008i14
	;; DOI: 10.18637/jss.v008.i14
	
	.seg	fn_rand

seed:	.db	2127401289

	
	;; Set actual value
	;; Input : R0 seed
	;; Output: -
srand::
	st	r0,seed
	ret

	;; Calculate next value, results 32 bit unsigned integer
	;; Input : -
	;; Output: R1 next random number in 0..2^32-1 range
rand::
	push	lr
	push	r0
	push	r2
	
	ld	r0,seed
	mov	r1,r0
	mvzl	r2,13
c1:	shl	r1
	dec	r2
	jnz	c1
	xor	r0,r1
	mov	r1,r0
	mvzl	r2,17
c2:	shr	r1
	dec	r2
	jnz	c2
	xor	r0,r1
	mov	r1,r0
	mvzl	r2,5
c3:	shl	r1
	dec	r2
	jnz	c3
	xor	r0,r1
	st	r0,seed

	mov	r1,r0
	
	pop	r2
	pop	r0
	pop	pc
;	ret

	;; Calculate next value converted to range 0..R0
	;; Input : R0 max value
	;; Output: R1 next random value in 0..R0 range
rand_max::
	push	lr
	push	r0
	push	r2
	push	r3
	
	mov	r2,r0
	inc	r2
	call	rand
	mov	r0,r1
	mov	r1,r2
	call	div
	mov	r1,r3
	
	pop	r3
	pop	r2
	pop	r0
	pop	pc
;	ret
	
	.ends
	

	.proc	p2

	.extern	divabs
	
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
	call	divabs
	mov	r1,r3
	
	pop	r3
	pop	r2
	pop	r0
	pop	pc
;	ret
	
	.ends
	

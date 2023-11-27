	.proc	p2

	.seg	fn_rand
last:	.db	2127401289

	;; Input : R0 seed
	;; Output: -
srand::
	st	r0,last
	ret
	
	;; Input : -
	;; Output: R1 next random number in 0..2^32-1 range
rand::
	push	lr
	push	r0
	push	r2
	
	ld	r0,last
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
	st	r0,last

	mov	r1,r0
	
	pop	r2
	pop	r0
	pop	lr
	ret

	;; Input : R0 max value
	;; Output: R1 next random value in 0..R0-1 range
rand_max::
	push	lr
	push	r0
	push	r2
	push	r3
	
	mov	r2,r0
	call	rand
	mov	r0,r1
	mov	r1,r2
	call	div
	mov	r1,r3
	
	pop	r3
	pop	r2
	pop	r0
	pop	lr
	ret
	
	.ends
	

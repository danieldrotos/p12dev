port	=	0xffff
abc	equ	21
data	equ	0x4356
	
	mov	r1,r2
	sed	r3,r4
	mvl	r5,0xbeef
	mvh	r5,0xdead
	mvzl	r6,port
	mvs	r7,abc
	mvs	r8,port

	add	r9,r10
	add	r11,data
	adc	r12,r13
	adc	r14,data
	sub	r1,r2
	sub	r3,data
	sbb	r4,r5
	sbb	r6,data
	cmp	r7,r8
	cmp	r9,data
	mul	r10,r11
	mul	r12,data
	plus	r13,r14
	plus	r1,data
	test	r2,r3
	test	r4,data
	or	r5,r6
	or	r7,data
	xor	r8,r9
	xor	r10,data
	and	r11,r12
	and	r13,data

	zeb	r14
	zew	r1
	seb	r2
	sew	r3
	not	r4
	neg	r5
	ror	r6
	rol	r7
	shl	r8
	shr	r9
	sha	r10
	sz	r11
	sec
	clc
	getf	r12
	setf	r13

	call	cimke
	call	r14,0
	call	r1,10
	call	r2,-10
	
cimke:
	nop

	st	r3,r4,r5
	st	r6,+r7,r8
	st	r9,-r10,r11
	st	r12,r13+,r14
	st	r1,r2-,r3

	st	r4,r5,20
	st	r6,*r7,20
	st	r8,r9,-20
	st	r10,*r11,-20

	ld	r12,+r13,0
	ld	r12,r13+,0
	ld	r12,r13-,0
	ld	r12,-r13,0
	
	jmp	cimke
	
	db	'H','e','l','l','o',' ',0
	dw	1,-1,'a'
	db	"Hello \"World\"!"
	dd	0xdeadbeef
	

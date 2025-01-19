	.cpu	p2

	.org	1
	mvzl	sp,stack
	jmp	main

str:	.db	"0\e[A1 _\e[B_ \e[C \e[12~ \n"
main:
	mvzl	r10,str
	mvzl	r9,0
cyc:
	ld	r4,r9+,r10
	sz	r4
	jz	fin
	mov	r1,r4
	call	ti_process_char
proced:
	mov	r2,r4
	getf	r3
	btst	r3,2
	shr	r3
	ces	eprintf
	.db	"chr=%d ret=%d c.f=%d ret=%x\n"
	jmp	cyc
fin:	
	call	monitor
	
	.ds	100
stack:	.ds	1
	

out	equ	0xf000

	org	0

	mvzl	r0,out
	mvzl	r1,0

cyc:
	st	r1,r0
	add	r1,1
	jmp	cyc
	

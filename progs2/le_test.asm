	.proc	p2

	org	1

	mvzl	r0,buf
	mvzl	r1,100
	call	le_init
cyc:
	jmp	cyc
	

buf:	ds	100

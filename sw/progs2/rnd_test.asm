	.proc	p2

	.org	1
	
	mvzl	r2,10
cyc:
	call	rand
	call	eprintf
	.db	"%u\n"
	mvzl	r0,100
	call	rand_max
	call	eprintf
	.db	"%u\n"
	dec	r2
	jnz	cyc

the_end:
	jmp	the_end
	

	.proc	p2

	.org	1
;	.extern	rand
;	.extern	rand_max
;	.extern	pesf
	
	mvzl	r2,10
cyc:
	call	rand
	call	pesf
	.db	"%u\n"
	mvzl	r0,100
	call	rand_max
	call	pesf
	.db	"%u\n"
	dec	r2
	jnz	cyc

the_end:
	jmp	the_end
	

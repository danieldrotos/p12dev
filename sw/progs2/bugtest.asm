	.cpu	p2
	
	.include	fn_io.asm
	.include	fn_pmon.asm

	org	0
	.req	RA,r1
	ld	r0,RA+,r2
	
	mvzl	sp,stack
	mvzl	r1,217
	st	r1,UART.CPB
	mvzl	r1,3		; turn on rx and tx
	st	r1,UART.CTRL

	.include	a.asm
	
	mvzl	r0,'A'
	call	_putchar
	mvzl	r0,'0'
	call	_putchar

end:	jmp	end
	
s1:	db	"Hello %d %x\n"
null_str:	db	"(null)"

	ds	100
stack:
	

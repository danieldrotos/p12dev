	.proc	P2
	
ODR	equ	0xff40

	mvzl	r1,0x55
	mvzl	r2,ODR
	st	r1,r2

end:	jmp	end
	

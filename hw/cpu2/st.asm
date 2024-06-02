	.proc	P2

	org	0

PORTA	=	0xff00
PORTB	=	0xff01
	
	jmp	goon
dta:	dd	0x12fe5678
goon:
	ld	r2,dta
	getb	r1,r2,1
	putb	r1,r1,1
	getb	r1,r2,2
	getbs	r1,r2,2
	getbz	r1,r2,2
	
	mvzl	r0,0
	st	r0,PORTA
	st	r1,PORTB

	mvzl	r0,0
	mvzl	r1,PORTA
	st	r1,r1+,r0

end:	jmp	end

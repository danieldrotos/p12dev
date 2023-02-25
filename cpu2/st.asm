	.proc	P2

	org	1

PORTA	=	0xff00
PORTB	=	0xff01
	
	mvzl	r0,0
	st	r0,PORTA
	st	r1,PORTB

	mvzl	r0,0
	mvzl	r1,PORTA
	st	r1,r1+,r0

end:	jmp	end

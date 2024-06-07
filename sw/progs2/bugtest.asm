	.cpu	p2
	
UART_CTRL	=	0xff41
UART_CPB	=	0xff44
GPIO.PORTA	=	0xff00	; 7seg (selectable)
GPIO.PORTB	=	0xff01	; led
GPIO.PORTC	=	0xff02
GPIO.PORTD	=	0xff03
GPIOA.ODR	=	0xff00
GPIOB.ODR	=	0xff01
GPIOC.ODR	=	0xff02
GPIOD.ODR	=	0xff03

_prints		=	0xf00f
_printsnl	=	0xf010
_print_vhex	=	0xf011
_pes		=	0xf012
_printd		=	0xf013
_printf		=	0xf014
_pesf		=	0xf015
_putchar	=	0xf00e

	org	0
	.req	RA,r1
	ld	r0,RA+,r2
	
	mvzl	sp,stack
	mvzl	r1,217
	st	r1,UART_CPB
	mvzl	r1,3		; turn on rx and tx
	st	r1,UART_CTRL

	mvzl	r0,'A'
	call	_putchar
	mvzl	r0,'0'
	call	_putchar

end:	jmp	end
	
s1:	db	"Hello %d %x\n"
null_str:	db	"(null)"

	ds	100
stack:
	

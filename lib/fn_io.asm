	.proc	p2

a::	122
		
	
	.seg	regs_of_clock
	
CLOCK.CLOCK	=	0xff50
CLOCK.CLK	=	0xff50
CLOCK.PRE	=	0xff51
CLOCK.BCNT2	=	0xff52
CLOCK.BCNT3	=	0xff53
CLOCK.BCNT4	=	0xff54
CLOCK.BCNT5	=	0xff55
CLOCK.BCNT6	=	0xff56
CLOCK.BCNT7	=	0xff57
CLOCK.BCNT8	=	0xff58
CLOCK.BCNT9	=	0xff59
CLOCK.BCNT10	=	0xff5a
CLOCK.BCNT11	=	0xff5b
CLOCK.BCNT12	=	0xff5c
CLOCK.BCNT13	=	0xff5d
CLOCK.BCNT14	=	0xff5e
CLOCK.BCNT15	=	0xff5f

		.global	CLOCK.CLOCK	
		.global	CLOCK.CLK	
		.global	CLOCK.PRE	
		.global	CLOCK.BCNT2	
		.global	CLOCK.BCNT3	
		.global	CLOCK.BCNT4	
		.global	CLOCK.BCNT5	
		.global	CLOCK.BCNT6	
		.global	CLOCK.BCNT7	
		.global	CLOCK.BCNT8	
		.global	CLOCK.BCNT9	
		.global	CLOCK.BCNT10	
		.global	CLOCK.BCNT11	
		.global	CLOCK.BCNT12	
		.global	CLOCK.BCNT13	
		.global	CLOCK.BCNT14	
		.global	CLOCK.BCNT15	

	.ends
	
	.seg	regs_of_gpio

GPIO.PORTA	=	0xff00	; 7seg (selectable)
GPIO.PORTB	=	0xff01	; led
GPIO.PORTC	=	0xff02
GPIO.PORTD	=	0xff03

GPIOA.ODR	=	0xff00
GPIOB.ODR	=	0xff01
GPIOC.ODR	=	0xff02
GPIOD.ODR	=	0xff03

GPIO.7SEG	=	0xff00	; GPIOA.ODR
GPIO.LED	=	0xff01	; GPIOB.ODR
	
GPIO.PORTI	=	0xff20	; btn
GPIO.PORTJ	=	0xff10	; sw

GPIOI.IDR	=	0xff20	; GPIO.PORTI
GPIOJ.IDR	=	0xff10	; GPIO.PORTJ

GPIO.BTN	=	0xff20	; GPIOI.IDR
GPIO.SW		=	0xff10	; GPIOJ.IDR
	
	.global	GPIO.PORTA
	.global	GPIO.PORTB
	.global	GPIO.PORTC
	.global	GPIO.PORTD

	.global	GPIOA.ODR
	.global	GPIOB.ODR
	.global	GPIOC.ODR
	.global	GPIOD.ODR

	.global	GPIO.7SEG
	.global	GPIO.LED
	
	.global	GPIO.PORTI
	.global	GPIO.PORTJ

	.global	GPIOI.IDR
	.global	GPIOJ.IDR

	.global	GPIO.SW
	.global GPIO.BTN
	
	.ends

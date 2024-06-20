	.proc	P2
	
PORTA		equ	0xff00
PORTB		equ	0xff01
UART_CTRL	=	0xff41
UART_CPB	=	0xff44
btn		equ	0xff20
	
callin		=	0xf000
enter_by_uart	=	0xf001
putchar		=	0xf00e
print_vhex	=	0xf011
printd		=	0xf013
printf		=	0xf014
pesf		=	0xf015
	
dummy		=	12
	
	org	1
	jmp	start		;start
	db	dummy
start:	
	mvzl	r1,217
	st	r1,UART_CPB
	mvzl	r1,3		; turn on rx and tx
	st	r1,UART_CTRL

	mvzl	r13,eof_stack
	mvzl	r10,0
	ld	r1,btn
	st	r1,last_btn
	jmp	real_start	 ;try_himem
	
	.segment try_himem
	dummy	=	33
try_himem:
	.export	try_himem
	mvl	r0,0x10000
	mvh	r0,0x10000
	mvzl	r2,0
cyc:
	st	r2,r2+,r0
	cmp	r2,100
	jnz	cyc
	jmp	exit
	db	dummy
exit:
;cyc:
	jmp	real_start
	.ends


	db	dummy

	.seg	main

cyc:
	db	cyc
	.ends
	
	jmp	cyc
	db	dummy
	;db	cyc_belso
cyc:
real_start:	
	call	enter_by_uart		; enter monitor by uart
	mvzl	r0,1			; bitmask of checked button
	call	pressed
	C1 call	callin
	C1 ld	r1,btn
	C1 st	r1,last_btn
	st	r10,PORTA
	st	r10,PORTB
	mov	r1,r10
	mov	r2,r10
	mvzl	r0,msgf
	call	printf
	add	r10,1
	jmp	cyc

msgf:
	db	"%x %d\n"
	.ends			; main
	
;	.seg	try_himem
;	.ends
	
	;; Check button press
	;; ----------------------------------------------------------------
	;; Input: R0= bit mask of examined BTN
	;; Output: C=0 if not pressed, C=1 if pressed
	
last_btn:	ds	1
	
pressed:
	push	lr
	push	r1
	push	r2
	push	r3
	
	ld	r1,last_btn
	ld	r2,btn
	and	r1,r0
	and	r2,r0
	cmp	r1,r2
	EQ jmp	pressed_hamis
	ld	r1,last_btn
	mov	r3,r0
	not	r3
	and	r1,r3
	or	r1,r2
	st	r1,last_btn	
	sz	r2
	Z jmp	pressed_hamis
pressed_igaz:	
	sec
	jmp	pressed_vege
pressed_hamis:
	clc
pressed_vege:
	pop	r3
	pop	r2
	pop	r1
	pop	pc
;	ret
	

	ds	100
eof_stack:	

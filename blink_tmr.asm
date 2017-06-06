	timer_ctrl 	equ	0xc000
	timer_ar	equ	0xc001
	timer_cntr	equ	0xc002
	timer_stat	equ	0xc003

	display		equ	0xf000 ; port A
	led		equ	0xf001 ; port B
	portc		equ	0xf002 ; port C

	nop
	ldl0	r0,timer_ctrl
	ldl0	r1,timer_ar
	ldl0	r2,timer_stat
	ldl0	r3,timer_cntr
	ldl0	r4,display
	ldl0	r5,led
	ldl0	r6,portc
	ldl0	r7,2
	ldl0	r11,0
	
	ldl0	r8,0		; switch OFF leds
	st	r8,r5

	ldl	r9,500000	; AR= 0.5 sec= 500,000 usec
	ldh	r9,500000
	st	r9,r1

	ldl0	r10,3		; start timer
	st	r10,r0
cyc:	
	inc	r11		; free running counter
	st	r11,r6		; displayed on PORTC
	
	ld	r8,r3		; read timer value
	st	r8,r4		; display it on port A

	ld	r8,r0
	ldl0	r12,0xf003
	st	r8,r12
	
	ld	r8,r2		; read status
	and	r8,r8,r7	; check pending bit
	jz	cyc

	st	r7,r2		; clear pending bit
	
	ld	r8,r5		; get LED actual value
	ldl0	r9,0xff		; invert every LEDs
	xor	r8,r8,r9
	st	r8,r5		; put new LED value
	jmp	cyc

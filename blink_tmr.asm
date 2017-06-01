	timer_ctrl	equ	0xc000
	timer_ar	equ	0xc001
	timer_cntr	equ	0xc002
	timer_stat	equ	0xc003

	display		equ	0xf000 ; port A
	led		equ	0xf001 ; port B
	
	ldl0	r0,timer_stat
	ldl0	r1,led
	ldl0	r2,0x0002	; timer upd irq pending bit mask
	ldl0	r3,timer_cntr
	ldl0	r4,display
	ldl0	r5,timer_ctrl
	
	ldl0	r8,0		; switch OFF leds
	st	r8,r1

	ldl	r8,500000	; AR= 0.5 sec= 500,000 usec
	ldh	r8,500000
	ldl0	r9,timer_ar
	st	r8,r9

	ldl0	r10,3
	ldl0	r11,0
	
cyc:	
	inc	r11
	mov	r12,r11
	or	r12,r12,r10
	st	r12,r5
	
	ld	r8,r3		; read counter value
	st	r8,r4		; display it on port A
	
	ld	r8,r0		; read status
	and	r8,r8,r2	; check pending bit
	jz	cyc

	st	r8,r0		; clear pending bit
	ld	r8,r1		; get LED actual value
	ldl0	r9,0xff		; invert every LEDs
	xor	r8,r8,r9
	st	r8,r1		; put new LED value
	jmp	cyc

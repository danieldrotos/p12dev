	.proc	P2

	DR	equ	0xff40
	CTRL	equ	0xff41
	RSTAT	equ	0xff42
	TSTAT	equ	0xff43
	CPB	equ	0xff44
	QUEUE	equ	0xff45

	PORTA	equ	0xff00
	DSP	equ	0xff00
	PORTB	equ	0xff01
	LED	equ	0xff01

	sw	equ	0xff10
	btn	equ	0xff20

check_uart	=	0xf008
read		=	0xf00d
	
	org	0
	ldl0	sp,stack

	ld	r0,btn
	st	r0,last_btn
	mvzl	r1,0x3		; enable rx, tx
	mvzl	r2,CTRL
	st	r1,r2
	
	mvzl	r1,'>'		; send prompt
	mvzl	r2,DR
	st	r1,r2
start:	

main_cyc:
	call	check_input
	NZ ld	r0,DR
	jnz	got_char
	jmp	main_cyc


	jmp	nopress4
	ldl0	r0,2
	call	pressed
	NC jmp	nopress2
	;; press btn[1]: BTND
	call	check_uart
	NC jmp	nopress2
	call	read
	call	send
nopress2:	
	ldl0	r0,4
	call	pressed
	NC jmp	nopress4
	;; press btn[2]: BTNU
	call	check_input
	jz	nopress4
	ld	r0,QUEUE
	jmp	got_char
nopress4:	
	call	check_input
	NZ ld	r0,DR
	jnz	got_char
	jmp	main_cyc
	
got_char:
	cmp	r0,10
	jz	echo_it
	cmp	r0,13
	jz	echo_it
not_eol:
	;mvzl	r2,0x20
	;xor	r2,0xffff
	;sew	r2
	;and	r0,r2		; covert to UPCASE
echo_it:
	call	send
	jmp	main_cyc
	
end:	jmp	start

	
wait_tx:
	;push	LR
	;mvzl	r2,TSTAT
wait_cyc:
	ld	r3,TSTAT
	btst	r3,1
	jz	wait_cyc
	;pop	LR
	ret

send:
	push	LR
	call	wait_tx
	mvzl	r2,DR
	st	r0,r2
	pop	LR
	ret
	
check_input:
	;push	lr
	ld	r4,RSTAT
	st	r4,DSP
	test	r4,1		; Z=0 Received avail
	;pop	LR
	ret
	
	
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
	pop	lr
	ret

	
	ds	100
stack:	

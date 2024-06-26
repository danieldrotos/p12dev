	cpu	p2

callin	= 0xf000
monitor	= 0xf001
putchar	= 0xf00e
prints	= 0xf00f
pvhex	= 0xf011
avail	= 0xf008
read	= 0xf00d
pes	= 0xf012
	
porta	= 0xff00
portb	= 0xff01
led	= 0xff01
sw	= 0xff10
btn	= 0xff20

pre	= 0xff51
clock	= 0xff50
ffcnt	= 0xff52

	org	1
	
	ldl0	sp,verem

	ld	r0,btn
	st	r0,last_btn

	ldl0	r0,s_clrscr
	call	prints

	call	pes
	db	"Hello World!"
	
	ldl0	r0,1
	st	r0,x
	st	r0,y
	call	drawit
	
	;; MAIN cycle
	;; ----------------------------------------------------------------
	;; checks for input events
main_cycle:
	;; Event 1: press of BTN[2]
	ldl0	r0,2
	call	pressed
	C call	callin		; BTN1 pressed: back to monitor
no_press:
	;; Event 2: input on UART
	call	avail		; check UART
	C call	proc_input
	;; No more events to check
	;; free running counter on LEDs
	;; to show activity
show_counter:	
	ld	r0,counter
	inc	r0
	st	r0,counter
	ldl0	r1,1000
	call	div
	st	r2,led
	jmp	main_cycle

	
	;; Process UART input
	;; ----------------------------------------------------------------
proc_input:
	push	lr
	call	read
	ld	r1,porta
	shl	r1
	shl	r1
	shl	r1
	shl	r1
	shl	r1
	shl	r1
	shl	r1
	shl	r1
	or	r1,r0
	st	r1,porta

	cmp	r0,32
	NE jmp	pi_no_space
	ld	r0,down
	xor	r0,1
	st	r0,down
	ldl0	r0,s_left
	call	prints
	call	drawit
	jmp	pi_end
	
pi_no_space:
	cmp	r0,'w'
	NE jmp	pi_no_w
pi_w:
	ld	r0,y		; hatar?
	cmp	r0,1		; y==1
	EQ jmp	pi_end
	ld	r0,down
	sz	r0
	Z ldl0	r0,s_clrch	; clear *
	NZ ldl0	r0,s_left
	call	prints
	ld	r0,y		; y--
	dec	r0
	st	r0,y
	ldl0	r0,s_up		; cursor UP
	call	prints
	call	drawit	
	jmp	pi_end

pi_no_w:
	cmp	r0,'a'
	NE jmp	pi_no_a
pi_a:
	ld	r0,x		; hatar?
	cmp	r0,1		; x==1
	EQ jmp	pi_end
	ld	r0,down
	sz	r0
	Z ldl0	r0,s_clrch	; clear *
	NZ ldl0	r0,s_left
	call	prints
	ld	r0,x		; x--
	dec	r0
	st	r0,x
	ldl0	r0,s_left	; cursor LEFT
	call	prints
	call	drawit
	jmp	pi_end

pi_no_a:
	cmp	r0,'s'
	NE jmp	pi_no_s
pi_s:
	ld	r0,y		; hatar?
	cmp	r0,24		; y==24
	EQ jmp	pi_end
	ld	r0,down
	sz	r0
	Z ldl0	r0,s_clrch	; clear *
	NZ ldl0	r0,s_left
	call	prints
	ld	r0,y		; y++
	inc	r0
	st	r0,y
	ldl0	r0,s_down	; cursor DOWN
	call	prints
	call	drawit
	jmp	pi_end
	
pi_no_s:
	cmp	r0,'d'
	NE jmp	pi_no_d
pi_d:
	ld	r0,x		; hatar?
	cmp	r0,79		; x==79
	EQ jmp	pi_end
	ld	r0,down
	sz	r0
	Z ldl0	r0,s_clrch	; clear *
	NZ ldl0	r0,s_left
	call	prints
	ld	r0,x		; x++
	inc	r0
	st	r0,x
	ldl0	r0,s_right	; cursor RIGHT
	call	prints
	call	drawit
	jmp	pi_end

pi_no_d:
	cmp	r0,'c'
	NE jmp	pi_no_0

	ldl0	r0,s_clrscr
	call	prints

	ldl0	r0,1
	st	r0,x
	st	r0,y
	call	drawit
	
	jmp	pi_end
	
pi_no_0:	
	;call	putchar
pi_end:	
	pop	pc
;	ret
s_clrch: db	"\e[D \e[D"
s_up:	db	"\e[A"
s_down:	db	"\e[B"
s_left:	db	"\e[D"
s_right: db	"\e[C"

drawit:
	push	lr
	push	r0
	ld	r0,down
	sz	r0
	Z ldl0	r0,'o'
	NZ ldl0	r0,'*'
	call	putchar
	pop	r0
	pop	pc
;	ret
	
	;; Check button press
	;; ----------------------------------------------------------------
	;; Input: R0= bit mask of examined BTN
	;; Output: C=0 if not pressed, C=1 if pressed
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

	
	;; Unsigned integer division
	;; ----------------------------------------------------------------
	;; INPUT  R0= N, R1= D
	;; OUTPUT R2= Q, R3= R
div:
	push	lr
	push	r4
	
	sz	r1
	NZ jmp	div_dok
	mov	r2,r0		; div by zero
	mvzl	r3,0
	jmp	div_ret
div_dok:
	mvzl	r2,0		; Q= 0
	mvzl	r3,0		; R= 0
	mvh	r4,0x80000000	; m= 1<<31
	mvl	r4,0x80000000
div_cyc:
	sz	r4
	Z jmp	div_ret
	shl	r3		; r<<= 1
	test	r0,r4		; if (n&m)
	NZ or	r3,1		; r|= 1
	cmp	r3,r1		; if (r>=d)
	LO jmp	div_cyc_next
	sub	r3,r1		;r-= d
	or	r2,r4		;q|= m
	jmp	div_cyc_next
	jmp	div_cyc
div_cyc_next:
	shr	r4		; m>>= 1
	jmp	div_cyc
div_ret:
	pop	r4
	pop	pc
;	ret


	;; Varialbles
	;; ----------------------------------------------------------------
s_clrscr: db	"\e[2J\e[H"

last_btn:
	ds	1
x:
	ds	1
y:
	ds	1
down:
	dd	0
counter:
	dd	0


	;; Stack
	;; ----------------------------------------------------------------	
	ds	100
verem:

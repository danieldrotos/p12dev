	cpu	p2
	
pvhex	= 0xf011

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

;	call	print_hack
;	db	"a\n"
;vege:
;	jmp	vege
	
	ldl0	r0,25000
	st	r0,pre
	ldl0	r0,100
	st	r0,ffcnt
	ldl0	r0,1
	st	r0,led
		
	ld	r0,btn
	st	r0,last_btn
ciklus:
	call	monitor
		
	ld	r0,ffcnt
	sz	r0
	Z call	ff_leptetes
		
	ldl0	r0,2
	call	local_pressed
	NC jmp 	tovabb
; BTN1 megnyomodott
; run= !run
	ld	r0,run
	sz	r0
	Z ldl0	r0,1
	NZ ldl0	r0,0
	st	r0,run
		
tovabb:
	jmp	ciklus

ido_tabla:
	dd	10
	dd	20
	dd	50
	dd	100
	dd	200
	dd	500
	dd	750
	dd	1000
		
ff_leptetes:
	push	lr
	ld	r0,run
	sz	r0
	Z jmp	nem_leptet
	ld	r0,sw
	btst	r0,7
	ld	r1,r0,ido_tabla
	st	r1,ffcnt
	
	ld	r0,led
	test	r0,0x8000
	NZ ldl0	r0,1
	Z shl	r0
	st	r0,led
nem_leptet:
	pop	pc
;	ret

; R0: address of string 
print:
	push	lr
	sz	r0
	Z jmp	print_vege
	mov	r1,r0
	ldl0	r2,0
print_ciklus:
	ld	r0,r1+,r2
	sz	r0
	Z jmp	print_vege
	call	putchar
	jmp	print_ciklus
print_vege:		
	pop	lr
	ret

	;; Print string which follows the CALL
	;; Returns to address after the string
	;; Input: R14: address of str, must be after CALL
print_hack:
	push	r1
	push	lr
	push	r2
	push	r0
	mov	r0,lr
	mov	r1,r0
	ldl0	r2,0
printh_ciklus:
	ld	r0,r1+,r2
	sz	r0
	Z jmp	printh_vissza
	call	putchar
	jmp	printh_ciklus
	;; R1 points after string 0
	;; return to that address
printh_vissza:
	pop	r0
	pop	r2
	pop	lr
	mov	lr,r1
	pop	r1
	ret

; R0: bit mask of examined BTN
local_pressed:
	push	lr
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
	pop	lr
	ret
		
hello_string:
	db	"Hello World!\n"
last_btn:
	ds	1
run:
	db	1
		
	ds	100
verem:
	db	0
	

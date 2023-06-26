	.proc	P2

	DR	equ	0xff40
	CTRL	equ	0xff41
	RSTAT	equ	0xff42
	TSTAT	equ	0xff43
	CPB	equ	0xff44
	QUEUE	equ	0xff45
	IRA	equ	0xff46
	CHARCNT equ	0xff47
	FIFOCNT equ	0xff48
	FULLCNT equ	0xff49
	
	PORTA	equ	0xff00
	DSP	equ	0xff00
	PORTB	equ	0xff01
	LED	equ	0xff01
	PORTC	equ	0xff02
	PORTD	equ	0xff03
	
	sw	equ	0xff10
	btn	equ	0xff20

	org	1

	mvzl	sp,eof_stack
	mvzl	r0,0
	st	r0,obuf_ff
	st	r0,obuf_lu
main:
	call	do_obuf
	jmp	main


do_obuf:
	push	lr
	push	r0
	push	r1
	push	r2
	ld	r0,TSTAT
	test	r0,1		; TC bit
	jz	do_obuf_ret
	;; TC==1
	ld	r1,obuf_ff
	ld	r2,obuf_lu
	cmp	r1,r2
	jz	do_obuf_ret
	;; not empty
	
do_obuf_ret:
	pop	r2
	pop	r1
	pop	r0
	pop	lr
	ret
	
	
obuf_size =	128
obuf:
	ds	128
obuf_ff:
	dd	0
obuf_lu:
	dd	0
	
stack:
	ds	200
eof_stack:	

	.proc	P2

	UART_DR	=	0xff40
	UART_STAT =	0xff41
	UART_CTRL =	0xff42
	UART_CPB =	0xff43
	NL	=	10
	
	org	0

	jmp	start

start:
	;; Setup STACK
	mvzl	sp,stack_end
	;; Setup UART
	mvzl	r0,UART_CPB
	mvzl	r1,217
	st	r1,r0
	mvzl	r0,UART_CTRL
	mvzl	r1,3
	st	r1,r0

	mvzl	r0,final_sign
	call	prints

	;; Setup variables
	call	setup_line
	
	;; Ready to work
	jmp	main

	;; Setup line buffer
setup_line:
	;push	lr
	mvzl	r0,line_ptr	; lptr= 0
	mvzl	r1,0
	st	r1,r0
	mvzl	r0,line		; line[0]= 0
	st	r1,r0
	mvzl	r0,at_eol	; at_eol= 1
	mvzl	r1,1
	st	r1,r0
	;pop	lr
	ret
	
main:
	call	check_uart
	jz	no_input
	;; input avail
	call	read
	call	proc_input
	C0 jmp	no_line
	;; line is ready
	call	proc_line
	call	setup_line
no_line:	
no_input:	
	jmp	main

	;; IN: - OUT: Flag.Z=0 input avail
check_uart:
	;push	lr
	mvzl	r0,UART_STAT
	ld	r1,r0
	test	r1,1		; Z=1: nochar Z=0: input avail
	;pop	lr
	ret

	;; IN: - OUT: R0
read:
	;push	lr
	mvzl	r0,UART_DR
	ld	r0,r0
	;pop	lr
	ret

	;; IN: R0 character OUT: line, Flag.C=1 line is ready
proc_input:
	push	lr
	cmp	r0,10
	EQ jmp	got_eol
	cmp	r0,13
	EQ jmp	got_eol
got_char:	
	mvzl	r1,at_eol	; at_aol= 0
	mvzl	r2,0
	st	r2,r1
	mvzl	r1,line_ptr	; line[line_ptr]= char
	ld	r3,r1
	mvzl	r2,line
	st	r0,r2,r3
	;; TODO: check line_ptr for overlow
	plus	r3,1		; line_ptr++
	st	r3,r1
	mvzl	r4,0
	st	r4,r2,r3	; line[line_ptr]= 0
	call	putchar		; echo
	clc
	jmp	proc_input_ret
got_eol:	
	mvzl	r1,at_eol
	ld	r1,r1
	sz	r1		; Z=0 at eol -> skip, not ready
	Z0 clc
	Z1 sec
proc_input_ret:	
	pop	lr
	ret

	;; IN: OUT:
proc_line:
	push	lr
	;; eol is not echoed, so start with print LN
	mvzl	r0,NL
	call	putchar

	mvzl	r0,s1
	call	prints
	mvzl	r0,line
	call	prints
	mvzl	r0,10
	call	putchar
	mvzl	r0,at_eol	; at_eol= 1
	mvzl	r1,1
	st	r1,r0
	pop	lr
	ret
s1:	db	"Got:"	
	;; IN: r0
putchar:
	;push	lr
	mvzl	r2,UART_STAT
wait_tc:	
	ld	r1,r2
	test	r1,2
	jz	wait_tc
	mvzl	r2,UART_DR
	st	r0,r2
	;pop	lr
	ret

	;; IN: R0 address of string
prints:
	push	lr
	mvzl	r4,0
prints_go:
	ld	r3,r4+,r0
	sz	r3
	jz	prints_done
	push	r0
	mov	r0,r3
	call	putchar
	pop	r0
	jmp	prints_go
prints_done:
	pop	lr
	ret
	
line:		ds	100
line_ptr:	ds	1
at_eol:		ds	1
	
stack:
	ds	0x100
stack_end:
	ds	1
final_sign:
	db	"EOF P MONITOR\n"
	
	

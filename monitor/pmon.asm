	.proc	P2

	UART_DR	=	0xff40
	UART_STAT =	0xff41
	UART_CTRL =	0xff42
	UART_CPB =	0xff43
	
	org	0

	jmp	_m_start

_m_start:
	;; Setup STACK
	mvzl	sp,_m_stack_end
	;; Setup UART
	mvzl	r0,UART_CPB
	mvzl	r1,217
	st	r1,r0
	mvzl	r0,UART_CTRL
	mvzl	r1,3
	st	r1,r0

	mvzl	r0,_m_final_sign
	call	_m_prints

	;; Setup variables
	call	_m_setup_line
	
	;; Ready to work
	jmp	_m_main

	;; Setup line buffer
_m_setup_line:
	;push	lr
	mvzl	r0,_m_lptr
	mvzl	r1,0
	st	r1,r0
	mvzl	r0,_m_line
	st	r1,r0
	;pop	lr
	ret
	
_m_main:
	call	_m_check_uart
	jz	_m_no_input
	;; input avail
	call	_m_read
	call	_m_proc_input
	C0 jmp	_m_no_line
	;; line is ready
	call	_m_proc_line
	call	_m_setup_line
_m_no_line:	
_m_no_input:	
	jmp	_m_main

	;; IN: - OUT: Flag.Z=0 input avail
_m_check_uart:
	;push	lr
	mvzl	r0,UART_STAT
	ld	r1,r0
	test	r1,1		; Z=1: nochar Z=0: input avail
	;pop	lr
	ret

	;; IN: - OUT: R0
_m_read:
	;push	lr
	mvzl	r0,UART_DR
	ld	r0,r0
	;pop	lr
	ret

	;; IN: R0 character OUT: line, Flag.C=1 line is ready
_m_proc_input:
	push	lr
	cmp	r0,10
	EQ sec
	EQ jmp	_m_proc_input_done
	cmp	r0,13
	EQ sec
	EQ jmp	_m_proc_input_done

	clc
_m_proc_input_done:	
	pop	lr
	ret

	;; IN: OUT:
_m_proc_line:
	push	lr
	pop	lr
	ret
	
	;; IN: r0
_m_putchar:
	;push	lr
	mvzl	r2,UART_STAT
_m_wait_tc:	
	ld	r1,r2
	test	r1,2
	jz	_m_wait_tc
	mvzl	r2,UART_DR
	st	r0,r2
	;pop	lr
	ret

	;; IN: R0 address of string
_m_prints:
	push	lr
	mvzl	r4,0
_m_prints_go:
	ld	r3,r4+,r0
	sz	r3
	jz	_m_prints_done
	push	r0
	mov	r0,r3
	call	_m_putchar
	pop	r0
	jmp	_m_prints_go
_m_prints_done:
	pop	lr
	ret
	
_m_line:
	ds	100
_m_lptr:
	ds	1
	
_m_stack:
	ds	0x100
_m_stack_end:
	ds	1
_m_final_sign:
	db	"EOF P MONITOR\n"
	
	

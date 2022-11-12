	.proc	P2

	UART_DR	=	0xff40
	UART_CTRL =	0xff41
	UART_RSTAT =	0xff42
	UART_TSTAT =	0xff43
	UART_CPB =	0xff44
	NL	=	10
	CR	=	13
	
	org	0
	jmp	start

start:
	;; Setup STACK
	mvzl	sp,stack_end

	;; test
	;; test
	
	;; Setup UART
	mvzl	r0,UART_CPB
	mvzl	r1,217
	st	r1,r0
	mvzl	r0,UART_CTRL
	mvzl	r1,3
	st	r1,r0
	;; Print welcome message
	mvzl	r0,msg_start
	call	printsnl

	;; Setup variables
	call	setup_line
	
	;; Ready to work
	jmp	main

	
	;; Setup line buffer
	;; -----------------
setup_line:
	push	lr
	mvzl	r0,line_ptr	; lptr= 0
	mvzl	r1,0
	st	r1,r0
	mvzl	r0,line		; line[0]= 0
	st	r1,r0
	mvzl	r0,at_eol	; at_eol= 1
	mvzl	r1,1
	st	r1,r0
	;; print prompt
	mvzl	r0,prompt
	call	prints
	pop	lr
	ret

	
	;; MAIN cycle
	;; ==========
main:
	call	check_uart
	C0 jmp	no_input
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


	;; Check UART for input available
	;; ------------------------------
	;; IN: -
	;; OUT: Flag.C=1 input avail
check_uart:
	;push	lr
	mvzl	r0,UART_RSTAT
	ld	r10,r0
	test	r10,1		; Z=1: nochar Z=0: input avail
	clc
	Z0 sec
	;pop	lr
	ret

	
	;; IN: -
	;; OUT: R0
read:
	;push	lr
	mvzl	r0,UART_DR
	ld	r0,r0
	;pop	lr
	ret

	
	;; IN: R0 character 
	;; OUT: line, Flag.C=1 line is ready
proc_input:
	push	lr
	cmp	r0,NL
	EQ jmp	got_eol
	cmp	r0,CR
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


	;; Process content of line buffer
	;; ------------------------------
	;; IN: -
	;; OUT: -
proc_line:
	push	lr
	;; eol is not echoed, so start with print NL
	mvzl	r0,NL
	call	putchar

	;; Simple echo
	mvzl	r0,s1
	call	prints
	mvzl	r0,line
	call	printsnl
	
	mvzl	r0,at_eol	; at_eol= 1
	mvzl	r1,1
	st	r1,r0
	pop	lr
	ret
s1:	db	"Got:"


	;; Check if a character is a delimiter
	;; -----------------------------------
	;; IN: R0 character
	;; OUT: Flag.C=1 if true
is_delimiter:
	push	lr
	mvzl	r1,delimiters
	call	strchr
	pop	lr
	ret


;;; STRING UTILITIES
;;; ==================================================================

	;; locate charater in string
	;; IN: R0 character, R1 string address
	;; OUT: R1 address of char found, or NULL, Flag.C=1 if found
strchr:
	ld	r2,r1
	sz	r2
	jz	strchr_no	; eof string found
	cmp	r2,r0		; compare
	jz	strchr_yes
	plus	r1,1		; go to next char
	jmp	strchr
strchr_yes:
	sec
	ret
strchr_no:
	mvzl	r1,0
	clc
	ret

	
;;; SERIAL IO
;;; ==================================================================
	
	;; Send one character
	;; ------------------
	;; IN: r0
	;; OUT: -
putchar:
	;push	lr
	mvzl	r2,UART_TSTAT
wait_tc:	
	ld	r9,r2
	test	r9,1
	jz	wait_tc
	mvzl	r2,UART_DR
	st	r0,r2
	;pop	lr
	ret

	
	;; Print string
	;; ------------
	;; IN: R0 address of string
	;; OUT: -
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


	;; Print string and append a NL
	;; ----------------------------
	;; IN: R0 address of string
	;; OUT: -
printsnl:
	push	lr
	call	prints
	push	r0
	mvzl	r0,NL
	call	putchar
	pop	r0
	pop	lr
	ret

	
;;; VARIABLES
;;; ---------
line:		ds	100	; line buffer
line_ptr:	ds	1	; line pointer (index)
at_eol:		ds	1	; bool, true if EOL arrived

msg_start:	db	"PMonitor v1.0"
prompt:		db	">"
delimiters:	db	" \t\v,="
	
	
;;; STACK
;;; -----
stack:
	ds	0x100
stack_end:
	ds	1
final_sign:
	db	"EOF PMonitor\n"

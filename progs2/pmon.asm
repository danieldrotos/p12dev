	.proc	P2

	UART_DR		=	0xff40
	UART_CTRL	=	0xff41
	UART_RSTAT	=	0xff42
	UART_TSTAT	=	0xff43
	UART_CPB	=	0xff44
	LF		=	10
	CR		=	13
	MAX_WORDS	=	5
	
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


	;; IN: R0 character 
	;; OUT: line, Flag.C=1 line is ready
proc_input:
	push	lr
	cmp	r0,LF
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
	st	r4,r3+,r2	; line[line_ptr]= 0
	st	r4,r3		; double 0 at end, needed by tokenizer
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
	mvzl	r0,LF
	call	putchar

	;; Simple echo
	mvzl	r0,s1
	call	prints
	mvzl	r0,line
	call	printsnl

	call	tokenize
	
	mvzl	r4,0
aa1:	mvzl	r5,words
	ld	r0,r4+,r5
	push	r4
	call	printsnl
	pop	r4
	cmp	r4,MAX_WORDS
	NE jmp	aa1
	
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


	;; Tokenize line
	;; -------------
	;; IN: line
	;; OUT: words table
tokenize:
	push	lr
	mvzl	r4,words	; array of result
	mvzl	r5,line		; address of next char
	mvzl	r6,0		; nuof words found
	mvzl	r7,0		; bool in_word
tok_cycle:	
	ld	r0,r5		; pick a char
	sz	r0		; check end
	jz	tok_delimiter	; found end, pretend delim
tok_neol:	
	call	is_delimiter
	C1 jmp	tok_delimiter
tok_char:			; found a non-delimiter
	sz	r7
	jnz	tok_next	; still inside word
	;; delim->word, start of word
	mvzl	r7,1		; in_word=true
	st	r5,r6+,r4	; record word address
	cmp	r6,MAX_WORDS	; If no more space
	EQ jmp	tok_ret		; then return
	jmp	tok_next
tok_delimiter:			; found a non-delimiter
	sz	r7
	jz	tok_next	; still between words
	;; word->delim, end of word
	mvzl	r7,0		; in_word=false
	mvzl	r1,0		; put a 0 at the end of word
	st	r1,r5,r1
tok_next:
	sz	r0		; check EOL
	jz	tok_ret		; jump out if char==0
	add	r5,1
	jmp	tok_cycle
tok_ret:
	mvzl	r1,0
	cmp	r6,MAX_WORDS
	jz	tok_end
	st	r1,r6+,r4
	jmp	tok_ret
tok_end:	
	pop	lr
	ret

	
;;; STRING UTILITIES
;;; ==================================================================

	;; locate charater in string
	;; IN: R0 character, R1 string address
	;; OUT: R1 address of char found, or NULL, Flag.C=1 if found
strchr:
	push	r1
	push	r2
strchr_cyc:
	ld	r2,r1
	sz	r2
	jz	strchr_no	; eof string found
	cmp	r2,r0		; compare
	jz	strchr_yes
	plus	r1,1		; go to next char
	jmp	strchr_cyc
strchr_yes:
	sec
	jmp	strchr_ret
strchr_no:
	mvzl	r1,0
	clc
strchr_ret:
	pop	r2
	pop	r1
	ret

	
;;; SERIAL IO
;;; ==================================================================
	
	;; Check UART for input available
	;; ------------------------------
	;; IN: -
	;; OUT: Flag.C=1 input avail
check_uart:
	push	r0
	mvzl	r0,UART_RSTAT
	ld	r0,r0
	test	r0,1		; Z=1: nochar Z=0: input avail
	clc
	Z0 sec
	pop	r0
	ret

	
	;; IN: -
	;; OUT: R0
read:
	;push	lr
	mvzl	r0,UART_DR
	ld	r0,r0
	;pop	lr
	ret

	
	;; Send one character
	;; ------------------
	;; IN: r0
	;; OUT: -
putchar:
	;push	lr
	push	r2
	push	r9
	mvzl	r2,UART_TSTAT
wait_tc:	
	ld	r9,r2
	test	r9,1
	jz	wait_tc
	mvzl	r2,UART_DR
	st	r0,r2
	pop	r9
	pop	r2
	;pop	lr
	ret

	
	;; Print string
	;; ------------
	;; IN: R0 address of string
	;; OUT: -
prints:
	push	lr
	push	r0
	push	r3
	push	r4
	
	mvzl	r4,0
	sz	r0
	Z1 mvzl	r0,null_str
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
	pop	r4
	pop	r3
	pop	r0
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
	mvzl	r0,LF
	call	putchar
	pop	r0
	pop	lr
	ret

	
;;; VARIABLES
;;; ---------
line:		ds	100		; line buffer
line_ptr:	ds	1		; line pointer (index)
at_eol:		ds	1		; bool, true if EOL arrived
words:		ds	5		; Tokens of line
	
msg_start:	db	"PMonitor v1.0"
prompt:		db	">"
delimiters:	db	" \t\v,=[]"
null_str:	db	"(null)"
	
	
;;; STACK
;;; -----
stack:
	ds	0x100
stack_end:
	ds	1
final_sign:
	db	"EOF PMonitor\n"

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
	mvzl	r0,1
	mvzl	r1,echo
	st	r0,r1
	
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
	st	r4,r3,r2	; double 0 at end, needed by tokenizer
	mvzl	r4,echo		; check if echo is turned on
	ld	r4,r4
	sz	r4
	NZ call	putchar		; echo
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
;	mvzl	r0,sdummy1
;	call	prints
;	mvzl	r0,line
;	call	printsnl

	call	tokenize
	;; DEBUG: print words
;	mvzl	r4,0
;aa1:	mvzl	r5,words
;	ld	r0,r4+,r5
;	push	r4
;	call	printsnl
;	pop	r4
;	cmp	r4,MAX_WORDS
;	NE jmp	aa1

	call	find_cmd
	C0 jmp	cmd_not_found

cmd_found:
	call	r0,0
	
	jmp	proc_line_ret
cmd_not_found:
	mvzl	r0,snotfound
	call	printsnl

proc_line_ret:	
	mvzl	r0,at_eol	; at_eol= 1
	mvzl	r1,1
	st	r1,r0
	pop	lr
	ret
sdummy1:	db	"Got:"
snotfound:	db	"Unknown command"
	

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

	
	;; Look up command table
	;; IN: first words in tokenized list
	;; OUT: Flag.C=1 if command found
	;;      R0 address of command function, or NULL
find_cmd:
	push	lr
	push	r1
	push	r2
	push	r10
	mvzl	r0,words	; R0= 1st word of command
	ld	r0,r0
	sz	r0
	jz	find_cmd_false
	
	mvzl	r10,commands
find_cmd_cyc:	
	ld	r2,r10		; R2= cmd addr
	sz	r2
	jz	find_cmd_false
	add	r10,1
	mov	r1,r10		; R1= cmd string
	add	r10,1
	call	streq
	C0 jmp	find_cmd_cyc
find_cmd_true:
	mov	r0,r2
	sec
	jmp	find_cmd_ret
c_cmd_name:	db	"//C"
find_cmd_false:
	add	r0,1		; check second word
	ld	r1,r0		; for //C command
	sz	r1
	jz	find_cmd_very_false
	mvzl	r0,c_cmd_name
	call	streq
	jnz	find_cmd_very_false
	mvzl	r2,cmd_c
	jmp	find_cmd_true
find_cmd_very_false:	
	clc
	mvzl	r0,0
find_cmd_ret:
	pop	r10
	pop	r2
	pop	r1
	pop	lr
	ret

;;; M ADDR [VALUE]
cmd_m:
	push	lr
	mvzl	r2,words
	mvzl	r0,0
	;ld	r3,r0+,r2	; "m"
	ld	r4,r2,1		; addr
	ld	r5,r2,2		; value
	sz 	r4
	jz	m_ret
	
	mov	r0,r4
	call	htoi
	mov	r4,r1
	C1 jmp	m_addr_ok
	mvzl	r0,m_err_addr
	call	printsnl
	jmp	m_ret
m_addr_ok:
	sz	r5
	jz	m_read
m_write:	
	cmp	r4,the_end
	HI jmp	m_addrv_ok
	mvzl	r0,m_err_addrv
	call	printsnl
	jmp	m_ret
m_addrv_ok:
	mov	r0,r5
	call	htoi
	mov	r5,r1
	C1 jmp	m_value_ok
	mvzl	r0,m_err_value
	call	printsnl
	jmp	m_ret
m_value_ok:
	st	r5,r4
	;jmp	m_ret
m_read:
	mov	r0,r4
	mvzl	r1,4
	call	print_vhex
	mvzl	r0,0x20
	call	putchar
	ld	r0,r4
	mvzl	r1,4
	call	print_vhex
	mvzl	r0,LF
	call	putchar
m_ret:
	pop	lr
	ret
m_err_addr:	db	"Address error"
m_err_addrv:	db	"Monitor's address"
m_err_value:	db	"Value error"
	
;;; E [BOOL]
cmd_e:
	ret

;;; VALUE //C ADDR
cmd_c:
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


	;; Check if strings are equal
	;; --------------------------
	;; IN: R0, R1 addresses of strings
	;;     R3==true case sensitive
	;;     R3==false case insensitive
	;; OUT: Flag.C=1 equal
str_cmp_eq:
	push	lr		; Save used registers
	push	r0		; and input parameters
	push	r1
	push	r2
	push	r4
	push	r5
	push	r6
streq_cyc:	
	ld	r2,r0		; Got one-one char
	ld	r6,r1		; from two strings
	sz	r3		; Prepare for comparing
	Z1 or	r2,0x20		; if insensitive case
	sz	r3
	Z1 or	r6,0x20
	cmp	r2,r6		; compare them
	jnz	streq_no	; if differs: strings are not equal

	ld	r2,r0		; Pick original (non-prepared)
	ld	r6,r1		; chars to check EOS
	sz	r2		; convert them to boolean
	Z0 mvzl	r2,1		; values in R2,R6
	Z1 mvzl	r2,0		; and copy in R4,R5
	mov	r4,r2
	sz	r6
	Z0 mvzl	r6,1
	Z1 mvzl r6,0
	mov	r5,r6
	or	r4,r5		; if both are EOS: equal
	jz	streq_yes
	and 	r2,r6		; just one is EOS: not equal
	jz	streq_no
	plus	r0,1		; non are EOS: go to check next char
	plus	r1,1
	jmp	streq_cyc
	
streq_no:
	clc			; False result
	jmp	streq_ret

streq_yes:
	sec			; True result
	
streq_ret:
	pop	r6
	pop	r5
	pop	r4
	pop	r2
	pop	r1
	pop	r0
	pop	lr
	ret
	

	;; Compare strings case sensitive way
	;; IN: R0, R1 addresses of strings
	;; OUT Flag.C==1 if equals
streq:
	push	lr
	push	r3
	mvzl	r3,1
	call	str_cmp_eq
	pop	r3
	pop	lr
	ret

	
	;; Compare strings case insensitive way
	;; IN: R0, R1 addresses of strings
	;; OUT Flag.C==1 if equals
strieq:
	push	lr
	push	r3
	mvzl	r3,0
	call	str_cmp_eq
	pop	r3
	pop	lr
	ret


hexchar2value:
	cmp	r0,'/'
	LS jmp	hc2v_nok
	cmp	r0,'9'
	LS jmp	hc2v_0_9
	cmp	r0,'@'
	LS jmp	hc2v_nok
	cmp	r0,'F'
	LS jmp	hc2v_A_F
	cmp	r0,'`'
	LS jmp	hc2v_nok
	cmp	r0,'f'
	LS jmp	hc2v_a_f
	jmp	hc2v_nok
hc2v_a_f:
	add	r0,10
	sub	r0,'a'
	jmp	hc2v_ok
hc2v_A_F:
	add	r0,10
	sub	r0,'A'
	jmp	hc2v_ok
hc2v_0_9:
	sub	r0,'0'
hc2v_ok:
	sec
	ret
hc2v_nok:	
	clc
	ret

	
value2Hexchar:
	push	r1
	and	r0,0xf
	mvzl	r1,v2hc_table
	ld	r0,r1,r0
	pop	r1
	ret
v2hc_table:	db	"0123456789ABCDEF"

value2hexchar:
	push	lr
	call	value2Hexchar
	or	r0,0x20
	pop	lr
	ret

	
	;; Convert string to number (hexadecimal)
	;; IN: R0 addr of string
	;; OUT: R1 value
	;;      Flag.C=1 success
htoi:
	push	lr
	push	r2
	push	r3
	mvzl	r1,0		; return value
	mvzl	r3,0		; index
htoi_cyc:
	ld	r2,r3+,r0	; pick a char
	sz	r2		; check eof string
	jz	htoi_eos
	cmp	r2,'.'		; skip separators
	jz	htoi_cyc
	cmp	r2,'_'
	jz	htoi_cyc
	push	r0
	mov	r0,r2
	call	hexchar2value
	mov	r2,r0
	pop	r0
	C0 jmp	htoi_nok
	shl	r1
	shl	r1
	shl	r1
	shl	r1
	and	r2,0xf
	or	r1,r2
	jmp	htoi_cyc
htoi_nok:
	clc
	jmp	htoi_ret
htoi_eos:
	cmp	r3,1
	Z1 clc
	Z0 sec
htoi_ret:	
	pop	r3
	pop	r2
	pop	lr
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
	; Z=1: nochar Z=0: input avail
	test	r0,1
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


	;; Print a value in hex format
	;; IN: R0 value
	;;     R1 nr char between .
print_vhex:
	push	lr
	push	r0
	push	r1
	push	r2
	push	r3
	push	r4
	mov	r3,r0
	mvzl	r2,0
	mvzl	r4,1

print_vhex_cyc:	
	mvzl	r0,0
	shl	r3
	rol	r0
	shl	r3
	rol	r0
	shl	r3
	rol	r0
	shl	r3
	rol	r0
	call	value2Hexchar
	call	putchar
	add	r2,1
	cmp	r2,8
	jz	print_vhex_ret
	sz	r1
	jz	print_vhex_nosep
	cmp	r4,r1
	jnz	print_vhex_nosep
	mvzl	r0,'.'
	call	putchar
	mvzl	r4,0
print_vhex_nosep:
	add	r4,1
	jmp	print_vhex_cyc
print_vhex_ret:	
	pop	r4
	pop	r3
	pop	r2
	pop	r1
	pop	r0
	pop	lr
	ret
	
	
;;; VARIABLES
;;; ---------
line:		ds	100		; line buffer
line_ptr:	ds	1		; line pointer (index)
at_eol:		ds	1		; bool, true if EOL arrived
words:		ds	5		; Tokens of line
echo:		ds	1		; bool, do echo or not
	
msg_start:	db	"PMonitor v1.0"
prompt:		db	">"
delimiters:	db	" ;\t\v,=[]"
null_str:	db	"(null)"
	

;;; Command table
commands:
	dd	cmd_m		; M(emory) address [value]
	db	"m"
	dd	cmd_e		; E(cho) on/off
	db	"e"
	dd	0
	db	0
	
;;; STACK
;;; -----
stack:
	ds	0x100
stack_end:
	ds	1
final_sign:
	db	"EOF PMonitor\n"
the_end:
	

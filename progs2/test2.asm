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
	jmp	cold_start

	org	0xf800
_f801:	jmp	cold_start
_f80a:	jmp	putchar
_f80b:	jmp	prints
_f80c:	jmp	printsnl

	org	0xf836
def_zero:
	jmp	cold_start
cold_start:
	mvzl	r0,0
	st	r0,called
	mvzl	r0,def_zero	; restore jmp to monitor at zero
	ld	r0,r0
	st	r0,0
	mvzl	r0,0		; def values of some regs
	st	r0,regf		; FALGS= 0
	mvzl	r0,0xf7ff	; R13= 0xf7ff
	st	r0,reg13
	jmp	common_start	
common_start:
	mvzl	sp,stack_end
	mvzl	r0,1
	st	r0,echo
	mvzl	r0,0
	setf	r0

	;; Setup UART
	mvzl	r1,217
	st	r1,UART_CPB
	mvzl	r1,3
	st	r1,UART_CTRL
	;; Print welcome message
	mvzl	r0,msg_start
	call	printsnl

end:	jmp	end
	

	;; Send one character
	;; ------------------
	;; IN: r0
	;; OUT: -
org 0xfbbb
putchar:
	push	r9
wait_tc:	
	ld	r9,UART_TSTAT
	test	r9,1
	jz	wait_tc
	st	r0,UART_DR
	pop	r9
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
	push	r2
	
	mvzl	r4,0
	sz	r0
	Z1 mvzl	r0,null_str
	mov	r2,r0
prints_go:
	ld	r0,r4+,r2
	sz	r0
	jz	prints_done
	call	putchar
	jmp	prints_go
	
prints_done:
	pop	r2
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
echo:		ds	1		; bool, do echo or not
called:		dd	0		; bool, entered by CALLIN
nuof_reg:	dd	0		; nr of reg for Rx command
	
reg0:		dd	0
reg1:		dd	0
reg2:		dd	0
reg3:		dd	0
reg4:		dd	0
reg5:		dd	0
reg6:		dd	0
reg7:		dd	0
reg8:		dd	0
reg9:		dd	0
reg10:		dd	0
reg11:		dd	0
reg12:		dd	0
reg13:		dd	0
reg14:		dd	0
reg15:		dd	0
regf:		dd	0

msg_start:	db	"PMonitor v1.0"
null_str:	db	"(null)"

stack:
	ds	0xc0
stack_end:	
	ds	1
final_sign:
	db	"EOF PMonitor\n"
the_end:

	.proc	p2

	.org	1

main:
	;; setup clock (1ms)
	mvzl	sp,stack
	mvzl	r0,24999
	st	r0,CLOCK.PRE
	;; calc initial period time
	call	fr2pt
	ld	r0,ptime
	st	r0,CLOCK.BCNT2
	;; init line editor
	mvzl	r0,buffer
	mvzl	r1,40
	call	le_init
	;;
	call	prompt
	
	;; main cycle
cycle:
	call	blink		; handle clock events
	call	user_input	; handle user input
	call	btn_press	; handle press of BTN[1]
	jmp	cycle

	
	;; variables
frequ:	.db	5		; frequency [Hz]
ptime:	.db	0		; period time [ms]
buffer:	.ds	40		; user input buffer

	
	;; Calculate period time for given frequency
	;; In : frequ variable in [Hz]
	;; Out: ptime variable in [ms]
	;; ptime= 1000/frequ
fr2pt:
	push	lr
	mvzl	r0,1000
	ld	r1,frequ
	call	div
	st	r2,ptime
	pop	lr
	ret

	
	;; Blink LED when timer expires
blink:
	push	lr
	;; check clock
	ld	r0,CLOCK.BCNT2	; get back counter
	sz	r0		; check if zero
	NZ jmp	blink_ret	; if not, go out
do_blink:	
	;; expired: blink on LED[0]
	ld	r0,GPIO.LED	; read all LEDs
	xor	r0,1		; negate [0]
	st	r0,GPIO.LED	; show it
	;; restart clock
	ld	r0,ptime	; use calculated period time
	st	r0,CLOCK.BCNT2	; restart back counter
blink_ret:	
	pop	lr
	ret


	;; Check for user input and handle it
cmd_quit:
	.db	"quit"		; special command to return to monitor

user_input:
	push	lr
	call	le_read		; read line
	NC jmp	ui_ret		; if not ready, go out
process_input:	
	mvzl	r0,10		; echo ENTER
	call	putchar
	mvzl	r0,buffer	; check for word "quit"
	mvzl	r1,cmd_quit
	call	_strieq		; case insensitive compare
	C call	monitor		; if eq, go out to monitor
	C jmp	ui_done		; normal exit when continued
	;; it was not QUIT command,
	;; suppose it is a decimal number
	mvzl	r0,buffer	; convert entered decimal number
	call	_dtoi		; to integer value
	cmp	r1,1		; check low limit
	ULT jmp	ui_wrong
	cmp	r1,20		; check high limit
	UGT jmp	ui_wrong
	;; value can be accepted
ui_good:	
	st	r1,frequ	; store as frequ
	call	fr2pt		; calculate new period time
	mvzl	r0,0		; force blink event by expiring counter
	st	r0,CLOCK.BCNT2	; to pick up new value
	jmp	ui_done
ui_wrong:
	call	_pesf		; print error message
	.db	"%d not in range 1-20\n"
ui_done:	
	call	prompt		; print prompt
	call	le_start	; restart input reader
ui_ret:	
	pop	lr
	ret


	;; Print prompt
prompt:
	push	lr
	call	_pes
	.db	"Enter fr in Hz (quit to monitor): "
	pop	lr
	ret


	;; Check for button press and handle it
btn_press:
	push	lr
	mvzl	r0,2		; mask of BTN[1]
	call	pressed		; if pressed
	C call	monitor		; then go out to monitor
	mvzl	r0,1		; mask of SW[0]
	call	switched
	C call	monitor
	pop	lr
	ret


	;; STACK
	.ds	99
stack:	.ds	1


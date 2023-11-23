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
	jmp	cycle

	;; variable
frequ:	.db	5		; frequency [Hz]
ptime:	.db	0		; period time [ms]
buffer:	.ds	40		; user input buffer
	
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

blink:
	push	lr
	;; check clock
	ld	r0,CLOCK.BCNT2
	sz	r0
	NZ jmp	blink_ret
do_blink:	
	;; expired: blink on LED[0]
	ld	r0,GPIO.LED
	xor	r0,1
	st	r0,GPIO.LED
	;; restart clock
	ld	r0,ptime
	st	r0,CLOCK.BCNT2
blink_ret:	
	pop	lr
	ret

cmd_quit:
	.db	"quit"
	
user_input:
	push	lr
	call	le_read
	NC jmp	ui_ret
process_input:	
	mvzl	r0,10		; echo ENTER
	call	putchar
	mvzl	r0,buffer	; check for word "quit"
	mvzl	r1,cmd_quit
	call	_strieq
	C call	monitor
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
	mvzl	r0,0		; force blink event
	st	r0,CLOCK.BCNT2	; to pick up new value
	jmp	ui_done
ui_wrong:
	call	_pesf
	.db	"%d not in range 1-20\n"
ui_done:	
	call	prompt		; print prompt
	call	le_start	; restart input reader
ui_ret:	
	pop	lr
	ret

prompt:
	push	lr
	call	_pes
	.db	"Enter fr in Hz (quit to monitor): "
	pop	lr
	ret
	
	.ds	99
stack:	.ds	1


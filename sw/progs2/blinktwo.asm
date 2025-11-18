;;; Blink application
;;; 
;;; blink LED0 with 1 Hz
;;; blink LED1 with 3 Hz
;;; press 'r' key on terminal to turn blinking on/off
;;; press BTN[0] to exit
	
	.cpu	p2		; cpu version selection
	.org	1		; start address of the app

	mvzl	sp,stack	; SP=start of stack
	mvzl	r0,24999	; start clock counter
	st	r0,CLOCK.PRE	; frequ= 1kHz (1ms period)
	call	start		; start both back counters
	
main_cycle:
	;;  check exit condition
	mvzl	r0,0		
	call	monitor_by_button

	;; check terminal input
	call	input_avail
	C call	handle_input

	;; check run variable
	ld	r0,run
	sz	r0
	Z jmp	no_run		; skip the block, if !run
	;; block, if run==true
	ld	r0,CLOCK.BCNT2	; check timer expiration
	sz	r0
	Z call	blink_led0	; call handler if expired
	ld	r0,CLOCK.BCNT3	; other timer
	sz	r0
	Z call	blink_led1	; other handler
no_run:	
	jmp	main_cycle	; end of main

	;; handle terminal input
handle_input:
	push	lr
	call	read		; read ASCII of pressed key
	mov	r0,r4		; echo to terminal
	call	putchar		; using putchar
	cmp	r4,'r'		; check if it was 'r'
	NE jmp	no_r		; skip block, if not
	;; block, if input was 'r'
	ld	r0,run		; run= !run
	xor	r0,1
	st	r0,run
	;; if (run)...
	sz	r0
	Z jmp	run_false
run_true:			; ... then
	call	start		; start
	jmp	run_ready
run_false:			; ... else
	call	stop		; stop
run_ready:
no_r:	
	pop	pc

	;; event handler for BCNT2 expire
blink_led0:
	push	lr
	mvzl	r0,500		; restart BCNT2
	st	r0,CLOCK.BCNT2
	ld	r0,GPIO.LED	; pick actual LED values
	xor	r0,1		; toggle LED0
	st	r0,GPIO.LED	; store new values on LEDs
	pop	pc

	;; event handler for BCNT3 expire
blink_led1:
	push	lr
	mvzl	r0,167		; restart BCNT3
	st	r0,CLOCK.BCNT3
	mvzl	r0,1		; call led toggle function
	call	led_toggle	; for LED1
	pop	pc

	;; called when run becomes TRUE
start:
	push	lr
	mvzl	r0,500		; restart both
	st	r0,CLOCK.BCNT2	; BCNTs
	mvzl	r0,167
	st	r0,CLOCK.BCNT3
	pop	pc

	;; called when run becomes FALSE
stop:
	push	lr
	ld	r0,GPIO.LED	; turn off both LED0 and LED1
	and	r0,0xfffc
	st	r0,GPIO.LED
	pop	pc
	
run:	.dd	1		; run= 1
	
	.ds	100		; stack space
stack:	.ds	1
	

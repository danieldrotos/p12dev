	.proc	p2

	;;
	;; F.C=  pressed        (R0:btn)
	;; F.C=  switched       (R0:sw)
	;;       restart_button ()
	;;       restart_switch ()
	;;       led_on         (R0:led)
	;;       led_off        (R0:led)
	;;       led_toggle     (R0:led)
	;;       led_set        (R0:led, R1:val)
	;; F.C=  led_get        (R0:led)
	;; 

	
	.seg	_lib_segment_nr_to_mask
	
	;; Convert btn/sw number into bitmask
_nr_to_mask::
	push	r1
	and	r0,0xfff0	; max nr is 15
	mvzl	r1,1		; mask for nr==0
nr_to_mask_cyc:	
	sz	r0		; is nr zero?
	jz	nr_to_mask_ret	; if yes, go out
	shl	r1		; shift mask up
	dec	r0		; decrement nr
	jmp	nr_to_mask_cyc	; check for zero
nr_to_mask_ret:
	mov	r0,r1		; return mask in R0
	pop	r1
	ret

	.ends


	.seg	_lib_segment_led

	;; In : R0 number of LED (0-15)
	;; Out: -
led_on::
	push	lr
	push	r1
	call	_nr_to_mask
	ld	r1,GPIO.LED
	or	r1,r0
	st	r1,GPIO.LED
	pop	r1
	pop	pc

	;; In : R0 number of LED (0-15)
	;; Out: -
led_off::
	push	lr
	push	r1
	call	_nr_to_mask
	not	r0
	ld	r1,GPIO.LED
	and	r1,r0
	st	r1,GPIO.LED
	pop	r1
	pop	pc

	;; In : R0 number of LED (0-15)
	;; Out: -
led_toggle::
	push	lr
	push	r1
	call	_nr_to_mask
	ld	r1,GPIO.LED
	xor	r1,r0
	st	r1,GPIO.LED
	pop	r1
	pop	pc

	;; In : R0 number of LED (0-15)
	;;      R1 value (bool)
	;; Out: -
led_set::
	push	lr
	push	r1
	push	r2
	call	_nr_to_mask
	sz	r1
	NZ mov	r1,r0
	not	r0
	ld	r2,GPIO.LED
	and	r2,r0
	or	r2,r1
	st	r2,GPIO.LED
	pop	r2
	pop	r1
	pop	pc

	;; In : R0 number of LED (0-15)
	;; Out: F.C LED value
led_get::
	push	lr
	push	r1
	call	_nr_to_mask
	ld	r1,GPIO.LED
	btst	r1,r0
	Z clc
	NZ sec
	pop	r1
	pop	pc
	
	.ends

	
	.seg	_lib_segment_btn_sw

last_btn:
	ds	1
last_sw:
	ds	1
last_btn_inited:
	db	0
last_sw_inited:	
	db	0

	;; Check button press
	;; Input : R0= number of examined BTN (0-15)
	;; Output: C=0 not pressed
	;;         C=1 pressed
pressed::
	push	lr
	call	_nr_to_mask
	clc
	call	pos_edge
	pop	pc
;	ret

	
	;; Check pos edge on a switch
	;; Input : R0= number of examined SW (0-15)
	;; Output: C=0 not switched
	;;         C=1 switched off->on
switched::
	push	lr
	call	_nr_to_mask
	sec
	call	pos_edge
	pop	pc
;	ret

	
	;; Check button/sw press
	;; ----------------------------------------------------------------
	;; Input: R0= bit mask of examined BTN/SW
	;;        C=0 check BTN
	;;        C=1 check SW
	;; Output: C=0 if not pressed, C=1 if pressed
pos_edge:
	push	lr
	push	r1
	push	r2
	push	r3
	push	r4
	
	C jmp	init_sw
init_btn:	
	ld	r1,last_btn_inited
	sz	r1
	jnz	pressed_inited
	mvzl	r1,1
	st	r1,last_btn_inited
	ld	r1,GPIO.BTN
	st	r1,last_btn
	jmp	pressed_false
init_sw:
	ld	r1,last_sw_inited
	sz	r1
	jnz	pressed_inited
	mvzl	r1,1
	st	r1,last_sw_inited
	ld	r1,GPIO.SW
	st	r1,last_sw
	jmp	pressed_false
pressed_inited:
	;; R1 address of last
	;; R2 address of port
	NC mvzl	r1,last_btn
	NC mvzl	r2,GPIO.BTN
	C mvzl	r1,last_sw
	C mvzl	r2,GPIO.SW
	;; R3 value of last
	;; r4 value of port
	ld	r3,r1
	ld	r4,r2
	and	r3,r0		; masked last
	and	r4,r0		; masked port
	cmp	r3,r4
	EQ jmp	pressed_false
	not	r0		; negated mask
	ld	r3,r1		; original last
	and	r3,r0		; clear checked bit
	or	r3,r4		; or with masked port
	st	r3,r1		; store new last value
	sz	r4		; check new port value
	Z jmp	pressed_false
pressed_true:	
	sec
	jmp	pressed_end
pressed_false:
	clc
pressed_end:
	pop	r4
	pop	r3
	pop	r2
	pop	r1
	pop	pc
;	ret

restart_btn::
restart_button::
	push	r1
	ld	r1,GPIO.BTN
	st	r1,last_btn
	pop	r1
	ret

restart_sw::
restart_switch::
	push	r1
	ld	r1,GPIO.SW
	st	r1,last_sw
	pop	r1
	ret
	
	.ends
	

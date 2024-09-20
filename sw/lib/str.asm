	cpu	p2


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	fn_dtoi
	;; In : R0 address of string/packed
	;; Out: R1 numeric value of string
	;;      F.C=1 conversion success
	;;      F.C=0 conversion error
dtoi::
	push	lr
	push	r2
	push	r3
	push	r4
	push	r5
	
	mvzl	r1,0		; tmp value
	mov	r2,r0		; address in r2
	mvzl	r3,0		; index
	
dtoi_cyc:
	mvzl	r5,0
	ld	r4,r3+,r2	; pick a char
	sz	r4		; end of string?
	jz	dtoi_true	; normal exit
dtoi_byte:
	getbz	r0,r4,r5
	sz	r0
	jz	dtoi_cyc
	call	isdigit		; check ascii char
	jnc	dtoi_false	; exit if not a number
	sub	r0,'0'		; convert char to number
	mul	r1,10		; shift tmp
	add	r1,r0		; add actual number
	inc	r5
	cmp	r5,4
	jz	dtoi_cyc
	jmp	dtoi_byte
	
dtoi_true:
	sec
	jmp	dtoi_ret
dtoi_false:
	clc
dtoi_ret:
	pop	r5
	pop	r4
	pop	r3
	pop	r2
	pop	pc
;	ret

	.ends
	

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	fn_htoi
htoi::
	jmp	_htoi

	.ends
	

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	fn_strchr
strchr::
	jmp	_strchr

	.ends
	

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	fn_streq
streq::
	jmp	_streq

	.ends


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	fn_strieq
strieq::
	jmp	_strieq

	.ends
	

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	fn_strlen
	;; INPUT  R0= address of string/packed
	;; OUTPUT R1= nuof chars in string
strlen::
	push	r0
	push	r2
	push	r3
	push	r4
	mov	r1,r0
	mvzl	r2,0
	mvzl	r4,0
p2_next:
	ld	r3,r1
	sz	r3
	jz	p2_end
p2_cyc:	
	getbz	r0,r3,r2
	sz	r0
	NZ inc	r4
	inc	r2
	test	r2,3
	Z plus	r1,1
	Z jmp	p2_next
	jmp	p2_cyc
p2_end:
	mov	r1,r4
	pop	r4
	pop	r3
	pop	r2
	pop	r0
	ret

	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	fn_strsize
	;; INPUT  R0= address of string/packed
	;; OUTPUT R1= nuof words in memory occupied by string
	;;            (including closing null)
strsize::
	push	r0
	push	r2
	push	r3
	push	r4
	mov	r1,r0
	mvzl	r2,0
	mvzl	r4,0
p2_next:
	ld	r3,r1
	plus	r4,1
	sz	r3
	jz	p2_end
p2_cyc:	
	getbz	r0,r3,r2
	inc	r2
	test	r2,3
	Z plus	r1,1
	Z jmp	p2_next
	jmp	p2_cyc
p2_end:
	mov	r1,r4
	pop	r4
	pop	r3
	pop	r2
	pop	r0
	ret
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

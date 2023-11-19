	.proc	p2

	.seg	dtoi
	;; In : R0 address of string
	;; Out: R0 numeric value of string
	;;      F.C=1 conversion success
	;;      F.C=0 conversion error
dtoi:
	.global	dtoi

	push	lr
	push	r1
	push	r2
	push	r3
	
	mvzl	r1,0		; tmp value
	mov	r2,r0		; address in r2
	mvzl	r3,0		; index

dtoi_cyc:
	ld	r0,r3+,r2	; pick a char
	sz	r0		; end of string?
	jz	dtoi_true	; normal exit
	call	dtoi_is_number	; check ascii char
	jnc	dtoi_false	; exit if not a number
	sub	r0,'0'		; convert char to number
	mul	r1,10		; shift tmp
	add	r1,r0		; add actual number
	jmp	dtoi_cyc
	
dtoi_true:
	sec
	jmp	dtoi_ret
dtoi_false:
	clc
dtoi_ret:
	mov	r0,r1		; return tmp value
	pop	r3
	pop	r2
	pop	r1
	pop	lr
	ret

	;; In : R0 character
	;; Out: F.C=1 number (0-9)
dtoi_is_number:
	cmp	R0,'0'
	ULT jmp	din_false
	cmp	R0,'9'
	UGT jmp	din_false
din_true:
	sec
	ret
din_false:
	clc
	ret
	
	.ends
	

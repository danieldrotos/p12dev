	cpu	p2

	;;
	;; F.C,R4=              dtoi    (R0:str)
	;; F.C,R4=              htoi    (R0:str)
	;; F.C,R4:addr,R5:idx=  strchr  (R0:chr, R1:str)
	;; F.C=                 streq   (R0:str1, R1:str2)
	;; F.C=                 strieq  (R0:str1, R1:str2)
	;; R4=                  strlen  (R0:str)
	;; R4=                  strsize (R0:str)
	;; R4=                  char    (R0:str, R1:idx)
	;; 
	

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_dtoi
	;; In : R0 address of string/packed
	;; Out: R4 numeric value of string
	;;      F.C=1 conversion success
	;;      F.C=0 conversion error
dtoi::
	push	lr
	push	r0
	push	r1
	push	r2
	push	r3
	push	r5
	
	mvzl	r4,0		; return value
	mov	r2,r0		; address in r2
	mvzl	r3,0		; word index
	
dtoi_cyc:
	mvzl	r5,0		; byte index
	ld	r1,r3+,r2	; pick a char
	sz	r1		; end of string?
	jz	dtoi_true	; normal exit
dtoi_byte:
	getbz	r0,r1,r5
	sz	r0
	jz	dtoi_cyc
	call	isdigit		; check ascii char
	jnc	dtoi_false	; exit if not a number
	sub	r0,'0'		; convert char to number
	mul	r4,10		; shift tmp
	add	r4,r0		; add actual number
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
	pop	r3
	pop	r2
	pop	r1
	pop	r0
	pop	pc

	.ends
	

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_htoi
htoi::
	push	lr
	push	r1
	call	_htoi
	mov	r4,r1
	pop	r1
	pop	pc

	.ends
	

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_strchr
strchr::
	push	lr
	push	r1
	push	r2
	call	_strchr
	mov	r4,r1
	mov	r5,r2
	pop	r2
	pop	r1
	pop	pc
	
	.ends
	

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_streq
streq::
	jmp	_streq

	.ends


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_strieq
strieq::
	jmp	_strieq

	.ends
	

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_strlen
	;; INPUT  R0= address of string/packed
	;; OUTPUT R4= nuof chars in string
strlen::
	push	r0
	push	r1
	push	r2
	push	r3
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
	pop	r3
	pop	r2
	pop	r1
	pop	r0
	ret

	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_strsize
	;; INPUT  R0= address of string/packed
	;; OUTPUT R1= nuof words in memory occupied by string
	;;            (including closing null)
strsize::
	push	r0
	push	r1
	push	r2
	push	r3
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
	pop	r3
	pop	r2
	pop	r1
	pop	r0
	ret
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_char
	;; In : R0 address of string/packed
	;;      R1 char index
	;; Out: R1 char at index, or 0
char::
	push	lr
	push	r0
	push	r1
	push	r2
	push	r3
	push	r5

	mvzl	r3,0		; word index
	inc	r1
char_cyc:
	mvzl	r5,0		; start byte index in word
	ld	r4,r3+,r0	; pick a word
	sz	r4		; EOS?
	jz	char_ret_eos
char_byte:
	getbz	r2,r4,r5	; pick byte from word
	sz	r2		; is it 0?
	jz	char_cyc	; if yes, get next word
char_nonz:
	dec	r1		; count
	jz	char_ret_act	; repeat if index is not reached

	inc	r5		; next byte index
	cmp	r5,4		; is it overflowed?
	jz	char_cyc
	jmp	char_byte
	
char_ret_act:
	mov	r4,r2
	jmp	char_ret
char_ret_eos:
	mvzl	r4,0
char_ret:	
	pop	r5
	pop	r3
	pop	r2
	pop	r1
	pop	r0
	pop	pc
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

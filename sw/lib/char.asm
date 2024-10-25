	.proc	p2

	;; 
	;; F.C=  isdigit (R0:char)
	;; F.C=  islower (R0:char)
	;; F.C=  isupper (R0:char)
	;; F.C=  isalpha (R0:char)
	;; F.C=  isalnum (R0:char)
	;; F.C=  isblank (R0:char)
	;; F.C=  isprint (R0:char)
	;; F.C=  ispunct (R0:char)
	;;
	

	.seg	_lib_segment_character_fn
_char_is_true::
	sec
	ret
_char_is_false::
	clc
	ret
	.ends
	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_isdigit
	
	;; In : R0 character
	;; Out: F.C=1 number (0-9)
isdigit:
	.global	isdigit
	cmp	R0,'0'
	ULT jmp	_char_is_false
	cmp	R0,'9'
	UGT jmp	_char_is_false
	jmp _char_is_true
	
	.ends
	

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_islower

	;; In : R0=char
	;; Out: F.C=1 lowercase char (a-z)
islower::
	cmp	r0,'a'
	ULT jmp	_char_is_false
	cmp	r0,'z'
	UGT jmp	_char_is_false
	jmp	_char_is_true
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_isupper

	;; In : R0=char
	;; Out: F.C=1 uppercase char (a-z)
isupper::
	cmp	r0,'A'
	ULT jmp	_char_is_false
	cmp	r0,'Z'
	UGT jmp	_char_is_false
	jmp	_char_is_true
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	.seg	_lib_segment_isalpha

	;; In : R0=char
	;; Out: F.C=1 islower || isupper
isalpha::
	push	lr
	call	islower
	C pop	pc
	call	isupper
	pop	pc
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	.seg	_lib_segment_isalnum

	;; In : R0=char
	;; Out: F.C=1 isalpha || isdigit
isalnum::
	push	lr
	call	isalpha
	C pop	pc
	call	isdigit
	pop	pc
	
	.ends


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_isblank

	;; In : R0=char
	;; Out: F.C=1 space || tab
isblank::
	cmp	r0,32
	jz	_char_is_true
	cmp	r0,7
	jz	_char_is_true
	jmp	_char_is_false

	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_isprint

	;; In : R0=char
	;; Out: F.C=1 printable incl. space
isprint::
	cmp	r0,32
	ULT jmp	_char_is_false
	cmp	r0,126
	UGT jmp	_char_is_false
	jmp	_char_is_true
	
	.ends

	
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_ispunct

	;; In : R0=char
	;; Out: F.C=1 33-47, 58-64, 91-96, 123-126
	;;            !  /   :  @   [  `   {   }
ispunct::
	cmp	r0,32
	ULE jmp	_char_is_false
	cmp	r0,127
	UGE jmp	_char_is_false
	push	lr
	call	isalnum
	C jmp	isp_false
	sec
	pop	pc
isp_false:
	clc
	pop	pc

	.ends

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

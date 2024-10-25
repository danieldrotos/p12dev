	.proc	p2

	;; 
	;; F.C=  isdigit (R0:char)
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
	

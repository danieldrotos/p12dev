	.proc	p2

	;; 
	;; F.C=  isdigit (R0:char)
	;;
	

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_isdigit
	
	;; In : R0 character
	;; Out: F.C=1 number (0-9)
isdigit:
	.global	isdigit
	cmp	R0,'0'
	ULT jmp	isd_false
	cmp	R0,'9'
	UGT jmp	isd_false
isd_true:
	sec
	ret
isd_false:
	clc
	ret
	
	.ends
	

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.seg	_lib_segment_islower

	;; In : R0=char
	;; Out: F.C=1 lowercase char (a-z)
islower::
	cmp	r0,'a'
	ULT jmp	isl_false
	cmp	r0,'z'
	UGT jmp	isl_false
isl_true:
	sec
	ret
isl_false:
	clc
	ret
	
	.ends
	

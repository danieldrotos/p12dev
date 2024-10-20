	.proc	p2

	;; 
	;; F.C=  isdigit (R0:char)
	;;
	
	.seg	isdigit
	
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
	

	.proc	p2

	;;
	;;          putchar     (R0:char)
	;;          prints      (R0:str)
	;;          printsnl    (R0:str)
	;;          printh      (R0:val,R1:sep_len)
	;;          printd      (R0:val)
	;;          eprints     ()
	;;          printf      (R0:format,R1:param,...)
	;;          eprintf     (R1:param,...)
	;;
	;; F.C=     input_avail ()
	;; F.C,R0=  getchar     ()
	;; R0=      read        ()
	;;          le_init     (R0:buffer, R1:size)
	;;          le_start    ()
	;; F.C=     le_read     ()
	;;

	
	.seg	putchar
putchar::
	jmp	_putchar
	.ends

	
	.seg	prints
prints::
	jmp	_prints
	.ends
	

	.seg	printsnl	
printsnl::
	jmp	_printsnl
	.ends


	.seg	printh
printh::
	jmp	_print_vhex
	.ends


	.seg	printd
printd::
	jmp	_printd
	.ends


	.seg	eprints
eprints::
	jmp	_pes
	.ends
	

	.seg	printf
printf::
	jmp	_printf
	.ends


	.seg	eprintf
eprintf::
	jmp	_pesf
	.ends


	.seg	input_avail
input_avail::
	jmp	_check_uart
	.ends


	.seg	getchar
getchar::
	jmp	_getchar
	.ends


	.seg	read
read::
	jmp	_read
	.ends

	
	
	.seg	line_editor
	;; IN: R0 buffer address, R1 buffer length
	;; OUT: -
le_init::
le_setbuf::
	push	lr
	st	r0,le_buf_addr	; store buffer info
	st	r1,le_buf_len	; in local vars
	call	le_start	; set buffer empty
	pop	pc
;	ret

	;; IN: -
	;; OUT: -
le_start::
	push	lr
	push	r1
	push	r2
	mvzl	r2,0		; set cursor post to 0
	st	r2,le_cursor_pos
	ld	r1,le_buf_addr	; buf[0]= 0
	st	r2,r1
	mvzl	r1,le_ptr	; ptr= 0
	st	r2,r1
	pop	r2
	pop	r1
	pop	pc
;	ret

	;; IN: -
	;; OUT: F.C: 1=done (Enter pressed)
le_read::
tu_fgets::
	push	lr
	push	r0
	push	r1
	push	r2
	push	r3
	
	call	_check_uart	; if there is no char
	NC jmp	ler_ret		; return with false
ler_got_char:	
	call	_read		; read one char
	cmp	r0,13		; check CR and LF
	jz	ler_true	; both accepted as ENTER
	cmp	r0,10
	jz	ler_true
	;; not ENTER
	cmp	r0,8		; is it backspace?
	jz	ler_bs
	cmp	r0,0x7f
	jz	ler_del
	jmp	ler_nobs
	
ler_bs:
ler_del:	
	;; process Backspace/DEL
	ld	r2,le_ptr	; already emtpy?
	sz	r2
	jz	ler_false
	dec	r2		; ptr= pre-1
	st	r2,le_ptr
	ld	r1,le_buf_addr	; buf[ptr]=0
	mvzl	r0,0
	st	r0,r1,r2
	call	_pes
	db	"\e[1D \e[1D"
	jmp	ler_false
	
ler_nobs:	
	cmp	r0,32		; skip ctrl chars
	ULT jmp	ler_false
	cmp	r0,128		; skip graphic chars
	UGE jmp	ler_false
	;; process accpeted char
	ld	r1,le_buf_len
	ld	r2,le_ptr
	mov	r3,r2
	inc	r3
	cmp	r3,r1
	UGE jmp	ler_noroom
	ld	r1,le_buf_addr
	st	r0,r1,r2
	call	_putchar
	mvzl	r0,0
	st	r0,r1,r3
	st	r3,le_ptr
	jmp	ler_false
	
ler_noroom:
	jmp	ler_false
ler_false:
	clc
	jmp	ler_ret
ler_true:
	sec
	jmp	ler_ret
ler_ret:
	pop	r3
	pop	r2
	pop	r1
	pop	r0
	pop	pc
;	ret

le_buf_len:
	db	0
le_buf_addr:
	db	0
le_cursor_pos:
	db	0
le_ptr:
	db	0
	.ends
	

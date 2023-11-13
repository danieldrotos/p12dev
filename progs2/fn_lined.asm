	.proc	p2

uart_check	=	0xf008
uart_read	=	0xf00d
	
	.seg	line_editor
	;; IN: R0 buffer address, R1 buffer length
	;; OUT: -
le_init:
le_setbuf:	
	.global	le_init
	.global	le_setbuf
	push	lr
	st	r0,le_buf_addr	; store buffer info
	st	r1,le_buf_len	; in local vars
	call	le_start	; set buffer empty
	pop	lr
	ret

	;; IN: -
	;; OUT: -
le_start:
	.global	le_start
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
	pop	lr
	ret

	;; IN: -
	;; OUT: F.C: 1=done (Enter pressed)
le_read:
tu_fgets:	
	.global	le_read
	.global	tu_fgets
	push	lr
	push	r0
	push	r1
	push	r2
	push	r3
	
	call	uart_check	; if there is no char
	NC jmp	ler_ret		; return with false
	call	uart_read	; read one char
	cmp	r0,13		; check CR and LF
	jz	ler_true	; both accepted as ENTER
	cmp	r0,10
	jz	ler_true
	;; not ENTER
	cmp	r0,8		; is it backspace?
	jnz	ler_nobs
	;; process Backspace
	jmp	ler_false
	
ler_nobs:	
	cmp	r0,32		; skip ctrl chars
	ULT jmp	ler_false
	cmp	r0,128		; skip graphic chars
	UGE jmp	ler_false
	;; process accpeted char
	ld	r1,le_buf_addr
	ld	r2,le_ptr
	
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
	pop	lr
	ret

le_buf_len:
	db	0
le_buf_addr:
	db	0
le_cursor_pos:
	db	0
le_ptr:
	db	0
	.ends
	

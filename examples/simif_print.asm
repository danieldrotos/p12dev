	simif	equ	0xffff
	ldl0	sp,stack

	ldl0	r1,Hello
	call	print
vege:	jmp	vege
	
start:	
	ldl0	r0,65		; 'A'
cikl:	
	call	putchar
	inc	r0
	ldl0	r10,91		; 'Z'+1
	cmp	r10,r0,r10
	jnz	cikl
	jmp	start
	
	;; print char in R0
putchar:
	push	r14
	inc	sp
	ldl0	r12,112		; 'p'
	ldl0	r10,simif
	st	r12,r10
	st	r0,r10
	dec	sp
	pop	r14
	ret

	;; print 0 terminated string at R1
print:
	push	r14
	inc	sp
print_cikl:	
	ld	r0,r1
	or	r0,r0,r0
	jz	print_exit
	call	putchar
	inc	r1
	jmp	print_cikl
print_exit:
	dec	sp
	pop	r14
	ret

Hello:
	db	72
	db	101
	db	108
	db	108
	db	111
	db	32
	db	87
	db	111
	db	114
	db	108
	db	100
	db	33
	db	10
	db	0
	
stack:
	

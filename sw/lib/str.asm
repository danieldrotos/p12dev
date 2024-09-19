	cpu	p2

	
	.seg	fn_strlen

	;; INPUT  R0= string address
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
	getb	r0,r3,r2
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

	
	.seg	fn_strsize

	;; INPUT  R0= address of string
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
	getb	r0,r3,r2
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

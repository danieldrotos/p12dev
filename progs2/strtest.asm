	.cpu	p2

SIMIF.CMD_PAR	=	0xffff
monitor		=	0xf000
putchar		=	0xf00e
pesf		=	0xf015
	
	.org	1

TST	=	0x12345678

	mvl	r0,TST
	mvh	r0,TST
	mvzl	r1,0xa5
	putb	r0,r1,0
	mvl	r0,TST
	mvh	r0,TST
	mvzl	r1,0xa5
	putb	r0,r1,1
	mvl	r0,TST
	mvh	r0,TST
	mvzl	r1,0xa5
	putb	r0,r1,2
	mvl	r0,TST
	mvh	r0,TST
	mvzl	r1,0xa5
	putb	r0,r1,3
	
	mvzl	r0,s2
	call	print
	mvzl	r0,s1
	call	print
	
	mvzl	r0,s1
	call	strlen
	call	pesf
	.db	"Len of unpacked: %d\n"
	mvzl	r0,s1
	call	strsize
	call	pesf
	.db	"Size of unpacked: %d\n"
	
	mvzl	r0,s2
	call	strlen
	call	pesf
	.db	"Len of packed: %d\n"
	mvzl	r0,s2
	call	strsize
	call	pesf
	.db	"Size of packed: %d\n"

	call	monitor

s1:	.db	"Hello World!\n"
s2:	.dd	0x6c6c6548
	.dd	0x6f57206f
	.dd	0x21646c72
	.dd	0x0000000a
	.dd	0

	.seg	print_old
print_old::
	push	lr
	mov	r1,r0
	mvzl	r2,0
print_cyc:
	ld	r0,r1+,r2
	sz	r0
	jz	print_end
	call	putchar
	jmp	print_cyc
print_end:	
	pop	pc
	.ends

	.seg	print
print::
	push	lr
	push	r0
	push	r1
	push	r2
	push	r3
	mov	r1,r0
	mvzl	r2,0
p2_next:
	ld	r3,r1
	sz	r3
	jz	p2_end
p2_cyc:	
	getb	r0,r3,r2
	sz	r0
	NZ call	putchar
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
	pop	pc
	.ends
	
	.seg	strlen
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
	
	.seg	strsize
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
	
out:
	push	r0
	mvzl	r0,'p'
	st	r0,SIMIF.CMD_PAR
	pop	r0
	st	r0,SIMIF.CMD_PAR
	ret

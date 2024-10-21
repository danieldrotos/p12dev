	.cpu	p2

	.org	1

	mvzl	sp,stack
	
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
	ces	eprintf
	.db	"Len of unpacked: %d\n"
	mvzl	r0,s1
	call	strsize
	ces	eprintf
	.db	"Size of unpacked: %d\n"
	
	mvzl	r0,s2
	call	strlen
	ces	eprintf
	.db	"Len of packed: %d\n"
	mvzl	r0,s2
	call	strsize
	ces	eprintf
	.db	"Size of packed: %d\n"

	mvzl	r0,s1
	call	prints
	mvzl	r0,s3
	call	prints

	ces	eprints
	db	"unpacked: String, printed by pes\n"
	ces	eprints
	dp	"packed: String, printed by pes\n"

	mvzl	r1,12
	ces	eprintf
	db	"decimal %d in unpacked\n"
	ces	eprintf
	dp	"decimal %u in packed\n"

	mvzl	r1,s1
	ces	eprintf
	db	"unpacked str in unpacked: %s"
	mvzl	r1,s1
	ces	eprintf
	dp	"unpacked str in packed: %s"
	mvzl	r1,s3
	ces	eprintf
	db	"packed str in unpacked: %s"
	mvzl	r1,s3
	ces	eprintf
	dp	"packed str in packed: %s"
	mvzl	r1,s0
	ces	eprintf
	.dp	"empty in packed: \"%s\" done\n"
	mvzl	r1,0
	ces	eprintf
	.dp	"NULL in packed: \"%s\" done\n"

sc1:	
	mvzl	r1,s1
	mvzl	r0,'Z'
	call	strchr
	ces	eprintf
	db	"Z in unpacked: 0x%x %d\n"

sc2:	
	mvzl	r1,s3
	mvzl	r0,'Z'
	call	strchr
	ces	eprintf
	db	"Z in packed: 0x%x %d\n"

sc3:	
	mvzl	r1,s1
	mvzl	r0,'c'
	call	strchr
	ces	eprintf
	db	"c in unpacked: 0x%x %d\n"
	sub	r1,s1
	ces	eprintf
	db	"word: %d byte: %d\n"

sc4:	
	mvzl	r1,s3
	mvzl	r0,'d'
	call	strchr
	ces	eprintf
	db	"d in packed: 0x%x %d\n"
	sub	r1,s3
	ces	eprintf
	db	"word: %d byte: %d\n"
	
	call	monitor

s0:	.db	0
s1:	.db	"unpacked: Hello World!\n"
s2:	.dd	0x6c6c6548
	.dd	0x6f57206f
	.dd	0x21646c72
	.dd	0x0000000a
	.dd	0
s3:	.dp	"packed: Hello World!\n"
	
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

	ds	100
stack:
	db	0
	

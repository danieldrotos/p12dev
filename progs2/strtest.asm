	.cpu	p2

SIMIF.CMD_PAR	=	0xffff
monitor		=	0xf000
putchar		=	0xf00e
	
	.org	1
	mvzl	r0,s2
	call	p2
	mvzl	r0,s1
	call	p2
	call	monitor

s1:	db	"unpacked: Hello World!\n"
s2:	dd	0x6c6c6548
	dd	0x6f57206f
	dd	0x21646c72
	dd	0x0000000a
	dd	0
	
print:
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

p2:
	push	lr
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
	pop	pc
	
out:
	push	r0
	mvzl	r0,'p'
	st	r0,SIMIF.CMD_PAR
	pop	r0
	st	r0,SIMIF.CMD_PAR
	ret
	

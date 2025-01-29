	.proc	p2

	org	1
	UN mvzl	r1,0xabcd
	mvzl	r13,stack
	mvzl	r0,3
	st	r0,0xff41
	
	ces	eprintf
hello:	.db	"HelloWorld!"
	mvzl	r0,13
	call	putchar

	mvzl	r1,1234
	ces	eprintf
	.db	"%+d\n"
	
	mvzl	r1,0xf000
	mov	r2,r1
	mov	r3,r1
u_test:	ces	eprintf
	.db	"signed=%d unsigned=%u hex=%x\n"
	mvs	r1,0xf000
	mov	r2,r1
	mov	r3,r1
d_test1:
	ces	eprintf
	.db	"signed=%d unsigned=%u hex=%x\n"

ft:
	call	eprints
	.db	"test s with hello\n"
	mvzl	r0,ft_tab_s
	mvzl	r1,hello
	call	format_tester

	call	eprints
	.db	"test u with -100\n"
	mvzl	r0,ft_tab_u
	mvs	r1,-100
	call	format_tester

	call	eprints
	.db	"test d with 10000\n"
	mvzl	r1,10000
	mvzl	r0,ft_tab_d
	call	format_tester
	.db	"test d with -1000\n"
	mvs	r1,-1000
	mvzl	r0,ft_tab_d
	call	format_tester

	call	eprints
	.db	"test x with 1000\n"
	mvzl	r1,1000
	mvzl	r0,ft_tab_x
	call	format_tester

	call	eprints
	.db	"test b with 0x12345678\n"
	mvl	r1,0x12345678
	mvh	r1,0x12345678
	mvzl	r0,ft_tab_b
	call	format_tester

opt_test_start:	
	mvzl	r1,'A'
opt_test:
	ces	eprintf
	.db	"%-+010c\n"
	
	ces	eprintf
	.db	"B"

stop:	jmp	stop
	
	mvzl	r0,1
	st	r0,CLOCK.PRE
	
	mvl	r0,0xffffffff
	mvh	r0,0xffffffff
	call	0xf013
	mvzl	r0,10
	call	0xf00e

	mvzl	r0,s
	mvzl	r1,12345
	mvl	r2,0xdeadbeef
	mvh	r2,0xdeadbeef
	mvzl	r3,s2
	mvzl	r4,'A'
	call	printf

	mvzl	r1,65535
	ces	0xf015
	db	"d=%x\n"
	mvzl	r0,'B'
	call	0xf00e
	
	jmp	0xf000
	
s:	db	"dec=%d\nhex=%x\nstr=%s\nchar=%c\n"
s2:	db	"this is a string"
	
	org	0x1000

	mov	r0,r4
	st	aa,r14
aa:
	jmp	aa
	
	db	"ABCDEFGH"

	
	leds	equ	0xff01
	sw	equ	0xff10 ;0xd000
	
	ldl0	r0,sw
	ldl0	r1,leds
	ldl0	r3,1
	ldl	r4,0x00010000
	ldh	r4,0x00010000
	ldl0	r10,1
	st	r10,r1
cikl:
	ld	r12,r0
	and	r12,r3
	jnz	masik
	
egyik:
	ld	r10,r1
	shl	r10
	cmp	r10,r4
	z1 ldl0	r10,1
	st	r10,r1
	jmp	cikl

masik:
	ld	r9,r1
	shr	r9
	z ldl0	r9,0x8000
	st	r9,r1
	jmp	cikl

ft_tab_s:
	.db	"s ... 5 \"%5s\"\n"
	.db	"s ...20 \"%20s\"\n"
	.db	"s -..20 \"%-20s\"\n"
	.db	"s .0.20 \"%020s\"\n"
	.db	"s -0.20 \"%-020s\"\n"
	.dd	0
ft_tab_u:
	.db	"u %u\n"
	.db	"u %15u\n"
	.db	"u ... 5 \"%5u\"\n"
	.db	"u ...15 \"%15u\"\n"
	.db	"u -..15 \"%-15u\"\n"
	.db	"u .0.15 \"%015u\"\n"
	.db	"u -0.15 \"%-015u\"\n"
	.db	"u ..+15 \"%+15u\"\n"
	.db	"u -.+15 \"%-+15u\"\n"
	.db	"u .0+15 \"%0+15u\"\n"
	.db	"u -0+15 \"%-0+15u\"\n"
	.dd	0
ft_tab_d:
	.db	"d %d\n"
	.db	"d %15d\n"
	.db	"d ... 5 \"%5d\"\n"
	.db	"d ...15 \"%15d\"\n"
	.db	"d -..15 \"%-15d\"\n"
	.db	"d .0.15 \"%015d\"\n"
	.db	"d -0.15 \"%-015d\"\n"
	.db	"d ..+15 \"%+15d\"\n"
	.db	"d -.+15 \"%-+15d\"\n"
	.db	"d .0+15 \"%0+15d\"\n"
	.db	"d -0+15 \"%-0+15d\"\n"
	.dd	0
ft_tab_x:
	.db	"x %x\n"
	.db	"x ... 5 \"%5x\"\n"
	.db	"x ...15 \"%15x\"\n"
	.db	"x -..15 \"%-15x\"\n"
	.db	"x .0.15 \"%015x\"\n"
	.db	"x -0.15 \"%-015x\"\n"
	.db	"x ..+15 \"%+15x\"\n"
	.db	"x -.+15 \"%-+15x\"\n"
	.db	"x .0+15 \"%0+15x\"\n"
	.db	"x -0+15 \"%-0+15x\"\n"
	.db	"x ... 2 \"%2x\"\n"
	.db	"x ... 2 \"%2x\"\n"
	.db	"x -.. 2 \"%-2x\"\n"
	.db	"x .0. 2 \"%02x\"\n"
	.db	"x -0. 2 \"%-02x\"\n"
	.db	"x ..+ 2 \"%+2x\"\n"
	.db	"x -.+ 2 \"%-+2x\"\n"
	.db	"x .0+ 2 \"%0+2x\"\n"
	.db	"x -0+ 2 \"%-0+2x\"\n"
	.db	"x .0. 4 \"%04x\"\n"
	.dd	0
ft_tab_b:
	.db	"b %b\n"
	.db	"b ... 5 \"%5b\"\n"
	.db	"b ...34 \"%34b\"\n"
	.db	"b -..34 \"%-34b\"\n"
	.db	"b .0.34 \"%034b\"\n"
	.db	"b -0.34 \"%-034b\"\n"
	.db	"b ..+34 \"%+34b\"\n"
	.db	"b -.+34 \"%-+34b\"\n"
	.db	"b .0+34 \"%0+34b\"\n"
	.db	"b -0+34 \"%-0+34b\"\n"
	.db	"b ... 9 \"%9b\"\n"
	.db	"b ... 9 \"%9b\"\n"
	.db	"b -.. 9 \"%-9b\"\n"
	.db	"b .0. 9 \"%09b\"\n"
	.db	"b -0. 9 \"%-09b\"\n"
	.db	"b ..+ 9 \"%+9b\"\n"
	.db	"b -.+ 9 \"%-+9b\"\n"
	.db	"b .0+ 9 \"%0+9b\"\n"
	.db	"b -0+ 9 \"%-0+9b\"\n"
	.db	"b .0. 4 \"%04b\"\n"
	.dd	0
	
format_tester:
	push	lr
ft_cyc:
	call	printf
ft_n:	ld	r10,r0
	sz	r10
	jz	ft_1
	inc	r0
	jmp	ft_n
ft_1:
	inc	r0
	ld	r10,r0
	sz	r10
	jz	ft_ret
	jmp	ft_cyc
ft_ret:	
	pop	pc

	.ds	100
stack:	.ds	1

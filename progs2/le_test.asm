	.proc	p2

callin	=	0xf000
prints	=	0xf00f
printf	=	0xf014
;putchar	=	0xf00e
strieq	=	0xf00c
	
	org	1

	mvzl	r0,buf
	mvzl	r1,100
	call	le_init
cyc:
	call	le_read
	jc	gotit
	jmp	cyc
	
gotit:
	mvzl	r0,10		; echo ENTER
	call	putchar
	mvzl	r0,buf		; echo buffer
	call	prints
	mvzl	r0,10		; print LF
	call	putchar		

	mvzl	r0,buf
	mvzl	r1,quit
	call	strieq
	C call	callin
	
	call	le_start
	jmp	cyc
	
buf:	ds	100
quit:	db	"quit"
	

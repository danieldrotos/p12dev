	.proc	p2

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
	call	_prints
	mvzl	r0,10		; print LF
	call	putchar		

	mvzl	r0,buf
	mvzl	r1,quit
	call	_strieq
	C call	monitor
	
	call	le_start
	jmp	cyc
	
buf:	ds	100
quit:	db	"quit"
	

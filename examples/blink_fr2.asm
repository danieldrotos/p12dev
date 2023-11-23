	.proc	p2

	.org	1
	mvzl	sp,stack
	mvzl	r0,24999
	st	r0,CLOCK.PRE
	
	ds	100
stack:	

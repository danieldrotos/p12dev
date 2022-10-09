port	=	0xffff
abc	equ	21
	
	mov	r1,r2
	sed	r3,r4
	mvl	r5,0xbeef
	mvh	r5,0xdead
	mvzl	r6,port
	mvs	r7,abc
	mvs	r8,port


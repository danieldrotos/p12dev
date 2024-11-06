		.proc	p2
		
sw		=	0xff10
enterbyuart	=	0xf001
pesf		=	0xf015

		.org	1
		mvzl	sp,verem_vege
		;mvzl	r0,8123
		;call	printbin
		ld	r3,sw
		call	pesf
		db	"\e[2J \e[1;1H"
		mov	r0,r3
		call	printbin
cyc:
		ld	r4,sw
		cmp	r3,r4
		eq jmp	vegere
		; elteres lett
		mov	r3,r4
		call	pesf
		db	"\e[1;1H"
		mov	r0,r4
		call	printbin
vegere:
		call	enterbyuart
		jmp	cyc
		
printbin:
		push	lr
		push	r0
		push	r1
		push	r2
		mov	r1,r0
		; m= 10000....
		mvl	r2,0x80000000
		mvh	r2,0x80000000
ciklus:
		test	r1,r2
		Z mvzl	r0,'0'
		NZ mvzl	r0,'1'
		call	putchar
		; m>>= 1
		shr	r2
		; while (m)
		jnz	ciklus
		pop	r2
		pop	r1
		pop	r0
		pop	lr
		ret
		
verem:
		ds		100
verem_vege:
		db	0

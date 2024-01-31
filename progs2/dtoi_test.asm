	.proc	p2

	pesf	=	0xf015
	
	org	1

	mvzl	r0,str
	call	dtoi
	mov	r2,r1
	call	pesf
	db	"val=%d %x\n"
end:
	jmp	end

str:	db	"4294967295"
	

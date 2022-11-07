	.proc	P2

	DR	equ	0xff40
	STAT	equ	0xff41
	CTRL	equ	0xff42

	mvl	SP,0xffff
	mvh	SP,1
	
	mvzl	r1,0x3		; enable rx, tx
	mvzl	r2,CTRL
	st	r1,r2
	
	mvzl	r1,0x55		; send 0x55
	mvzl	r2,DR
	st	r1,r2
;	call	wait_cyc	;

	mvzl	r0,'A'
main_cyc:
	call	send
	add	r0,1
	mvzl	r2,'Z'
	add	r2,1
	cmp	r0,r2
	jnz	main_cyc
	
end:	jmp	end

	
wait_tx:
	push	LR
	mvzl	r2,STAT
wait_cyc:
	ld	r3,r2
	btst	r3,2
	jz	wait_cyc
	pop	LR
	ret

send:
	push	LR
	call	wait_tx
	mvzl	r2,DR
	st	r0,r2
	pop	LR
	ret
	

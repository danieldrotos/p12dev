	.proc	P2

	DR	equ	0xff40
	STAT	equ	0xff41
	CTRL	equ	0xff42

	mvl	SP,0x1ffff
	mvh	SP,0x1ffff
	
	mvzl	r1,0x3		; enable rx, tx
	mvzl	r2,CTRL
	st	r1,r2
	
	mvzl	r1,'>'		; send prompt
	mvzl	r2,DR
	st	r1,r2
;	call	wait_cyc	;
start:	

main_cyc:
	call	check_input
	jz	main_cyc
	mvzl	r2,DR
	ld	r0,r2
got_char:
	mvzl	r2,0x20
	xor	r2,0xffff
	sew	r2
	and	r0,r2		; covert to UPCASE
	call	send
	jmp	main_cyc
	
end:	jmp	start

	
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
	
check_input:
	push	lr
	mvzl	r2,STAT
	ld	r2,r2
	test	r2,1		; Z=0 Received avail
	pop	LR
	ret
	

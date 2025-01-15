	.proc	p2

	org	0

	mvzl	sp,stack
	mvzl	r1,217
	st	r1,UART.CPB
	mvzl	r1,3
	st	r1,UART.CTRL
	
	ces	eprints
	.db	"<table border=1>\n\n<tr>\n\n"
	
	mvzl	r12,0		; ascii code

cyc:	mov	r0,r12
	call	dsp_ascii2seg
	ces	eprints
	.db	"<td><b><span class =\"b\"> "

	ces	eprints
	.db	"\n"

	mov	r1,r12
	ces	eprintf
	.db	"</span></b><br>%d,0x"
	mov	r0,r12
	shr	r0
	shr	r0
	shr	r0
	shr	r0
	call	_pm_value2hexchar
	mov	r1,r0
	ces	eprintf
	.db	"%c"
	mov	r0,r12
	call	_pm_value2hexchar
	mov	r1,r0
	ces	eprintf
	.db	"%c"
	cmp	r12,0x1f
	ULE jmp	printed
	cmp	r12,0x20
	jnz	non_space
	ces	eprints
	.db	",' '"
	jmp	printed
non_space:
	cmp	r12,'>'
	jnz	non_gt
	ces	eprints
	.db	",'&gt;'"
	jmp	printed
non_gt:
	cmp	r12,'<'
	jnz	non_lt
	ces	eprints
	.db	",'&lt;'"
	jmp	printed
non_lt:	
	cmp	r12,'&'
	jnz	non_amp
	ces	eprints
	.db	",'&amp;'"
	jmp	printed
non_amp:
	cmp	r12,127
	jz	printed
	
	mov	r1,r12
	ces	eprintf
	.db	",'%c'"
printed:	
	ces	eprints
	.db	"</td>\n\n"

	inc	r12
	cmp	r12,128
	jz	done
	test	r12,7
	jnz	cyc

	ces	eprints
	.db	"\n</tr><tr>\n\n"
	jmp	cyc
	
done:	
	ces	eprints
	.db	"</tr>\n\n</table>\n"

exit:	
	mvzl	r0,'s'
	st	r0,SIMIF.CMD_PAR
	call	monitor
	
	ds	100
stack:	ds	1

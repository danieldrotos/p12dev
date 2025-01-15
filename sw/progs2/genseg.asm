	.proc	p2

	org	0

	mvzl	sp,stack
	mvzl	r1,217
	st	r1,UART.CPB
	mvzl	r1,3
	st	r1,UART.CTRL
	
	ces	eprints
	.db	"<!DOCTYPE html>\n"
	ces	eprints
	.db	"<html id=\"html-tag\" lang=\"en\">\n"
	ces	eprints
	.db	"  <head>\n"
	ces	eprints
	.db	"  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\n"
	ces	eprints
	.db	"  <meta charset=\"utf-8\">\n"
	ces	eprints
	.db	"  <link rel=\"stylesheet\" href=\"p12.css\">\n"
	ces	eprints
	.db	"  <title>Seven segment display characters</title>\n"
	ces	eprints
	.db	"  </head>\n"
	ces	eprints
	.db	"<body>\n\n"
	
	ces	eprints
	.db	"<table border=1>\n\n<tr>\n\n"
	
	mvzl	r12,0		; ascii code

cyc:	mov	r0,r12
	call	dsp_ascii2seg
	ces	eprints
	.db	"<td><b><span class =\"b\"> "
	test	r4,1
	Z mvzl	r1,32
	NZ mvzl	r1,'_'
	ces	eprintf
	.db	"%c\n"

	test	r4,0x20
	Z mvzl	r1,32
	NZ mvzl	r1,'|'
	test	r4,0x40
	Z mvzl	r2,32
	NZ mvzl	r2,'_'
	test	r4,0x02
	Z mvzl	r3,32
	NZ mvzl	r3,'|'
	ces	eprintf
	.db	"%c%c%c\n"

	test	r4,0x10
	Z mvzl	r1,32
	NZ mvzl	r1,'|'
	test	r4,0x08
	Z mvzl	r2,32
	NZ mvzl	r2,'_'
	test	r4,0x04
	Z mvzl	r3,32
	NZ mvzl	r3,'|'
	ces	eprintf
	.db	"%c%c%c\n"
	
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
	.db	",&gt;"
	jmp	printed
non_gt:
	cmp	r12,'<'
	jnz	non_lt
	ces	eprints
	.db	",&lt;"
	jmp	printed
non_lt:	
	cmp	r12,'&'
	jnz	non_amp
	ces	eprints
	.db	",&amp;"
	jmp	printed
non_amp:
	cmp	r12,127
	jz	printed
	
	mov	r1,r12
	ces	eprintf
	.db	",%c"
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
	.db	"</tr>\n\n</table>\n\n</body>\n</html>\n"

exit:	
	mvzl	r0,'s'
	st	r0,SIMIF.CMD_PAR
	call	monitor
	
	ds	100
stack:	ds	1

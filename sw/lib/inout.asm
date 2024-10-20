	.proc	p2

	;;
	;;          putchar     (R0:char)
	;;          prints      (R0:str)
	;;
	;;

	
	.seg	putchar
putchar::
	jmp	_putchar
	.ends

	
	.seg	prints
prints::
	jmp	_prints
	.ends
	

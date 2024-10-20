	.proc	p2

	;;
	;;          putchar     (R0:char)
	;;          prints      (R0:str)
	;;          printsnl    (R0:str)
	;;          printh      (R0:val,R1:sep_len)
	;;          printd      (R0:val)
	;;          eprints     ()
	;;          printf      (R0:format,R1:param,...)
	;;          eprintf     (R1:param,...)
	;;
	;; F.C=     input_avail ()
	;; F.C,R0=  getchar     ()
	;; R0=      read        ()
	;;

	
	.seg	putchar
putchar::
	jmp	_putchar
	.ends

	
	.seg	prints
prints::
	jmp	_prints
	.ends
	

	.seg	printsnl	
printsnl::
	jmp	_printsnl
	.ends


	.seg	printh
printh::
	jmp	_print_vhex
	.ends


	.seg	printd
printd::
	jmp	_printd
	.ends


	.seg	eprints
eprints::
	jmp	_pes
	.ends
	

	.seg	printf
printf::
	jmp	_printf
	.ends


	.seg	eprintf
eprintf::
	jmp	_pesf
	.ends


	.seg	input_avail
input_avail::
	jmp	_check_uart
	.ends


	.seg	getchar
getchar::
	jmp	_getchar
	.ends


	.seg	read
read::
	jmp	_read
	.ends

	

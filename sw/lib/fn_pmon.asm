	.proc	p2

	;;
	;; monitor()
	;; F.C= input_avail()
	;; F.C,R0= getchar()
	;; R0= read()
	;; putchar(R0:char)
	;; prints(R0:str)
	;; printsln(R0:str)
	;; printh(R0:val,R1:sep_len)
	;; printd(R0:val)
	;; eprints()
	;; printf(R0:format,R1:param,...)
	;; eprintf(R1:param,...)
	;; 
	
	.seg	functions_pmon

_callin		==	0xf000
_enter_by_uart	==	0xf001
_getchar	==	0xf002	
_cold_start	==	0xf005
_strchr		==	0xf006
_streq		==	0xf007
_check_uart	==	0xf008
_input_avail	==	0xf008	
_hexchar2value	==	0xf009
_value2hexchar	==	0xf00a
_htoi		==	0xf00b
_strieq		==	0xf00c
_read		==	0xf00d
_putchar	==	0xf00e
_prints		==	0xf00f
_printsnl	==	0xf010
_print_vhex	==	0xf011
_pes		==	0xf012
_printd		==	0xf013
_printf		==	0xf014
_pesf		==	0xf015


monitor::
	jmp	_callin

input_avail::
	jmp	_check_uart
	
getchar::
	jmp	_getchar

read::
	jmp	_read
	
putchar::
	jmp	_putchar

prints::
	jmp	_prints

printsnl::
	jmp	_printsnl

printh::
	jmp	_print_vhex
	
printd::
	jmp	_printd
	
eprints::
	jmp	_pes

printf::
	jmp	_printf

eprintf::
	jmp	_pesf

	.ends

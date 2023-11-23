	.proc	p2

	.seg	functions_pmon

_callin		=	0xf000
_enter_by_uart	=	0xf001
_isdigit	=	0xf003
_dtoi		=	0xf004
_cold_start	=	0xf005
_strchr		=	0xf006
_streq		=	0xf007
_check_uart	=	0xf008
_hexchar2value	=	0xf009
_value2hexchar	=	0xf00a
_htoi		=	0xf00b
_strieq		=	0xf00c
_read		=	0xf00d
_putchar	=	0xf00e
_prints		=	0xf00f
_printsnl	=	0xf010
_print_vhex	=	0xf011
_pes		=	0xf012
_printd		=	0xf013
_printf		=	0xf014
_pesf		=	0xf015

monitor		=	0xf000
putchar		=	0xf00e
printf		=	0xf014
pesf		=	0xf015
	
	.global	_callin		
	.global	_enter_by_uart	
	.global	_isdigit		
	.global	_dtoi		
	.global	_cold_start	
	.global	_strchr		
	.global	_streq		
	.global	_check_uart	
	.global	_hexchar2value	
	.global	_value2hexchar	
	.global	_htoi		
	.global	_strieq		
	.global	_read		
	.global	_putchar		
	.global	_prints		
	.global	_printsnl	
	.global	_print_vhex	
	.global	_pes		
	.global	_printd		
	.global	_printf		
	.global	_pesf		

	.global	monitor
	.global	putchar
	.global	printf
	.global	pesf
	
	.ends
	

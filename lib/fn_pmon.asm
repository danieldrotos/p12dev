	.proc	p2

	.seg	functions_pmon

callin		=	0xf000
enter_by_uart	=	0xf001
isdigit		=	0xf003
dtoi		=	0xf004
cold_start	=	0xf005
strchr		=	0xf006
streq		=	0xf007
check_uart	=	0xf008
hexchar2value	=	0xf009
value2hexchar	=	0xf00a
htoi		=	0xf00b
strieq		=	0xf00c
read		=	0xf00d
putchar		=	0xf00e
prints		=	0xf00f
printsnl	=	0xf010
print_vhex	=	0xf011
pes		=	0xf012
printd		=	0xf013
printf		=	0xf014
pesf		=	0xf015

		.global	callin		
		.global	enter_by_uart	
		.global	isdigit		
		.global	dtoi		
		.global	cold_start	
		.global	strchr		
		.global	streq		
		.global	check_uart	
		.global	hexchar2value	
		.global	value2hexchar	
		.global	htoi		
		.global	strieq		
		.global	read		
		.global	putchar		
		.global	prints		
		.global	printsnl	
		.global	print_vhex	
		.global	pes		
		.global	printd		
		.global	printf		
		.global	pesf		

	.ends
	

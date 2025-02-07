start "UART" "%ProgramFiles(x86)%\teraterm\ttermpro.exe" /W=UART /T=1 telnet://localhost:5555

set arg1=%1

ucsim_p1516 -t2 -z6666 -S uart=0,port=5555 -I if=rom[0xffff] -g -e "uart0_check_often=1" -u n4ddr sw/pmon/pmon %arg1%

start "UART terminal" "%ProgramFiles(x86)%\teraterm\ttermpro.exe" /T=1 telnet://localhost:5555
rem start "p2223 UART0" powershell -noexit -command "./tnto.bat"

ucsim_p1516 -t2 -g -S uart=0,port=5555 -I if=rom[0xffff] -e "uart0_check_often=1" pmon

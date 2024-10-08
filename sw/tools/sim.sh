if [ -d $HOME/prj/ucsim_main ]; then
    SIM=$HOME/prj/ucsim_main/src/sims/p1516.src/ucsim_p1516
else
    SIM=ucsim_p1516
fi

xfce4-terminal -T "UART" -e "./sw/tools/tnto 5555" &
xfce4-terminal -T "cmd1" -e "./sw/tools/tnto 6666" &
xfce4-terminal -T "cmd2" -e "./sw/tools/tnto 6666" &

I="-I if=rom[0xffff]"
$SIM -t2 -Z6666 -S uart=0,port=5555 $I -g -e "uart0_check_often=1" sw/pmon/pmon $1


xfce4-terminal -T "UART" -e "./tools/tnto 5555" -H &
xfce4-terminal -T "cmd1" -e "./tools/tnto 6666" -H &
xfce4-terminal -T "cmd2" -e "./tools/tnto 6666" -H &

if [ -d $HOME/prj/ucsim ]; then
    SIM=$HOME/prj/ucsim/main/p1516.src/ucsim_p1516
else
    SIM=ucsim_p1516
fi

I="-I if=rom[0xffff]"
$SIM -t2 -Z6666 -S uart=0,port=5555 $I -g -e "uart0_check_often=1" progs2/pmon $1



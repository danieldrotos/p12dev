
xfce4-terminal -e "./tnto 5555" -H &

I="-I if=rom[0xffff]"
#I=""
xfce4-terminal -e "./tnto 6666" -H &
xfce4-terminal -e "./tnto 6666" -H &

./ucsim_p1516 -t2 -Z6666 -S uart=0,port=5555 $I -g -e "uart0_check_often=1" progs2/pmon $1

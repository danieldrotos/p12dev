if [ -z "$1" ]; then
    PROG="pmon"
else
    PROG="$1"
fi

xfce4-terminal -e "./tnto 5555" -H &
I="-I if=rom[0xffff]"
#I=""
./ucsim_p1516 -t2 -S uart=0,port=5555 $I -e "uart0_check_often=1" "$PROG"

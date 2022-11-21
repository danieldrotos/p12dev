
xfce4-terminal -e "./tnto 5555" -H &
./ucsim_p1516 -t2 -S uart=0,port=5555 "$1"

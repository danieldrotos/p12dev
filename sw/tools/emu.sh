#!/usr/bin/env bash

if [ -d $HOME/prj/ucsim ]; then
    SIM=$HOME/prj/ucsim/src/sims/p1516.src/ucsim_p1516
else
    SIM=ucsim_p1516
fi

function tt()
{
    sleep 1
    if command -v xfce4-terminal >/dev/null 2>&1; then
	xfce4-terminal -T "$1" -x telnet localhost "$2" 2>/dev/null &
    elif command -v mate-terminal >/dev/null 2>&1; then
	mate-terminal -t "$1" -x telnet localhost "$2" 2>/dev/null &
    elif command -v xterm >/dev/null 2>&1; then
	xterm -T "$1" -e telnet localhost "$2" &
    fi
}

i=0
P=$(pwd)
while [ ! -f ${P}/.version -a $i -lt 10 ]; do
    P=${P}/..
    i=$(($i+1))
done
echo P=$P
PMON=${P}/sw/pmon

GOPT="-g"
if [ "$1" = "-n" ]; then
    shift
    GOPT=""
fi

tt "UART" 5555 &

I="-I if=rom[0xffff]"
$SIM -t2 -z6666 -S uart=0,port=5555 $I $GOPT -e "uart0_check_often=1" -u n4ddr $1 ${PMON}/pmon

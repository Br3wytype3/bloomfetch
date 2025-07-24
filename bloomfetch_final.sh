#!/bin/sh

TITLE="$(whoami)@$(hostname) | $PWD"
SPR="-------------------------------------"
OS="$(cat /etc/*-release | grep PRETTY_NAME | cut -d = -f 2 | tr -d '"') "
KRN="$(uname -r)"
CPU="$(cat /proc/cpuinfo | awk -F': *' '/model name/ {print $2}')"
GPU="$(lspci -v -m | grep VGA -A 7 | grep Vendor | cut -f 2) $(lspci -v -m | grep VGA -A 7 | grep Device | cut -f 2 | cut -d [ -f 2 | cut -d ] -f 1)"
RAM="$(free -m | awk '/Mem:/ {print $3" MB / "$2" MB"}')"
SWAP="$(free -m | awk '/Swap:/ {print $3" MB / "$2" MB"}')"
LOC="$(locale | grep LANG= | cut -d = -f 2)"
HOST="$(cat /sys/devices/virtual/dmi/id/board_name)"
BREAK=" "
COLSET="$(tput setab 0)   $(tput setab 1)   $(tput setab 2)   $(tput setab 3)   $(tput setab 4)   $(tput setab 5)   $(tput setab 6)   $(tput setab 7)   \e[0m "
RS="\e[0m"


echo $TITLE
echo $SPR
echo "OS:$RS $OS"
echo "Host:$RS $HOST"
echo "Kernel:$RS $KRN"
echo "Terminal:$RS $(tty)"
echo "Shell:$RS $SHELL"
echo "CPU:$RS $CPU ($(uname -m))"
echo "GPU:$RS $GPU"
echo "RAM:$RS $RAM"
echo "Swap:$RS $SWAP"
echo "Locale:$RS $LOC"
echo $BREAK
echo "$COLSET"
echo $BREAK
echo $RS

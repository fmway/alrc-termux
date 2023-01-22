#!/system/bin/bash # Cannot execute
# ---BASH EXECUTECHECK--- #

# name:.alrc autoload for initial command at Terminal emulator, but this for Termux.
# version : v1.1 (11/01/2023) UTC+7
# license : GNU/GPLv3
# copyright (c) 2023 @adharudin14@gmail.com

# mode:rcfile like bashrc or shrc or something else
# sh-shell:bash (bourne again shell)

# .alrc script variant from al & whatisal functions but this specially for /sdcard apply on initial command
: ' based from al & whatisal functions '
: ' al & whatisal are minimal functions for /etc/fpath written by @adharudin14 '
# Do not call me when any sh there, source only!

NAME="${0:+$(printf '%s\n' "$(basename ${BASH_SOURCE})" )}"

# ---BASH SHELLCHECK--- #
[ -z "$PS1" ] && return
# --------------------- #

# ----- FUNCTION ------ #
function set_window() {

    title="$*"
    echo -ne "\033]0;$title \007"
}
function al() {

if [ $(basename $0) == "bash" ] || [ $(basename $0) == "bash.bin" ]; then

local my_terminal="$(ps | grep 'term' | awk '{print $9}')"
local uptimes="$(busybox uptime -s)" > /dev/null 2>&1; 
local batteries="$(termux-battery-status | head -n 3 | awk '{print $2}' | tail -n 1)" > /dev/null 2>&1;
# local packages="$(ls /system/bin/| wc -l) (bin) / $(ls /system/xbin/ | wc -l) (xbin)" > /dev/null 2>&1; 
local packages_termux="$(ls /data/data/com.termux/files/usr/bin | wc -l) (termux bin) " &>/dev/null;

ENV="${ENV:-"/system/etc/mkshrc" }"
test $ENV;
if [ $? -eq 0 ]; then

echo "
Hello $(basename $SHELL)
Welcome to: ${my_terminal:-"Termux "}
$(printf %"$COLUMNS"s |tr " " "-")
| os >> $(uname -so)
| arch >> $(uname -m)
| term >> ${TERM}
| date >> $(date)
| shell >> ${0}
| kernel >> $(uname -r)
| uptime >> ${uptimes:-"required busybox binary!"}
| battery >> ${batteries:-"something wen't wrong!"}
| packages >> ${packages_termux:-"ls not found!"}
| bash source >> ${NAME}
$(printf %"$COLUMNS"s |tr " " "-") ";

: place customisations above this line

echo "alrc: al is a $(type -t al), More informations? you can type \`whatisal'"
echo
else
echo "Your device isn't Android"
return 1
fi

else echo "Hello $(basename $0), please make sure your shell are bash"; return 1; fi
}
function whatisal() {

echo -e "${NAME} -whatisal v2.2-en (19/01/23 00:48:01 WIB) al and whatisal (functions) are minimal autoload for your termux alternate of neofetch to display system information just call it through source within your .bashrc.\n";

echo -e "Definitions: ";
echo -e "\"al is an exported alias for al\" (by default mkshrc MOD) or if any function named 'al' it must be called \"al is a function\". \n ";
echo -e "alias al come with mkshrc mod by @7175-xda-devoloper, but function named al come with this resource by @adharudin14 also this function. ";

echo -e "
usage#1: source **~/downloads/alrc-termux.sh** from within your **~.bash\_profile** or **~/.bashrc** file

usage#2: whatisal print this help message and return
\t al\t  review al and return
\t sh\t  change shell to sh and exit
\t su\t  change shell with login as root user and exit
\t exit\t  change shell and exit \n";
}
function _exit()              # Function to run upon exit of shell.
{
    echo -e "Goodbye $0"
    set_window "Window $RANDOM"
    $0
}
trap _exit EXIT

# -------------------------------- #
source $0 > /dev/null 2>&1 && until false; do sleep 1; done
set_window "successfully script called via source"; al;
#

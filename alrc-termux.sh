#!/system/bin/bash # Cannot execute
# ---BASH EXECUTECHECK--- #

# name:.alrc autoload for initial command at Terminal emulator, but this for Termux.
# version : alrc v3.0 (13/02/2023) UTC+7
# license : GNU/GPLv3
# copyright (c) 2023 @adharudin14@gmail.com

# mode:rcfile like bashrc or shrc or something else
# sh-shell:bash (bourne again shell)

# .alrc script variant from al & whatisal functions but this specially for /sdcard apply on initial command
: ' based from al & whatisal functions '
: ' al & whatisal are minimal functions for /etc/fpath written by @adharudin14 '
# Do not call me when any sh there, source only!

NAME="${0:+$(printf '%s\n' "$(basename ${BASH_SOURCE})" )}"
FULLNAME="${0:+$(printf '%s\n' "$BASH_SOURCE" )}"
VERSION="3.1.1"

# ---BASH SHELLCHECK--- #
[ -z "$PS1" ] && return
# --------------------- #

# ----- ALRC BASE FUNCTION ------ #

function alog () {
cat ~/.local/bin/Changelog.al.txt
}

function alcat () {
cat ~/.local/bin/$NAME
}

function set_window() {

    title="$*"
    echo -ne "\033]0;$title \007"
}
function al() {

if [ $(basename $0) == "bash" ] || [ $(basename $0) == "bash.bin" ]; then

local my_terminal="$(ps | grep 'term' | awk '{print $9}')"
local uptimes="$(busybox uptime -s)" > /dev/null 2>&1; 
local batteries="$(termux-battery-status | head -n 3 | awk '{print $2}' | tail -n 1| sed 's/,/%/g')"

# local packages="$(ls /system/bin/| wc -l) (bin) / $(ls /system/xbin/ | wc -l) (xbin)" > /dev/null 2>&1; 
local packages_termux="$(ls /data/data/com.termux/files/usr/bin | wc -l) (termux usr/bin) " &>/dev/null;
local shell="$(echo "$0" | awk '{gsub(/.*[/]|[.].*/, "", $0)} 1'
) ";
icon='|'
abc=$(echo "${icon} os >> $(uname -so)" | wc -L); cba=$(echo "$COLUMNS - $abc" | bc);
bcd=$(echo "${icon} arch >> $(uname -m)" | wc -L); dcb=$(echo "$COLUMNS - $bcd" | bc);
cde=$(echo "${icon} term >> ${TERM}" | wc -L); edc=$(echo "$COLUMNS - $cde" | bc);
def=$(echo "${icon} date >> $(date)" | wc -L); fed=$(echo "$COLUMNS - $def" | bc);
efg=$(echo "${icon} shell >> ${shell}" | wc -L); gfe=$(echo "$COLUMNS - $efg" | bc);
fgh=$(echo "${icon} kernel >> $(uname -r)" | wc -L); hgf=$(echo "$COLUMNS - $fgh" | bc);
ghi=$(echo "$icon uptime >> ${uptimes}" | wc -L); ihg=$(echo "$COLUMNS - $ghi" | bc);
hij=$(echo "${icon} battery >> ${batteries}" | wc -L); jih=$(echo "$COLUMNS - $hij" | bc);
ijk=$(echo "${icon} packages >> ${packages_termux}" | wc -L); kji=$(echo "$COLUMNS - $ijk" | bc);
jkl=$(echo "${icon} bash source >> ${NAME}" | wc -L); lkj=$(echo "$COLUMNS - $jkl" | bc);

ENV="${ENV:-"/system/etc/mkshrc" }"
test $ENV;
if [ $? -eq 0 ]; then

echo -e "
Hello $(basename $SHELL)
Welcome to: ${my_terminal:-"Termux "}
$(printf %"$COLUMNS"s |tr " " "-")
| os >> $(uname -so)$(printf %"$cba"s "$icon" )
| arch >> $(uname -m)$(printf %"$dcb"s "$icon" )
| term >> ${TERM}$(printf %"$edc"s "$icon" )
| date >> $(date)$(printf %"$fed"s "$icon" )
| shell >> ${shell}$(printf %"$gfe"s "$icon" )
| kernel >> $(uname -r)$(printf %"$hgf"s "$icon" )
| uptime >> ${uptimes}$(printf %"$ihg"s "$icon" )
| battery >> ${batteries}$(printf %"$jih"s "$icon" )
| packages >> ${packages_termux}$(printf %"$kji"s "$icon" )
| bash source >> ${NAME}$(printf %"$lkj"s "$icon" )
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

echo -e "${NAME} -whatisal v$VERSION-en (13/02/23 15:48:37 WIB) al and whatisal (functions) are minimal autoload for your termux alternate of neofetch to display system information just call it through source within your .bashrc.\n"
echo -e "Definitions: ";
echo -e "\"al is an exported alias for al\" (by default mkshrc MOD) or if any function named 'al' it must be called \"al is a function\". \n ";
echo -e "alias al come with mkshrc mod by @7175-xda-devoloper, but function named al come with this resource by @adharudin14 also this function. ";

echo -e "
usage#1: source **~/.local/bin/alrc-termux.sh** from within your **~.bash\_profile** or **~/.bashrc** file

usage#2: whatisal print this help message and return
\t al\t  review al and return
\t chsh -s bash\t  change shell to bash and exit \n";
}
#function _exit()              # Function to run upon exit of shell.
#{
  #  echo -e "Goodbye $0"
   # set_window "Window $RANDOM"
   # $0
#}
#trap _exit EXIT
# ----- ALRC END FUNCTION ------ #

# ----- ALRC MISC ------- #
# -------------------------------- #
source $0 > /dev/null 2>&1 && until false; do sleep 1; done
set_window "successfully script called via source"; al;
# --------------------------------- #

# ----- BASHRC ---------- #

### bashrc add  27 jan
 
##- Enviroment variable
unset HOME
HOME=${HOME:=/data/data/com.termux/files/home} # fix home
export HOME

##- Aliases

#  mksh aliases emulated
#alias autoload='builtin typeset -fu'
alias functions='builtin export -f'
alias integer='builtin typeset -i'
alias nameref='builtin typeset -n'
alias r='fc -e -'

#  personal aliases
alias alcatalias='alcat | grep -e "^alias"'
alias aligrep='alias | grep'
alias asciivideo="mpv --no-config  --vo=caca --really-quiet"
alias brandomusic-set_autoremove="sed 's/\#\ brandomusic-cache-clear\.sh/\ brandomusic-cache-clear\.sh/g' $FULLNAME > $FULLNAME.t; mv -f $FULLNAME.t $FULLNAME > /dev/null 2>&1; refreshprofile;"
alias brandomusic+set_autoremove="sed 's/\ brandomusic-cache-clear\.sh/\#\ brandomusic-cache-clear\.sh/g' $FULLNAME > $FULLNAME.t; mv -f $FULLNAME.t $FULLNAME > /dev/null 2>&1; refreshprofile;"
alias cd0='cd ~/storage/shared'
alias cdd='cd ~/storage/downloads'
alias cddc='cd ~/storage/dcim'
alias cdm='cd ~/storage/music'
alias cdmo='cd ~/storage/movies'
alias cdsd='cd /sdcard'
alias cdpic='cd ~/storage/pictures'
alias chx='chmod +x'
alias cuprog='coreutils --coreutils-prog=${@}'
alias deviceab_check='getprop ro.build.ab_update'
alias downtree='tree ~/storage/downloads'
alias egvarexpan='echo ${!BASH*}'
alias expcat='cp -f ${1} ${PREFIX}/bin/$1 &>/dev/null; chmod +xr ${PREFIX}/bin/${1} &>/dev/null; echo >&2 "error: missing arguments" '
alias fetch_colorbar='256colors2 | head -n 2 | tail -n 1'
alias fix_ctypes="exec "$BASH""
alias l='ls -lah'
alias la='exa --icons -lgha --group-directories-first'
alias ll='ls -lh'
alias lrsaw='busybox ls -rSaw ${COLUMNS}'
alias ls='exa --icons'
alias lsa='ls -lah'
alias lt='exa --icons --tree'
alias lta='exa --icons --tree -lgha'
alias lol='echo 'your\ mom''
alias neodistro='neofetch --ascii_distro'
alias nomediacheck='cd $OLDPWD; cd /sdcard; printf "%s %s %s\n" "$(find . ! -readable -prune -o -name "*.nomedia" -type f -print | wc -l)" "totals .nomedia" "on /sdcard"; cd - &>/dev/null;'
alias open='termux-open'
alias pacupd='pkg update'
alias pacupg='pkg upgrade'
alias pacupgupd='pkg update && pkg upgrade'
alias prefix='cd $PREFIX'
alias preview='fzf --preview='\''bat --color=always --style=numbers --theme OneHalfDark {}'\'' --preview-window=down'
alias proot-dinstalled='cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs; ls;'
alias proot-dlogin='proot-distro login '
alias refreshprofile='source /data/data/com.termux/files/home/.bash_profile' #for refresh profile
alias vendor='getprop ro.product.manufacturer'


##- Functions

function setenv {
# function mksh
	eval export "\"$1\""'="$2"'
}
declare -x -f setenv
function ipwifi {
HOSTNAME='localhost'
hname=$(busybox ifconfig wlan0 | awk '/inet / { print $2 }' | sed -e s/addr:// ); echo ${hname:- "${HOSTNAME}"};
}
declare -f -x ipwifi 
function bh { bash -c 'help '"$@"; }
declare -f -x bh
function brandomusic {
# builtin alrc-termux 
# USAGE : brandomusic.sh DIR...
# Version: v1.2.2 : (What's new)
#  - Add feature custom parameter
#  - Add feature work without parameter 
# Version: v1.3.2 : (What's new)
#  - Add alias (brandomusic)-set_autoremove
#  - Add alias (brandomusic)+set_autoremove
#  - Add command (brandomusic)-cache-clear(.sh)
#  - Add file answer.txt on .local/bin
#  - Fix Major bug on cmd `ls'
#  - Fix minor bug on variable 'local file'
#  - Add feature one interactive input
#  - Add feature Time out within timeout toast

# Pemutar musik dinamis menggunakan "$PREFIX/bin/am"
#
# ------ Memutar lagu secara acak dari parameter yang ditentukan pengguna, juga dapat bekerja tanpa parameter.(nilai semula ditetapkan sebagai $HOME/downloads.
# ------ 
# Usage: brandomusic.sh [DIR...]
#           playing random .mp3 files on directory parameter

# Persyaratan: Membutuhkan aplikasi android pemutar music yang berjalan dilatar (Seperti aplikasi bawaan)
#
# Diuji pada perangkat Redmi 10 C 

# License : GNU/GPLv3
# Copyright (c) 2023 @luisadha


local format='audio/mp3'

local file="${1:+"${1}/*.mp3"}" #jika argumen $1 is not NULL

local file2="${1-"${HOME}/downloads/*.mp3"}" #jika argumen $1 is NULL

local files=$(busybox ls ${file:-${file2}})

local n="${#files[@]}"       

local pick="${files[RANDOM % n]}"

local result="$(printf "${0:+${pick}}" | shuf -n 1)"

local tmp="/sdcard/download/"$(basename "${result}")".tmp" 

cd "/sdcard/Download" &>/dev/null;

cp -rf "${result}" "${tmp}" &>/dev/null;

    read -n 1 -t 5 -p "Please tick remember my choice, once you see the popup! Y?
" answer

cat <<- EOF > ~/.local/bin/answer.txt
${answer}
EOF

    case "$answer" in
        [Yy]* )
 eval `am start -a android.intent.action.VIEW -d file://"${tmp}" -t ${format} ` &>/dev/null; 
# sleep 1
echo
 brandomusic-cache-clear.sh
cd - &>/dev/null;;
        * ) rm -f "${tmp}" ; termux-toast "Timeout!"; cd - &>/dev/null; return 0;;
    esac

}
declare -f -x brandomusic
function ranpper-termux {
#!/bin/bash
# ranpper.sh v1.0
# Since Thu May  9 19:00:28 WIB 2019

# ranpper-termux(.sh) aka (ranpper v2.1:FINAL)
# Wed Jan 18 12:45:27 WIB 2023
# GNU/GPLv3
# Copyright c 2023 @luisadha

local files=(${1?'no folder given!'}/*.jpg)
local n=${#files[@]}
local wallpaper="${files[RANDOM % n]}"
termux-wallpaper -f "$wallpaper" || echo "Something wen't wrong"; 
return 0
}
declare -f -x ranpper-termux 
# list_sort-by-size
function lsn {
(( $# > 0 )) && (ls -s "$@" | sort -n) \
|| (ls -s . | sort -n)
}
declare -f -x lsn
function lll { busybox ls -l "$@" | busybox awk '{ print $5,$9 }' | busybox sort -n
}
declare -f -x lll
function cu { coreutils --coreutils-prog=${@}; }
declare -f -x cu
function transfer {
# upload file to site transfer.sh
if [ $# -eq 0 ]; then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>" >&2;
return 1;
fi;

if tty -s; then file="$1";
file_name=$(basename "$file");
if [ ! -e "$file" ]; then echo "$file: No such file or directory" >&2;
return 1;
fi;
if [ -d "$file" ]; then
file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"| tee /dev/null,;
else cat "$file"| curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;
fi

else
 file_name=$1;
curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name" | tee /dev/null;
 fi;
}
declare -f -x transfer 
function convertime {
# converter secs to minutes, hours, days (readable format)

  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  (( $D > 0 )) && printf '%d days ' $D
  (( $H > 0 )) && printf '%d hours ' $H
  (( $M > 0 )) && printf '%d minutes ' $M
  (( $D > 0 || $H > 0 || $M > 0 )) && printf 'and '
  printf '%d seconds\n' $S

}
declare -f -x convertime
function readwrites { 
# to remove readonly var

    declare -p $1 &>/dev/null || return -1 # Return if variable not exist
    local -n variable=$1
    local reslne result flags=${variable@a}
    [ -z "$flags" ] || [ "${flags//*r*}" ] && { 
        unset $1    # Don't run gdb if variable is not readonly.
        return $?
    }
    while read -r resline; do
        [ "$resline" ] && [ -z "${resline%%\$1 = *}" ] &&
            result=${resline##*1 = }
    done < <(
        exec gdb 2>&1 -ex 'call (int) unbind_variable("'$1'")' --pid=$$ --batch
    )
    return $result
}
declare -f -x readwrites 
# Check if command is in PATH
function checkDep {
     path=`command -v ${1}` && echo "${1} found at ${path}" || { echo "${1} not found" >&2 ; return 1; }
}
declare -f -x checkDep
function generateqr {
printf "$@" | curl -F-=\<- qrenco.de
}
declare -f -x generateqr
function duplicatefind {
find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate
}
declare -f -x duplicatefind
#if ! source ctypes.sh; then
#    echo "please install ctypes.sh to continue"
#fi

# source ctypes.sh
# if any error of these, fix with alias fixctypes-source 
# bash: declare: NULL: readonly variable                     bash: declare:
# STDIN_FILENO: readonly variable             bash: declare: 
# TDOUT_FILENO: readonly variable            bash: declare: 
# STDERR_FILENO: readonly variable

set +o noclobber
export PATH="${PATH}:$HOME/.local/bin"
ADDON_BRANDO="brandomusic-cache-clear.sh"

cat <<- "EOF" > $HOME/.local/bin/$ADDON_BRANDO

#!/usr/bin/env bash
# generated by brandomusic
mapfile -d '' content < $HOME/.local/bin/answer.txt
content="${content[*]%$'\n'}"
read -rd '' content <  $HOME/.local/bin/answer.txt

if [ "$content" == "Y" ] || [ "$content" == "y" ]; then
echo "Deleting... "
 find /sdcard/Download -name '*.mp3.tmp*'  -print; 
 find /sdcard/Download -name '*.mp3.tmp*'  -exec rm {} +
  sleep 1
echo "Done!"
else
 echo -e "Run brandomusic first!"
 exit 1
fi

EOF
chmod +x $HOME/.local/bin/$ADDON_BRANDO

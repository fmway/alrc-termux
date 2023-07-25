#!/usr/bin/bash
#
#
array=(
 "result.race" "ifconfig.txt" "nohup.out" "imjpgrand.sh" "answer.txt" "check_ip.sh"
)

function hapus() {
arg=$1
find . -iname "$arg" -print -exec rm {} +
}

function main ()
{
  function console_log ()
  { 
ls | grep "${array[0]}" || \
ls | grep "${array[1]}" || \
ls | grep "${array[2]}" || \
ls | grep "${array[3]}" || \
ls | grep "${array[@]}";

#find . -iname "ifconfig.txt" -print; find . -iname "nohup.out" -print;
#
    if [ $? -eq 0 ]; then
      echo "Ditemukan!"
    else
      echo "Tampak baik"
      exit 1
    fi
  }
console_log;
echo "Hapus? [Y/n]"
read answr
 case "$answr" in 
   Y|y)
     hapus "${array[0]}"
     hapus "${array[1]}"
     hapus "${array[2]}"
     hapus "${array[@]}"
     ;;
   N|n)
     echo "Program terminated!"
     exit 0
     ;;
   *)
    main;
     ;;
 esac
exit 0
}
main;

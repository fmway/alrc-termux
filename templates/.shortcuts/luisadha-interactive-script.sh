#!/usr/bin/bash

cd ~
cd luisadha/
cd script
cd interactive

PS3="Your choice: "

files="$(ls -Art .)"

echo "------------------------------"
echo " Luisadha-interactive-script"
echo " v1.0"
echo "------------------------------"
echo -e "Provide some tools from repository:\n Visit https://github.com/luisadha/luisadha"
echo


select filename in ${files} Quit;
do
[[ -n $filename ]] || { echo "What's that? Please try again." >&2; continue; }
 
  case ${filename} in
    "Quit")
      echo "Exiting.."
      break
      ;;
    *)
      
    	echo "You selected $filename ($REPLY)"
    echo
      chmod +x ${filename}/${filename,,}.sh
      bash ~/luisadha/script/interactive/${filename}/${filename,,}.sh
    echo
     read -t 0.1
     continue
     ;;
  esac
done
  

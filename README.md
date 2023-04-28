## alrc-termux 

alrc-termux.sh -whatisal v2.3-en (22/01/23 10:01:35 WIB) al and whatisal (functions) are minimal autoload for your termux alternate of neofetch to display system information just call it through source within your .bashrc.

History :

"al is an exported alias for al" (by default mkshrc MOD) or if any function named 'al' it must be called "al is a function".

alias al come with mkshrc mod by @7175-xda-devoloper, but function named al come with this resource by @adharudin14 also this function.

usage#1:

 source **~/downloads/alrc-termux.sh** from within your **~.bash\_profile** or **~/.bashrc** file

usage#2: 

         chsh -s bash && login     change to bash shell and exit

         whatisal                   print this help message and return

##Feature 


AA Automation memainkan lagu secara otomatis saat Anda membuka Termux untuk kali pertama

MOBuka gambar acak menggunakan imjbrand.


## Install

1. cd $HOME &&```git clone https://github.com/luisadha/alrc-termux.git```

2. cd alrc-termux

3. make install

4. source **~/.local/bin/alrc-termux.sh** from within your **~.bash\_profile** or **~/.bashrc** file (preferably .bash_profile) and add one lane on the PATH variable 

   export PATH=$PATH:$HOME/.local/bin
 
## Uninstall
   
   bash uninstall-alrc-termux.sh

## Update

  Reclone this repo and then type make install

  rm -rf ~/alrc-termux & Do method number 1

### Doc

https://telegra.ph/Sejarah-Alrc-termux-02-23

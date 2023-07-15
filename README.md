## alrc-termux | dotfiles | .bash_profile 

alrc-termux.sh -whatisal v2.3-en (22/01/23 10:01:35 WIB) al and whatisal (functions) are minimal autoload for your termux alternate of neofetch to display system information just call it through source within your .bashrc.

History :

"al is an exported alias for al" (by default mkshrc MOD) or if any function named 'al' it must be called "al is a function".

alias al come with mkshrc mod by @7175-xda-devoloper, but function named al come with this resource by @adharudin14 also this function.

usage#1:

 source <(**~/.local/bin/alrc env**) from within your **~.bash\_profile** or **~/.bashrc** file

usage#2: 

         chsh -s bash && login     change to bash shell and exit

         whatisal                   print this help message and return

## Feature 


* Automation plays songs automatically when you open Termux for the first time

* Automation Open a random image using imjpgrand 


## Install

### Automatic
   ```sh
   curl -fSsL https://raw.githubusercontent.com/fmway/alrc-termux/master/install.sh | bash
   ```
### Manual
   + clone this repository
      ```sh
      git clone https://github.com/luisadha/alrc-termux.git ~/.local/share/alrc-termux
      ```
   + link alrc to your bin path
      ```sh
      ln -s ~/.local/share/alrc-termux/alrc ~/.local/bin/alrc
      ```
 
## Uninstall
   ```sh
   alrc uninstall
   ```

## Update
   ```sh
   alrc update
   ```

### Testing
    - Termux (Passing)
    - Proot-distro (experimental)
    - Replit (Work, but bad idea)
    - Wayland (error tester by alif)
### Bug
```be careful installing other dotfiles, it can cause unwanted bugs/errors due to misconfiguration.  first uninstall alrc-termux if you want to try using other dotfiles. termux-desktop causes imjpgrand to not work and other weird bugs```

### Doc

https://telegra.ph/Sejarah-Alrc-termux-02-23

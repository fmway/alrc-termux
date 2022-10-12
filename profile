
for i in /data/data/com.termux/files/usr/etc/profile.d/*.sh; do
        if [ -r $i ]; then
                . $i
        fi
done
unset i

# Source etc/bash.bashrc and ~/.bashrc also for interactive bas>
if [ "$BASH" ]; then
        if [[ "$-" == *"i"* ]]; then
                if [ -r /data/data/com.termux/files/usr/etc/bas>
                        . /data/data/com.termux/files/usr/etc/b>
                fi
              if [ -r /data/data/com.termux/files/home/.bashrc >
                        . /data/data/com.termux/files/home/.bas>
                fi
        fi
fi


cowsay -f eyes WELCOME BACK luisadha | lolcat
neofetch

source /data/data/com.termux/files/home/downloads/alrc

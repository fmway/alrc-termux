command_not_found_handle() {
	/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}

source ~/.local/bin/bashmarks.sh
echo "**Bashmarks Activated**"

if [ -r /data/data/com.termux/files/home/downloads/alrc-termux.sh ]; then
echo "**Alrc-Termux Activated**"
 . /data/data/com.termux/files/home/downloads/alrc-termux.sh
fi

PS1="[\[\033[32m\]\w]\[\033[0m\]<\h>\n<\h>\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"

# python2 .login.py

passwd(){
python2 passwd.py
}
useradd(){
python2 useradd.py
}
info(){
cat dbinfo
}
me(){
python2 .me.py
}

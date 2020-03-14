# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don"t like systemctl"s auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
PS1="\[\e[1;36m\]\u\[\e[m\] \[\e[1;37m\]\H\[\e[m\] \[\e[1;35m\]\w\[\e[m\]\[\e[1;33m\]$\[\e[m\]"
export LANG=ja_JP.utf8
HISTSIZE=1000000
HISTFILESIZE=2000

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -alF'

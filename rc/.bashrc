# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don"t like systemctl"s auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"
alias python="/usr/bin/python3.6"
alias pip="/usr/local/bin/pip"
PS1="[\[\e[0;37m\]\u\[\e[5;36m\]@$(hostname) \[\e[1;35m\]\w\[\e[m\]]$"
LANG=ja_JP.utf8

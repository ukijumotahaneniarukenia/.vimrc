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
HEART=$(echo -ne $(cat <<___HEART___ | shuf -n 1 
\U2764
\U1F499
\U1F49A
\U1F49B
\U1F9E1
\U1F49C
\U1F5A4
\U1F498
\U1F493
\U1F494
\U1F495
\U1F496
\U1F497
\U1F49D
\U1F49E
\U1F49F
\U2763
\U2665
___HEART___
))
PS1="[\[\e[0;37m\]\u\[\e[1;36m\]$HEART\H \[\e[0;33m\](\d \t) \[\e[1;35m\]\w\[\e[m\]]$"
export LANG=ja_JP.utf8
alias comb=$HOME/script_scratch/perl/組み合わせ.sh
alias perm=$HOME/script_scratch/perl/順列.sh
alias circle=$HOME/script_scratch/perl/回転.sh
alias expand=$HOME/script_scratch/awk/スペース区切り文字の行展開.sh
alias dupl=$HOME/script_scratch/yes/単一行の行複写.sh

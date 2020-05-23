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

#インプットメソッドの設定

OS_NAME=$(cat /etc/os-release | grep ID | head -n1 | xargs | sed -r 's/.+=//')

if [ $OS_NAME = "ubuntu" ];then
  export GTK_IM_MODULE=fcitx
  export XMODIFIERS=@im=fcitx
  export QT_IM_MODULE=fcitx
else
  export GTK_IM_MODULE=ibus
  export XMODIFIERS=@im=ibus
  export QT_IM_MODULE=ibus
fi

#Gitブランチを表示
if [ -f git-prompt.sh ];then
  :
else
  curl -sSLO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi

mv git-prompt.sh .git-prompt.sh

source $HOME/.git-prompt.sh

#POWERLINEフォントを適用
POWERLINE_FONT_FILE_NAME=$(ls $HOME/.fonts/Menlo* 2>/dev/null)

if [ -z $POWERLINE_FONT_FILE_NAME ];then
  bash /usr/local/src/script-repo/centos-7-6-18-10-config-font-Menlo_for_Powerline.sh
else
  :
fi

export PS1='\[\e[30;47m\] \t \[\e[37;46m\]\[\e[30m\] $(__git_ps1) \[\e[36;49m\]\[\e[0m\] '

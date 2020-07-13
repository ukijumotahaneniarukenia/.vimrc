# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don"t like systemctl"s auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

#ディレクトリの色などをユーザー個別設定に適用
export SHELL=$(which bash)

eval `dircolors $HOME/.colorrc`


uid=$(id | grep -oP uid=[0-9]+ | sed -r 's/.+=([0-9]+)/\1/')

if [ $uid -eq 0 ];then
  #rootユーザー
  PS1="\[\e[38;5;200m\]\u\[\e[m\] \[\e[1;37m\]\H\[\e[m\] \[\e[38;5;157m\]\w\[\e[m\]\[\e[1;33m\]$\[\e[m\]"
else
  #non-rootユーザー
  PS1="\[\e[38;5;44m\]\u\[\e[m\] \[\e[1;37m\]\H\[\e[m\] \[\e[38;5;157m\]\w\[\e[m\]\[\e[1;33m\]$\[\e[m\]"
fi




export LANG=ja_JP.utf8
HISTSIZE=1000000
HISTFILESIZE=2000

alias ls='ls --color=auto -F'
alias grep='grep --color=auto'

alias ll='ls -alhF'

#クリップボードへのコピー
alias pbcopy='xsel --clipboard --input'

#クリップボードからペースト
alias pbpaste='xsel --clipboard --output'

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
#if [ -f $HOME/git-prompt.sh ];then
#  :
#else
#  curl -o $HOME/git-prompt.sh -sSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
#  mv $HOME/git-prompt.sh $HOME/.git-prompt.sh
#fi

#source $HOME/.git-prompt.sh
#
##POWERLINEフォントを適用
#POWERLINE_FONT_FILE_NAME=$(ls $HOME/.fonts/Menlo* 2>/dev/null)
#
#if [ -z $POWERLINE_FONT_FILE_NAME ];then
#  bash /usr/local/src/script-repo/centos-7-6-18-10-config-font-Menlo_for_Powerline.sh
#else
#  :
#fi
#
#export PS1='\[\e[38;5;229m\]\H \[\e[0m\]\[\e[38;5;192m\](\u) \[\e[0m\]\[\e[30;2;47m\] \t \[\e[0m\]\[\e[33;7;47m\]\[\e[0m\]\[\e[30;2;43m\] \W $(__git_ps1) \[\e[0m\]\[\e[30;7;43m\]\[\e[0m\] '
#



function tovim(){
#Usage
#seq 10 | xargs -n3 | tovim
  TMP=tmp-$$
  cat - >$TMP
  vim $TMP </dev/tty # 今使っている端末からの標準入力を読み込む
  rm -rf $TMP
}

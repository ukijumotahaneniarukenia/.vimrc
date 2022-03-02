# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#使用するログインシェルの設定
export SHELL=$(which bash)

#ディレクトリの色などをユーザー個別設定に適用
eval `dircolors $HOME/.colorrc`

if [ -f /usr/local/src/systemd_nspawn.env ];then
  #systemd_nspawnコンテナ
  if [[ $(id $USER -u) -eq 0 ]];then
    #rootユーザー
    PS1="\[\e[38;5;118m\]\u\[\e[m\] \[\e[38;5;213m\]\t\[\e[m\] \[\e[38;5;157m\]\w\[\e[m\]\[\e[1;33m\]$\[\e[m\]"
  else
    #non-rootユーザー
    PS1="\[\e[38;5;195m\]\u\[\e[m\] \[\e[38;5;213m\]\t\[\e[m\] \[\e[38;5;157m\]\w\[\e[m\]\[\e[1;33m\]$\[\e[m\]"
  fi
else
  #systemd_nspawnコンテナ以外
  if [[ $(id $USER -u) -eq 0 ]];then
    #rootユーザー
    PS1="\[\e[38;5;228m\]\u\[\e[m\] \[\e[38;5;213m\]\t\[\e[m\] \[\e[38;5;157m\]\w\[\e[m\]\[\e[1;33m\]$\[\e[m\]"
  else
    #non-rootユーザー
    PS1="\[\e[38;5;44m\]\u\[\e[m\] \[\e[38;5;213m\]\t\[\e[m\] \[\e[38;5;157m\]\w\[\e[m\]\[\e[1;33m\]$\[\e[m\]"
  fi
fi


#改行をプロンプトの前に入れる
PS1=$PS1"\n\[\e[1;33m\]$ \[\e[m\]"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alh'
alias pbcopy='xsel --clipboard --input' #クリップボードへのコピー
alias pbpaste='xsel --clipboard --output' #クリップボードからペースト

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#ディレクトリの色などをユーザー個別設定に適用
eval `dircolors $HOME/.colorrc`

if [[ $(id $USER -u) -eq 0 ]];then
  #rootユーザー
  PS1="\[\e[38;5;200m\]\u\[\e[m\] \[\e[38;5;44m\]ukijumotahaneniarukenia\e[m\] \[\e[1;37m\]\H\[\e[m\] \[\e[38;5;213m\]\t\[\e[m\] \[\e[38;5;157m\]\w\[\e[m\]\[\e[1;33m\]$\[\e[m\]"
else
  #non-rootユーザー
  PS1="\[\e[38;5;44m\]\u\[\e[m\] \[\e[38;5;200m\]ukijumotahaneniarukenia\e[m\] \[\e[1;37m\]\H\[\e[m\] \[\e[38;5;213m\]\t\[\e[m\] \[\e[38;5;157m\]\w\[\e[m\]\[\e[1;33m\]$\[\e[m\]"
fi

#改行をプロンプトの前に入れる
PS1=$PS1"\n\[\e[1;33m\]$ \[\e[m\]"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -alh'

#クリップボードへのコピー
alias pbcopy='xsel --clipboard --input'

#クリップボードからペースト
alias pbpaste='xsel --clipboard --output'

function tovim(){
#Usage
#seq 10 | xargs -n3 | tovim
  TMP=tmp-$$
  cat - >$TMP
  vim $TMP </dev/tty # 今使っている端末からの標準入力を読み込む
  rm -rf $TMP
}

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
    PS1="\[\e[38;5;118m\]\u\[\e[m\] \[\e[38;5;195m\]ukijumotahaneniarukenia\e[m\] \[\e[1;37m\]$(ip a show | grep -Po '([0-9]+.){3}(.[0-9]+)'|grep 192.168.1|grep -v 255)\[\e[m\] \[\e[1;37m\]vir-\H\[\e[m\] \[\e[38;5;213m\]\t\[\e[m\] \[\e[38;5;157m\]\w\[\e[m\]\[\e[1;33m\]$\[\e[m\]"
  else
    #non-rootユーザー
    PS1="\[\e[38;5;195m\]\u\[\e[m\] \[\e[38;5;118m\]ukijumotahaneniarukenia\e[m\] \[\e[1;37m\]$(ip a show | grep -Po '([0-9]+.){3}(.[0-9]+)'|grep 192.168.1|grep -v 255)\[\e[m\] \[\e[1;37m\]vir-\H\[\e[m\] \[\e[38;5;213m\]\t\[\e[m\] \[\e[38;5;157m\]\w\[\e[m\]\[\e[1;33m\]$\[\e[m\]"
  fi
else
  #systemd_nspawnコンテナ以外
  if [[ $(id $USER -u) -eq 0 ]];then
    #rootユーザー
    PS1="\[\e[38;5;228m\]\u\[\e[m\] \[\e[38;5;44m\]ukijumotahaneniarukenia\e[m\] \[\e[1;37m\]$(ip a show | grep -Po '([0-9]+.){3}(.[0-9]+)'|grep 192.168.1|grep -v 255)\[\e[m\] \[\e[1;37m\]\H\[\e[m\] \[\e[38;5;213m\]\t\[\e[m\] \[\e[38;5;157m\]\w\[\e[m\]\[\e[1;33m\]$\[\e[m\]"
  else
    #non-rootユーザー
    PS1="\[\e[38;5;44m\]\u\[\e[m\] \[\e[38;5;228m\]ukijumotahaneniarukenia\e[m\] \[\e[1;37m\]$(ip a show | grep -Po '([0-9]+.){3}(.[0-9]+)'|grep 192.168.1|grep -v 255)\[\e[m\] \[\e[1;37m\]\H\[\e[m\] \[\e[38;5;213m\]\t\[\e[m\] \[\e[38;5;157m\]\w\[\e[m\]\[\e[1;33m\]$\[\e[m\]"
  fi
fi


#改行をプロンプトの前に入れる
PS1=$PS1"\n\[\e[1;33m\]$ \[\e[m\]"

#エイリアス-ネイティブ
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alh'
alias pbcopy='xsel --clipboard --input' #クリップボードへのコピー
alias pbpaste='xsel --clipboard --output' #クリップボードからペースト

#エイリアス-ベンダー
alias idea="/usr/local/src/idea-IC-202.6397.94/bin/idea.sh 1>$HOME/launch-idea.log 2>&1 &"
alias pyc="bash /usr/local/src/pycharm-community-2020.2.1/bin/pycharm.sh 1>$HOME/launch-pycharm.log 2>&1 &"
alias myb="mysql-workbench 1>$HOME/launch-mysql-bench.log 2>&1 &"
alias qtd="$HOME/anaconda3/bin/designer 1>$HOME/launch-qt_designer.log 2>&1 &"
alias and="studio.sh 1>$HOME/launch-android-studio.log 2>&1 &"
alias eclipse="$HOME/eclipse/rust-2020-03/eclipse/eclipse 1>$HOME/launch-eclipse.log 2>&1 &"

#エイリアス-マイセルフ
alias repo="cd /usr/local/src/script-repo"
alias sskc="cd $HOME/script-sketch"
alias senv="cd $HOME/script-env"
alias scmd="cd $HOME/script-cmd"
alias sapi="cd $HOME/script-api"

#ファンクション-マイセルフ
function tovim(){
#Usage
#seq 10 | xargs -n3 | tovim
  TMP=tmp-$$
  cat - >$TMP
  vim $TMP </dev/tty # 今使っている端末からの標準入力を読み込む
  rm -rf $TMP
}

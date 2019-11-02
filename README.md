# .vimrc

# 自作コマンドのエイリアス設定

root実行

ユーザーごとの.bashrcファイルはホームディレクトリをハードで記載しておくこと。

```
grep scratch /home/sqlite/.bashrc | while read ln;do ( echo $ln | sed 's;.*=;;' && echo $ln | sed -e 's;=.*;;g' -e 's;#\?alias ;;' ) | xargs -n2; done | awk '{print "ln -fns "$1" /usr/local/bin/"$2}'
```

```
ln -fns /home/sqlite/script_scratch/perl/組み合わせ.sh /usr/local/bin/comb
ln -fns /home/sqlite/script_scratch/perl/順列.sh /usr/local/bin/perm
ln -fns /home/sqlite/script_scratch/perl/回転.sh /usr/local/bin/circle
ln -fns /home/sqlite/script_scratch/awk/スペース区切り文字の行展開.sh /usr/local/bin/expand
ln -fns /home/sqlite/script_scratch/yes/単一行の行複写.sh /usr/local/bin/incr
ln -fns /home/sqlite/script_scratch/sed/先頭に文字追加.sh /usr/local/bin/ahead
ln -fns /home/sqlite/script_scratch/sed/末尾に文字追加.sh /usr/local/bin/atail
ln -fns /home/sqlite/script_scratch/sqlite/テキスト型のカラム列の作成.sh /usr/local/bin/colztxt
ln -fns /home/sqlite/script_scratch/shuf/ランダムな半角大文字取得.sh /usr/local/bin/randU
ln -fns /home/sqlite/script_scratch/shuf/ランダムな半角数字取得.sh /usr/local/bin/randn
ln -fns /home/sqlite/script_scratch/shuf/ランダムな半角英数字取得.sh /usr/local/bin/randan
ln -fns /home/sqlite/script_scratch/shuf/ランダムな半角大文小文字取得.sh /usr/local/bin/randUu
ln -fns /home/sqlite/script_scratch/shuf/ランダムな半角小文字取得.sh /usr/local/bin/randu
```


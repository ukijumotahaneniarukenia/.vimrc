"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME . '/.vim/bundle')
  call dein#begin($HOME . '/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add($HOME . '/.vim/bundle/repos/github.com/Shougo/dein.vim')

  let s:toml = $HOME . '/.vim/.dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
set runtimepath+=$HOME/.vim/bundle/nerdtree
autocmd VimEnter * execute 'NERDTree'
set helplang=ja
nnoremap <silent><C-e> :NERDTreeToggle<CR>

colorscheme molokai
set t_Co=256

runtime! util/*.vim

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-scripts/Align'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'suan/vim-instant-markdown'

call plug#end()


if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif


set helplang=ja

colorscheme molokai
set t_Co=256

runtime! util/*.vim

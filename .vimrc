call plug#begin()

Plug 'vim-jp/vimdoc-ja'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'suan/vim-instant-markdown'

"swift用
"https://github.com/neoclide/coc.nvim
"https://qiita.com/AK-10/items/975b2b2d036ef9126e9b#cocnvim%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'keith/swift.vim'

call plug#end()

"swiftの警告抑止
let g:coc_disable_startup_warning = 1


"python拡張
"https://qiita.com/kouichi_c/items/5f047ab3a7c64277e97c
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

"go拡張
"https://mattn.kaoriya.net/software/lang/c/20191112100330.htm
if executable('gopls')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'go-lang',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ 'workspace_config': {'gopls': {
        \     'staticcheck': v:true,
        \     'completeUnimported': v:true,
        \     'caseSensitiveCompletion': v:true,
        \     'usePlaceholders': v:true,
        \     'completionDocumentation': v:true,
        \     'watchFileChanges': v:true,
        \     'hoverKind': 'SingleLine',
        \   }},
        \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
    autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
    autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
    autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
  augroup END
endif

"clangd拡張
"https://qiita.com/Quramy/items/bccf7b19919679541484
"事前にapt install -y clangdをインストールしておくこと
if executable('clangd')
  augroup LspClangd
    au!
    autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': {server_info->['clangd']},
    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
    \ })
    autocmd FileType c setlocal omnifunc=lsp#complete
    autocmd FileType c nmap <buffer> gd <plug>(lsp-definition)
    autocmd FileType c nmap <buffer> ,n <plug>(lsp-next-error)
    autocmd FileType c nmap <buffer> ,p <plug>(lsp-previous-error)
  augroup END
endif

"vim拡張
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

set helplang=ja

colorscheme molokai
set t_Co=256

runtime! util/*.vim

syntax on
filetype on
filetype plugin on
filetype indent on

" ===============================
" ===== Environment settings ====
" ===============================
set nocompatible

" - display cursor line
set cursorline

" - Not ring a bell
set visualbell

set foldmethod=syntax

" - enable to select as block
set virtualedit=block

" - encoding settings
set encoding=utf-8
set fileencodings=utf-8,sjis,cp932,iso-2022-jp,euc-jp

" - show line number
set nu

" - visible empty chars
set list
set listchars=tab:>.,trail:-,eol:$,nbsp:%,extends:\

" - Tab setting
set ts=4
set sw=4

" - Prevent auto newline
set textwidth=0

" - Confirm corresponding to {,} or (,) ...
set showmatch

" - vi 互換モード off
set nocompatible

" - 検索をファイルの末尾まで検索したら、ファイルの先頭へループする。
set wrapscan

" - Search words by caseignore
set ignorecase

set notitle



" ===========================
" ======= Each plugins ======
" ===========================
"
" ==== neobundle
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'L9'
NeoBundle 'tpope/vim-rails'
NeoBundle 'surround.vim'
NeoBundle 'mru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'hrp/EnhancedCommentify'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'hekyou/vim-rectinsert'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tyru/vim-altercmd'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'rhysd/neco-ruby-keyword-args'
NeoBundle 'FuzzyFinder'
NeoBundle 'groenewege/vim-less'
NeoBundle 'jiangmiao/simple-javascript-indenter.git'

filetype plugin indent on

" ==== neocomplcache
let g:neocomplcache_enable_at_startup = 1    " on neocomplcache setting
let g:neocomplcache_enable_smart_case = 1    " case ignore
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_max_list = 20            " max size of menu list
let g:neocomplcache_min_syntax_length = 3

" dictionaries for neocomple
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'php'        : $HOME . '/.vim/dict/php.dict',
    \ 'javascript' : $HOME . '/.vim/dict/javascript.dict',
    \ }

inoremap <C-Space> <C-N><C-P>
inoremap <expr> <C-j> pumvisible() ? "\<Down>" : "\<C-x>\<C-o>"
inoremap <expr> <C-k> pumvisible() ? "\<Up>" : "\<C-x>\<C-o>"
highlight Pmenu ctermbg=blue
highlight PmenuSel ctermbg=red ctermfg=white
highlight PmenuSbar ctermbg=white

" ==== neosnippet
"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Directory of snippet setting files
let g:neosnippet#snippets_directory='~/.vim/snippets'


" ==== rect insert
vmap <silent> <leader>vp <Plug>:RectInsert -i


" ========================
" ======= Some Tips ======
" ========================

" Ctrl + p => paste 0 register
vnoremap <silent> <C-p> "0p<CR>

" ==== Syntax highight
hi Comment ctermfg=gray
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ==== Define file type
au BufRead,BufNewFile *.sql  set filetype=sql
au BufRead,BufNewFile *.case set filetype=html
au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.vim  set filetype=vim

" ==== Insert template
autocmd BufNewFile *.php  0r   $HOME/.vim/template/php.txt
autocmd BufNewFile *.html 0r   $HOME/.vim/template/html.txt
autocmd BufNewFile *.js   0r   $HOME/.vim/template/javascript.txt

" - open a file with pre-modified point
au BufWritePost * mkview
autocmd BufReadPost * loadview

" ==== Backspace key settings
" - Bind backspace event to [Backspace] key
noremap ^? ^H
noremap! ^? ^H
set backspace=2

" ==== for vimdiff setting
set diffopt-=filler
hi DiffAdd    ctermfg=black   ctermbg=lightblue
hi DiffDelete ctermfg=black   ctermbg=lightmagenta
hi DiffChange ctermfg=black   ctermbg=lightgray
hi DiffText   ctermfg=black   ctermbg=lightcyan

" ==== History setting
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" ==== Cmd window settings
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>

nmap :  <sid>(command-line-enter)
xmap :  <sid>(command-line-enter)

autocmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  startinsert!
endfunction

vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" ==== Expand window
noremap <C-w>+ <C-w>10+
noremap <C-w>- <C-w>10-
noremap <C-<>< <C-w>10<
noremap <C->>> <C-w>10>


" ========================================
"  color settings
" ========================================

" Popup menu
hi Pmenu ctermfg=white
hi PmenuSel ctermbg=lightcyan ctermfg=black
noremap <C-w>- 10<C-w>-
noremap <C-<>< 10<C-w><
noremap <C->>> 10<C-w>>


" Ruby is too Heavy !!!
let g:ruby_path = ""
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif


set t_Co=256

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

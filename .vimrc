syntax on
filetype plugin on
filetype indent on

set cursorline

set visualbell

" ===== Insert template
autocmd BufNewFile *.php  0r   $HOME/.vim/template/php.txt
autocmd BufNewFile *.html 0r   $HOME/.vim/template/html.txt
autocmd BufNewFile *.js   0r   $HOME/.vim/template/javascript.txt

" pathogen settings
call pathogen#runtime_append_all_bundles()

" twitvim setting
let g:twitvim_login_b64 = 'dGFuX3l1a2k6b3IzS0lPc2Y='
let g:twitvim_browser_cmd = 'open -a /Applications/Google\ Chrome.app/'

" ===== Open a file with pre-modified point
au BufWritePost * mkview
autocmd BufReadPost * loadview

" === Rect insert
vmap <silent> <leader>vp <Plug>:RectInsert -i

" === Twitter settings
let twitvim_login_b64 = 'dGFuX3l1a2k6b3IzS0lPc2Y='
let twitvim_proxy = 'http://lms.mytrip.net:3128'

" ===== QFix App settings
set runtimepath+=~/.vim/qfixapp/
let QFixHowm_Key         = 'g'
let howm_dir             = '~/howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
let mygrepprg            = 'grep'
let $CYGWIN              = 'nodosfilewarning'
let MyGrep_ShellEncoding = 'utf-8'
au QuickfixCmdPost vimgrep cw

" ===== Enable to select as block
set virtualedit=block

set foldmethod=syntax

" ===== Encoding settings
set encoding=utf-8
set fileencodings=utf-8,sjis,cp932,iso-2022-jp,euc-jp

" ===== Basic settings
" - show line number
set nu

" - visible empty chars
set list
set listchars=tab:>.,trail:-,eol:$,nbsp:%,extends:\

" - Tab setting
set ts=4
set sw=4

" - set file name in window title
set title

" - Prevent auto newline
set textwidth=0

" - Confirm corresponding to {,} or (,) ...
set showmatch

" - vi 互換モード off
set nocompatible

" - 検索をファイルの末尾まで検索したら、ファイルの先頭へループする。
set wrapscan

" - クリップボード共有（なぜか反映されない）
set clipboard=unnamed

" - Search words by caseignore
set ignorecase

set notitle


highlight Comment ctermfg=DarkCyan
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ===== Backspace key settings
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

" ===== Autocompletion settings
" Remap the tab key to select action with InsertTabWrapper
inoremap <C-Space> <C-N><C-P>

inoremap <expr> <C-j> pumvisible() ? "\<Down>" : "\<C-x>\<C-o>"
inoremap <expr> <C-k> pumvisible() ? "\<Up>" : "\<C-x>\<C-o>"
highlight Pmenu ctermbg=red
highlight PmenuSel ctermbg=blue ctermfg=white
highlight PmenuSbar ctermbg=white

" Define file type
au BufRead,BufNewFile *.sql set filetype=sql
au BufRead,BufNewFile *.case set filetype=html
au BufRead,BufNewFile *.vim set filetype=vim


" ==== Other key mappings
" search selected words by visual mode
" (ref.http://vim-users.jp/2009/11/hack104/)
"vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>


" History setting
cnoremap <C-n>          <Down>
cnoremap <C-p>          <Up>

" Cmd window settings
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

" Expand window
noremap <C-w>+ <C-w>10+
noremap <C-w>- <C-w>10-
noremap <C-<>< <C-w>10<
noremap <C->>> <C-w>10>

" ============== My commands ==============
" on syntastic.vim
function! SyntasticOff()
  let g:syntastic_enable_signs=0
  let g:syntastic_echo_current_error=0
endfunction
command! SyntasticOff :call SyntasticOff()

" off syntastic.vim
function! SyntasticOn()
  let g:syntastic_enable_signs=1
  let g:syntastic_echo_current_error=1
endfunction
command! SyntasticOn :call SyntasticOn()

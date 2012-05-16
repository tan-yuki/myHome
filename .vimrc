syntax on
filetype plugin on
filetype indent on

" ===== Insert template
autocmd BufNewFile *.php  0r   $HOME/.vim/template/php.txt
autocmd BufNewFile *.html 0r   $HOME/.vim/template/html.txt
autocmd BufNewFile *.js   0r   $HOME/.vim/template/javascript.txt

" ===== Open a file with pre-modified point
au BufWritePost * mkview
autocmd BufReadPost * loadview

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
set fileencodings=utf-8,sjis,cp932

" ===== Basic settings
" - show line number
set nu

" - visible empty chars
set list
set listchars=tab:>.,trail:-,eol:$,nbsp:%

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

" ===== For Auto completion by Tab key
" let g:neocomplcache_enable_at_startup = 1
" function InsertTabWrapper()
"     if pumvisible()
"         return "\<c-n>"
"     endif
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k\|<\|/'
"         return "\<tab>"
"     elseif exists('&omnifunc') && &omnifunc == ''
"         return "\<c-n>"
"     else
"         return "\<c-x>\<c-o>"
"     endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" ==== for vimdiff setting
set diffopt-=filler
hi DiffAdd    ctermfg=black   ctermbg=lightblue
hi DiffDelete ctermfg=black   ctermbg=lightmagenta
hi DiffChange ctermfg=black   ctermbg=lightgray
hi DiffText   ctermfg=black   ctermbg=lightcyan


" ===== Normarl mode key bind setting
nmap <F8> :TrinityToggleAll<CR>
nmap <F9> :TrinityToggleTagList<CR>
nmap <F10> :TrinityToggleNERDTree<CR>
" for move split window
nmap <C-w><l> <C-w><C-l><CR>
nmap <C-w><h> <C-w><C-h><CR>



" ===== Submode settings
" == Resize split line
"call submode#enter_with('resize_split_line', 'n', '', '<C-w><lt>', '<C-w><lt>');
"call submode#enter_with('resize_split_line', 'n', '', '<C-w>', '<C-w><lt>');
"call submode#enter_with('resize_split_line', 'n', '', '<C-w><lt>', '<C-w><lt>');
"call submode#enter_with('resize_split_line', 'n', '', '<C-w><lt>', '<C-w><lt>');


" ===== FuzzyFinder settings
" Tabs
nnoremap <Space>t t
nnoremap <Space>T T
nnoremap t <Nop>
nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> tk :<C-u>tabclose<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>

" FuzzyFinder.vim
nnoremap <Space>f f
nnoremap <Space>F F
nnoremap f <Nop>
nnoremap <silent> fb :<C-u>FuzzyFinderBuffer!<CR>
nnoremap <silent> ff :<C-u>FuzzyFinderFile! <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nnoremap <silent> fm :<C-u>FuzzyFinderMruFile!<CR>
nnoremap <silent> tb :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderBuffer!<CR>
nnoremap <silent> tf :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderFile! <C-r>=expand('#:~:.')[:-1-len(expand('#:~:.:t'))]<CR><CR>
nnoremap <silent> tm :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderMruFile!<CR>


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


" ==== Other key mappings
" search selected words by visual mode
" (ref.http://vim-users.jp/2009/11/hack104/)
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

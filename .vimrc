syntax on
filetype on
filetype plugin on
filetype indent on

set backupskip=/tmp/*,/private/tmp/*

" ===============================
" ===== Environment settings ====
" ===============================
set nocompatible

" - not using tab
set expandtab

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

" - Not show line number
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

" - 常にタブラインを表示
set showtabline=2

" - 常に下2行開けておく
set laststatus=2

" ==== tabs

" The prefix key.
nnoremap [Tag]   <Nop>
nmap t [Tag]

" Tab jump
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor


nnoremap [Tag]t  :tabedit<CR>
nnoremap [Tag]n  :tabNext<CR>
nnoremap [Tag]p  :tabprevious<CR>
nnoremap [Tag]q  :tabclose<CR>
nnoremap [Tag]l  :tabs<CR>



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
NeoBundle 'surround.vim'
NeoBundle 'mru.vim'
NeoBundle 'hrp/EnhancedCommentify'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'hekyou/vim-rectinsert'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tyru/vim-altercmd'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rhysd/neco-ruby-keyword-args'
NeoBundle 'FuzzyFinder'
NeoBundle 'groenewege/vim-less'
NeoBundle 'jiangmiao/simple-javascript-indenter.git'
NeoBundle 'sjl/gundo.vim.git'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'taglist.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-powerline'
"NeoBundle 'stephenmckinney/vim-solarized-powerline'
"NeoBundle 'bling/vim-airline'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'gregsexton/gitv'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mattn/habatobi-vim'
NeoBundle 'arnaud-lb/vim-php-namespace'
NeoBundle 'fuenor/qfixgrep'
"NeoBundle 'thinca/vim-splash'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'vim-scripts/SQLUtilities'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'goldfeld/vim-seek'
NeoBundle 'deris/vim-duzzle'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'gregsexton/gitv'
NeoBundle 'Align'
NeoBundle 'superbrothers/vim-quickrun-markdown-gfm'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'nono/vim-handlebars'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

set rtp+=~/.vim/bundle/powerline/bindings/vim
set noshowmode

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

filetype plugin indent on

" ==== neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1    " on neocomplcache setting
let g:neocomplcache_enable_smart_case = 1    " case ignore
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_max_list = 20            " max size of menu list
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_underbar_completion = 1

" dictionaries for neocomple
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'php'        : $HOME . '/.vim/dict/php.dict',
    \ 'javascript' : $HOME . '/.vim/dict/javascript.dict',
    \ }

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <C-Space> <C-N><C-P>
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>"
inoremap <expr> <C-k> pumvisible() ? "\<Up>" : "\<C-x>\<C-o>"
highlight Pmenu ctermbg=blue
highlight PmenuSel ctermbg=red ctermfg=white
highlight PmenuSbar ctermbg=white

" ==== neosnippet
"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Directory of snippet setting files
let g:neosnippet#snippets_directory='~/.vim/snippets'


" ==== rect insert
vmap <silent> <leader>vp <Plug>:RectInsert -i

" ===== Simple-Javascript-Indenter
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

" ===== Simple-Javascript-Indenter settings
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1


" ===== taglist.vim
set tags=tags
let g:Tlist_Ctags_Cmd = "/usr/local/Cellar/ctags/5.8/bin/ctags"

" ===== ref.vim
nmap ,rp :Ref phpmanual<Space>
let g:ref_phpmanual_path = $HOME . "/.vim/ref/php/"

" ===== quickrun
let g:quickrun_config = {}

" ===== gitv
autocmd FileType gitv call s:my_gitv_settings()
function! s:my_gitv_settings()
  setlocal iskeyword+=/,-,.
  nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
  
  nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
  nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
  
  nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
endfunction

function! s:gitv_get_current_hash()
  return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
endfunction

autocmd FileType git setlocal nofoldenable foldlevel=0
function! s:toggle_git_folding()
  if &filetype ==# 'git'
    setlocal foldenable!
  endif
endfunction

" ===== ctrlp.vim
let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く

" ===== SQLUtilities
vmap <silent>sf <Plug>SQLU_Formatter<CR>

" ===== vim-splash.vim
"let g:splash#path = $HOME . "/.vim/splash/kabenaguri.txt"

" ===== unite.vim
nnoremap [unite] <Nop>
nmap <Leader>f [unite]

nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>

" vinarise
let g:vinarise_enable_auto_detect = 1

" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>

" unite-grepのバックエンドをagに切り替える
" http://qiita.com/items/c8962f9325a5433dc50d
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200
 
" unite-grepのキーマップ
" 選択した文字列をunite-grep
" https://github.com/shingokatsushima/dotfiles/blob/master/.vimrc
vnoremap ag y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

" ===== tagbar.vim
nmap <F8> :TagbarToggle<CR>

" ===== linediff
" １つ目に選択した行をタブページで開く
let g:linediff_first_buffer_command = 'tabnew'
" ２つ目に選択した行を垂直分割して新しいウィンドウで開く
let g:linediff_second_buffer_command = 'rightbelow vertical new'

" ===== vim-quickrun-markdown-gfm
let g:quickrun_config = {
\   'markdown': {
\     'type': 'markdown/gfm',
\     'outputter': 'browser'
\   }
\ }

" ==== Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" ========================
" ======= Some Tips ======
" ========================


" ==== Syntax highight
hi Comment ctermfg=gray
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ==== Define file type
au BufRead,BufNewFile *.sql  set filetype=sql
au BufRead,BufNewFile *.case set filetype=html
au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.vim  set filetype=vim
au BufRead,BufNewFile *.md   set filetype=markdown
au BufRead,BufNewFile *.scss set filetype=sass

" ==== Insert template
autocmd BufNewFile *.php  0r   $HOME/.vim/template/php.txt
autocmd BufNewFile *.html 0r   $HOME/.vim/template/html.txt
autocmd BufNewFile *.js   0r   $HOME/.vim/template/javascript.txt

" - open a file with pre-modified point
"au BufWritePost * mkview
"autocmd BufReadPost * loadview

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
noremap <C-w>+ 10<C-w>+
noremap <C-w>- 10<C-w>-
noremap <C-<>< 10<C-w><
noremap <C->>> 10<C-w>>

" ==== Not delete blank line
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <C-n> <Esc>oX<C-h>

" ==== vimdiff - dismiss white characters
"set diffopt=iwhite

" ==== Searchの色がとっても見にくいので変更
" IncSearchと一緒にする
highlight link TagListTagName TODO


" ========================================
"  color settings
" ========================================

set t_Co=256

" Popup menu
hi Pmenu ctermfg=white
hi PmenuSel ctermbg=lightcyan ctermfg=black



" ========================================
"  key bindings
" ========================================
noremap <C-w>L 9999<C-w>>
noremap <C-w>R 9999<C-w><


" ========================================
"  original functions
" ========================================

" PHPRef *func
" PHP関数を調べる
" 
" @param func    調べたいPHP関数
" 
function! PHPRef(func)
  call Ref phpmanual a:func)
endfunction
command! -nargs=1 PHPRef call PHPRef(<q-args>)

" json parser
" http://qiita.com/tekkoc@github/items/324d736f68b0f27680b8
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
  if 0 == a:0
    let l:arg = "."
  else
    let l:arg = a:1
  endif
  execute "%! jq \"" . l:arg . "\""
endfunction

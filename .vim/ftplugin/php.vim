"set omnifunc=phpcomplete#CompletePHP
"let php_folding=1
"au Syntax php set fdm=syntax
"
"source ~/.vim/php-doc.vim
"inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
"nnoremap <C-P> :call PhpDocSingle()<CR>
"vnoremap <C-P> :call PhpDocRange()<CR> 

inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

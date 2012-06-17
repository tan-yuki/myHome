" Load this module only once.
if exists('loaded_neko')
    finish
endif
let loaded_neko = 1

" neko template
let g:template_neko = $HOME . '/.vim/bundle/neko/neko.tmpl'
let g:tmp_neko = '/tmp/nekovim'


" Display an error message in the message area.
function! s:errormsg(msg)
    redraw
    echohl ErrorMsg
    echomsg a:msg
    echohl None
endfunction

function! s:load(filename)
  if filereadable(a:filename)
    exe "read " . fnamemodify(a:filename, ":p")
    :set readonly
  else
    call s:errormsg('cannot read ' . a:filename)
  endif
endfunction

" draw neko from template
function! s:draw_neko()
  " show new window
  call s:showNewWindow()

  " draw neko
  call s:load(g:template_neko)

  :%g/^$/norm dd

  " slide neko
"  call s:slide()
endfunction

" delete left line
function! s:deleteLeftLine()
    norm gg0\<CR\>vGd
endfunction

" show new window
function! s:showNewWindow()
  " delete if exists
  if filereadable(g:tmp_neko)
      silent! exe '! rm -f ' . g:tmp_neko
  endif

    " make new file
  silent! exe '! touch ' . g:tmp_neko

  sp
  norm <CR>w
  edit g:tmp_neko
endfunction

" slide
function! s:slide()
  let start = reltime()
  while !search("^$", 'n')
    let end = reltime()
    let interval = reltime(start, end)
    if interval[1] > 5000
      silent! call s:deleteLeftLine()
      let start = end
    endif
  endwhile
  echo 'Finished'
endfunction



" ==== Bind
if !exists(":DrawNeko")
    command DrawNeko :call <SID>draw_neko()
endif


finish

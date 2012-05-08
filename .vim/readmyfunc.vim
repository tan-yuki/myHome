
" ============================================================================
" File:        readmyfunc.vim
" Description: read my functions
"              You have to make ~/.vim/myfunc/ directory and make your setting file
"              named *.vim . If you define your functions in this file, you
"              have to name this function same as this file name excluded
"              '.vim', and capitalize first letter.
" Maintainer:  Yuki, Tanaka <a0673040 at gmail dot com>
" Last Change: 1 Feb, 2012
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================


" read my functions
function! s:ReadMyFunctions()
	let MY_FUNC_HOME = "~/.vim/myfunc/"
	if isdirectory(MY_FUNC_HOME)
		" == access to each file
		while call itehasnext()
			let filename = itenext()
			if matchend(filename, ".vim")
echo filename
				source filename
				"==== change for commandname
				"==== filename: xxxx.vim -> commandname: Xxxx
				let command_name = substitute(filename, ".vim", "")
				let command_name = toupper(strpart(command_name, 0, 1)) . strpart(command_name, 1)
echo command_name
				execute "command! " . command_name " " . command_name . "()"
			endif
		endwhile
	endif
endfunction

function! s:itehasnext()

endfunction


call ReadMyFunctions()



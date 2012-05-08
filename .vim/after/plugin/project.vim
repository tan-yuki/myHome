"$HOME/.vim/after/plugin/project.vim
if getcwd() != $HOME
	if filereadable(getcwd() . "/.vimprojects")
		Project .vimprojects
	endif
endif

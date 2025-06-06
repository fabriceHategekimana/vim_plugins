function! Mojo()
	set syntax=python
	command! Run term mojo %
	command! Build term mojo build %
endfunction

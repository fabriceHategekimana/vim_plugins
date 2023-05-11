function! Julia()
	let g:extention= "jl"
	set nospell
	nnoremap <buffer> <silent> <F3> yip:call PasteToPane()<CR>
	nnoremap <buffer> <silent> <F4> :call TmuxSplit("julia", "-v")<CR>
	nnoremap <buffer> <silent> <F5> :term julia %<CR>
	xnoremap <buffer> <silent> <F5> y:call PasteToPane()<CR>

	command! -nargs=1 Search execute "vimgrep /<args>/j **.jl" | copen

	function! InferPluginsFunction()
		tabnew ~/vim/julia-client/plugin/julia-client.vim
	endfunction
endfunction

function! Swift()
	let g:extention = "swift"
	nnoremap <buffer> <F3> yip:call PasteToPane()<CR>
	nnoremap <buffer> <F4> :call TmuxSplit("swift", "-v")<CR>	
	nnoremap <buffer> <F5> :term swift %<CR>	
	nnoremap <buffer> év yiw:call PasteToPane()<CR>
	nnoremap <buffer> éb :term swift build<CR>
	"nnoremap <buffer> ét :term ++shell ~/sh/swifttest<CR>
	nnoremap <buffer> ét :term ++shell swift test<CR>
	nnoremap <buffer> éc I//<Esc>
	nnoremap <buffer> éd ^xx
	xnoremap <buffer> éc <C-V>I//<Esc> 
	inoremap vari Variable(named: "")<Left><Left>

	command! -nargs=1 Search execute "vimgrep /<args>/j **.swift" | copen

	function! InferPluginsFunction()
		tabnew ~/vim/swift-client/plugin/swift-client.vim
	endfunction
endfunction

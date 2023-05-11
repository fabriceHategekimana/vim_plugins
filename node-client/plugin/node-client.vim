
function! Nodejs()
	set nospell
	nnoremap <buffer> <F5> :term node %<CR>
	nnoremap <buffer> <F4> :call TmuxSplit("node -i", "-v")<CR>
	xnoremap <buffer> <F5> y:call PasteToPane()<CR>
	nnoremap <buffer> év yiw:call PasteToPane()<CR>
	nnoremap <buffer> éc I//<Esc>
	nnoremap <buffer> éd 0xx
	xnoremap <buffer> éc <C-V>0I//<Esc>
	xnoremap <buffer> éd <C-V>0ld
	inoremap <buffer> print console.log();<Left><Left>
	inoremap <buffer> function function (){}<Left><CR><CR><Up><Up><C-O>f(

	command! -nargs=1 Search execute "vimgrep /<args>/j **.js" | copen

	function! InferPluginsFunction()
		tabnew ~/vim/node-client/plugin/node-client.vim
	endfunction
endfunction


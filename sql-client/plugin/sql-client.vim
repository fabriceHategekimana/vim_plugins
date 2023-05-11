function! Sql()
	let g:extention= "sql"
	set nospell
    
    "Console
	nnoremap <buffer> <silent> <F4> :call TmuxSplit("sqlite3", "-v")<CR>
    
	nnoremap <buffer> <F3> yip:call PasteToPane()<CR>
	xnoremap <buffer> <F5> y:call PasteToPane()<CR>
	nnoremap <buffer> <silent> éc I-- <Esc>
	nnoremap <buffer> <silent> éd ^3x
	xnoremap <buffer> <silent> éc :normal I-- <CR>
	xnoremap <buffer> <silent> éd :normal ^3x<CR>

	command! -nargs=1 Search execute "vimgrep /<args>/j **.sql" | copen

	function! InferPluginsFunction()
		tabnew ~/vim/sql-client/plugin/sql-client.vim
	endfunction
endfunction

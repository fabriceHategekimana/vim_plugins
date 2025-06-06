function! Typst()
	set nospell

	command! Run !typst compile % 
	command! Make !/home/fabrice/sh/multiplexer floating new --command make --fixed
	nnoremap éc I//<Esc>
	nnoremap éd ^xx
	xnoremap éc :norm! I//
	xnoremap éd :norm! ^dd

	command! -nargs=1 Search execute "vimgrep /<args>/j **.js" | copen

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/typst-client/plugin/typst-client.vim
	endfunction
endfunction


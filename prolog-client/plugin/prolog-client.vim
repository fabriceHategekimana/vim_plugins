function! Prolog()
	command! Run call TmuxSplit("prolog ".expand("%"), "-v") 
	command! Console call TmuxSplit("prolog", "-v")
	command! -nargs=0 -range Send <line1>,<line2>yank a | call PasteToPane()
	nnoremap <buffer> <silent> <Return> yy:call PasteToPane()<CR>

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/prolog-client/plugin/prolog-client.vim
	endfunction
endfunction

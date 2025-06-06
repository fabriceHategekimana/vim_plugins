function! Nu()
	set syntax=bash
	command! Run term nu %
	command! Test term nu -c "use std testing run-tests; run-tests"
	command! Hey term /home/fabrice/sh/hey %

	nnoremap <buffer> <silent> <Return> yy:call PasteToPane()<CR>
	xnoremap <buffer> <silent> <Return> y:call PasteToPane()<CR>


	"commentaire en mode en mode sélection
	nnoremap <buffer> éc :normal I#<CR>
	xnoremap <buffer> éc :normal I#<CR>

	"supression de commenaire en mode normal
	nnoremap <buffer> éd ^x 
	xnoremap <buffer> éd :normal ^x<CR>

	nnoremap <buffer> fs F"i$<Esc>

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/nu-client/plugin/nu-client.vim
	endfunction

endfunction

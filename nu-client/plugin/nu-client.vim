function! Nu()
	set syntax=bash
	command! Run term nu %

	"commentaire en mode en mode sélection
	nnoremap <buffer> éc :normal I#<CR>
	xnoremap <buffer> éc :normal I#<CR>

	"supression de commenaire en mode normal
	nnoremap <buffer> éd ^x 
	xnoremap <buffer> éd :normal ^x<CR>

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/nu-client/plugin/nu-client.vim
	endfunction

endfunction

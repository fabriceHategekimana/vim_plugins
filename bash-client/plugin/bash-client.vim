function! Sh()
	set nospell
	let g:extention="sh"
	"commentaire en mode normal
	nnoremap <buffer> éc ^i#<Esc><CR>
	"commentaire en mode en mode sélection
	xnoremap <buffer> éc :normal I#<CR>
	"supression de commenaire en mode normal
	nnoremap <buffer> éd ^x 
	"supression de commentaire en mode sélection
	xnoremap <buffer> éd :normal ^x<CR>
	"crochet particuliers
	inoremap <buffer> [ []<Left>
	"ouvrir un interpréteur bash
	nnoremap <buffer> <F4> :call TmuxSplit("", "-v")<cr>
	"touche pour lancer le script
	nnoremap <buffer> <F5> :!bash %<CR>
	command! -nargs=0 Run term bash %
	"touche pour lancer un bout du script
	xnoremap <buffer> <silent> <F5> y:call PasteToPane()<CR>
	"touche pour exécuter un bloc de code dans un interpréteur
	nnoremap <buffer> <F3> yip:call PasteToPane()<CR>

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/bash-client/plugin/bash-client.vim
	endfunction

	command! -nargs=1 Search execute "vimgrep /<args>/j **.bash" | copen
endfunction

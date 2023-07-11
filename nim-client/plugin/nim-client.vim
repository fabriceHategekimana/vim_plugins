
function! Nim()
	"ALEDisable
	set nospell
	let g:extention="py"

	"with the console
	nnoremap <buffer> <silent> <F3> yip:call PasteToPane()<CR>
	xnoremap <buffer> <silent> <F5> y:call PasteToPane()<CR>
	nnoremap <buffer> <silent> <Return> yy:call PasteToPane()<CR>
	command! -nargs=0 -range Send <line1>,<line2>yank a | call PasteToPane()
	command! -nargs=0 -range Fix !black % | e


	nnoremap <buffer> éc ^i# <Esc><CR>
	xnoremap <buffer> éc :normal I# <CR>
	xnoremap <buffer> éd :normal ^xx<CR>
	nnoremap <buffer> éd ^xx 

	command! -nargs=0 Console call TmuxSplit("inim", "-v")
	command! -nargs=0 Run :term nim c -r --verbosity:0 %
	command! -nargs=0 Test :term testament all

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/nim-client/plugin/nim-client.vim
	endfunction
endfunction

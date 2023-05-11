
function! RunR()
	call PasteToPane()
endfunction

function! RLike()
	let g:extention="r"
	inoremap <buffer> dataframe data.frame()<Left>

	nnoremap <buffer> éc I#<Esc>
	xnoremap <buffer> éc :normal! I#<CR>
	xnoremap <buffer> éd :normal! ^x<CR>
	nnoremap <buffer> ée :call SendToPane("ls.str()")<CR>
	nnoremap <buffer> éH yiw:call TmuxSplit('R -e "help('.@".')"', '-h')<CR>
	nnoremap <buffer> éh yiw:call SendToPane('help('.@".')')<CR>
	command! -nargs=0 Run term Rscript %

	nnoremap <buffer> <silent> <F3> yip:call PasteToPane()<CR>
	nnoremap <buffer> <silent> <F4> :call TmuxSplit("R", "-v")<CR>
	command! -nargs=0 Console call TmuxSplit("R", "-v")
	nnoremap <buffer> év yiw:call PasteToPane()<cr>
	nnoremap <buffer> éog :!myfeh -R 10 images/ &<cr>
	nnoremap <buffer> <silent> <Return> yy:call PasteToPane()<CR>
	command! -nargs=0 -range Send <line1>,<line2>yank a | call PasteToPane()

	command! -nargs=1 Search execute "vimgrep /<args>/j **.r" | copen

	nmap <F2> ggVG<F5>

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/r-client/plugin/r-client.vim
	endfunction
endfunction


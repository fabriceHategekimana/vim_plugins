function! Coq()
	setfiletype coq
	nnoremap <buffer> <silent> <F3> yip:call PasteToPane()<CR>
	nnoremap <buffer> <silent>  0y$:call PasteToPane()<CR>
	nnoremap <buffer> <silent> <F4> :call TmuxSplit("fabcoq", "-v")<CR>
	command! Console call TmuxSplit("fabcoq", "-v")
	nnoremap <buffer> <silent> é<F5> :term coqc %<CR>
	nnoremap <buffer> <silent> <F5> yy:call PasteToPane()<CR>
	xnoremap <buffer> <silent> <F5> y:call PasteToPane()<CR>
	nnoremap <buffer> <silent> éc  I(*<Esc>A*)<Esc>
	command! -nargs=0 -range Send <line1>,<line2>Borrow tmux send-keys -t 1 '%' Enter

	"abort
	command! -nargs=0 Abort call SendToPane("Abort.")
	"Show
	command! -nargs=0 Goal call SendToPane("Show.")
	command! -nargs=1 Show call SendToPane("Show ".<args>.".")
	command! -nargs=0 Clear call SendToPane("clear")
	nnoremap <buffer> ééa :call SendToPane("Abort.")<CR>

	inoremap <buffer> comp Eval compute in .<Left>
	inoremap <buffer> print Print .<Left>
	inoremap <buffer> show Show Proof.<Left>
	inoremap <buffer> check Check .<Left>
	nnoremap <buffer> éés :call SendToPane("Show Proof.")<CR>
	nnoremap <buffer> éér yiw:call SendToPane("Reset ".@".".")<CR>

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/coq-client/plugin/coq-client.vim
	endfunction

	command! -nargs=1 Search execute "vimgrep /<args>/j **.v" | copen
endfunction

"Eval compute in succ zero.

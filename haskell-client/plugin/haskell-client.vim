function! Haskell()
	let g:extention= "hs"
	set nospell
	set expandtab
	"Compilation et débugage
    
    "Console
    "command! -nargs=0 Console call TmuxSplit("ghci", "-v")
	nnoremap <buffer> <silent> <F4> :call TmuxSplit("ghci", "-v")<CR>
    
    "Run
    "command! -nargs=0 Run term runhaskell %
	nnoremap <buffer> <silent> <F5> :term runhaskell %<CR>
	nnoremap <buffer> <silent> é<F5> :term ghc -o %:r %<CR>
	command Run term ++shell ghc % && ./%:r

	nnoremap <buffer> <silent> <F3> yip:call PasteToPane()<CR>
	xnoremap <buffer> <silent> <F5> y:call PasteToPane()<CR>
	nnoremap <buffer> <silent> éc I--<Esc>
	nnoremap <buffer> <silent> éd ^xx
	xnoremap <buffer> <silent> éc :normal I--<CR>
	xnoremap <buffer> <silent> éd :normal ^xx<CR>

	command! -nargs=1 Search execute "vimgrep /<args>/j **.hs" | copen
	function! InferPluginsFunction()
		tabnew ~/vim_plugins/haskell-client/plugin/haskell-client.vim
	endfunction
endfunction

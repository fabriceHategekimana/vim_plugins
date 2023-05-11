function! Latex()
	set nospell
	let g:extention="tex"

	command! -nargs=1 Search execute "vimgrep /<args>/j **.tex **.txt" | copen

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/latex-client/plugin/latex-client.vim
	endfunction
endfunction

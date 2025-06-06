function! TypeTaking()
	let g:extention="tt"
	set syntax=rust
	command -nargs=1 Type g/: <args>/p
	command -nargs=0 Types g/^type /p

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/typetaking-client/plugin/typetaking-client.vim
	endfunction
endfunction

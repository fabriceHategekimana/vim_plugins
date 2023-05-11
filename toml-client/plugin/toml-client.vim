function! Toml()
	set nospell

	command! Format %s/\(\d\d\)-\(\d\d\)-\(\d\d\d\d\)/\3-\2-\1 %s/ \(\d\d\):\(\d\d\) / 00:\1:\2 /

	let g:extention="toml"
	function! InferPluginsFunction()
		tabnew ~/vim_plugins/bash-client/plugin/bash-client.vim
	endfunction

	command! -nargs=1 Search execute "vimgrep /<args>/j **.bash" | copen
endfunction

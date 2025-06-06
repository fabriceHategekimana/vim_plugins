
function! Php()
	set nospell
	let g:extention="php"

	command! Run term php %

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/php-client/plugin/php-client.vim
	endfunction

endfunction


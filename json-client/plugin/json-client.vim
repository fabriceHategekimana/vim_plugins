function! Json()
	command! Run !core_calculus run 
	command! -nargs=1 Add !core_calculus add <args>

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/json-client/plugin/json-client.vim
	endfunction
endfunction

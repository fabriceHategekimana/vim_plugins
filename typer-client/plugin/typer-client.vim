function! Typer()
	set syntax=rust
	command! -nargs=0 Run split | term typr % 

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/typer-client/plugin/typer-client.vim
	endfunction
endfunction

function! AddRulesFunction()
	call SendToPane("add if A member B then B is type")
endfunction

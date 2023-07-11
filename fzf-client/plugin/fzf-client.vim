"FZF
function! FzfFunction(command)
	execute "silent !".a:command." | fzf > .FzfTemp" | redraw!
	return substitute(system("cat .FzfTemp"),"\n","","")
	execute "!rm .FzfTemp"
endfunction

function! FZF(commandbash, commandvim, formating)
	let cmdbash=escape(a:commandbash, '!') 
	let format=escape(a:formating, '!') 
	silent execute '!myfzf "'.cmdbash.'" "'.format.'"'
	silent execute substitute(a:commandvim, "_fzf_", @+, "")
endfunction

" Plugins
function! RofiFunction(command)
	let selectedElement=system(a:command." | rofi -dmenu")
	return substitute(selectedElement, "\n", "","")
endfunction

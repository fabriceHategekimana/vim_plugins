command! Plugin tabnew /home/fabrice/vim_plugins/text-client.vim

syntax match myComment "#.*"
highlight myComment ctermfg=0 guifg=Magenta

function BdF(name)
	echo a:name
	if bufexists(a:name)
		exec "bw ".a:name
	endif
endfunction

command! -range Question call BdF("questions.txt") | <line1>,<line2>w >> questions.txt

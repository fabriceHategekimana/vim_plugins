function! CSharp()
	let g:extention= "cs"
	set nospell
	xnoremap <buffer> éc :normal I//<CR>
	xnoremap <buffer> éd :normal ^xx<CR>
	nnoremap <buffer> édc ^xx
	nnoremap <buffer> éc ^i//<Esc>$<CR>
	"Compilation et débugage
	command! Run term dotnet run
	command! Build term dotnet build

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/csharp-client/plugin/csharp-client.vim
	endfunction
	command! -nargs=1 Search execute "vimgrep /<args>/j **.h **.c" | copen
endfunction

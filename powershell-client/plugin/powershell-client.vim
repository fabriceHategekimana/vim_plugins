
function! Powershell()
	let g:extention="ps1"
	nnoremap <F5> :term pwsh %<CR>

	command! -nargs=1 Search execute "vimgrep /<args>/j **.ps1" | copen

	function! InferPluginsFunction()
		tabnew ~/vim/powershell-client/plugin/powershell-client.vim
	endfunction
endfunction

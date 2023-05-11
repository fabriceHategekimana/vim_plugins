function! Kotlin()
	let g:extention="kt"

	nnoremap <F5> :term ++shell kotlinc % -include-runtime -d %:r.jar && java -jar %:r.jar<CR>
	
	command! -nargs=1 Search execute "vimgrep /<args>/j **.kt" | copen
	function! InferPluginsFunction()
		tabnew ~/vim/kotlin-client/plugin/kotlin-client.vim
	endfunction

	function! PrintFileName(channel, message)
		echom a:message
	endfunction

	function! MyFzf()
		let buf = term_start("fzf", {"close_cb": "PrintFileName"})
	endfunction

	command! MF :call MyFzf()
endfunction

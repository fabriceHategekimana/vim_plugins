function! Puml()
	nnoremap <buffer> <F5> :PlantumlOpen<CR>
	command! Run PlantumlOpen
	nnoremap <buffer> éc I'<Esc>
	nnoremap <buffer> éd 0x<Esc>

	command! -nargs=0 Save PlantumlSave
	command! -nargs=0 Open execute "!feh ".expand("%:r").".png &"
	command! -nargs=0 Close !plant_uml_image close
	command! -nargs=1 Search execute "vimgrep /<args>/j **.puml" | copen
	command! -nargs=0 Update w | Save

	nnoremap <buffer> <silent> <Return> yy:call PasteToPane()<CR>
	command! -nargs=0 -range Send <line1>,<line2>yank a | call PasteToPane()

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/puml-client/plugin/puml-client.vim
	endfunction

endfunction

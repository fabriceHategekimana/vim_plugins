function! Markdown()
	" Markdown commands
	let g:extention="markdown"
	set nospell
	set spelllang=fr_ch,en_us

	" Miscellanious
	command! -nargs=+ Template r /home/fabrice/note/templates/<args>
	command! -nargs=0 Quotidien r /home/fabrice/note/templates/quotidien.md
	command! -nargs=0 Date .!/home/fabrice/sh/my_date_md
	command! -nargs=0 -range Display <line1>,<line2>w! old/display.md | !bash ~/sh/compmd old/display.md texv
	
	" Dépendances
	call EditParams()
	call VimWikiParams()
	call Navigation()
	
	" For notebook
	command! -nargs=0 Jupyter call Python() 
	command! -nargs=0 Cell .!/home/fabrice/sh/python_cell
	
	" Marquage de texte
	xnoremap <buffer> éb di****<Esc>2<Left>p
	nnoremap <buffer> ém Bi`<Esc>Ea`<Esc>
	xnoremap <buffer> ém di``<Esc><Left>p

	"trouver le synonyme d'un mot
	nnoremap <buffer> ésy yiw:execute 'term python3 /home/fabrice/script/synonymo.py '.@"<CR>
	" trier liste
	command! Sort VimwikiRenumberList
	"ouverture du fichier
	nnoremap <buffer> éop yiW:Borrow "!xdg-open ".@"." &"<CR>
	
	"predicat
	nnoremap <buffer> <silent> <F3> yip:call PasteToPane()<CR>
	nnoremap <buffer> <F4> :call TmuxSplit("predicat", "-v")<CR>
	nnoremap <buffer> <F5> :!bash ~/sh/compmd %<Space>
	xnoremap <buffer> <silent> <F5> y:call PasteToPane()<CR>
	nnoremap <buffer> <F7> :!zathura %:t:r.pdf &<cr>
	nnoremap <buffer> <F9> :call LinkImage()<CR>

	"commentaires
	nnoremap <buffer> éc I[//]: # <Esc>

	command! -nargs=0 Note normal! i::: notes<CR><CR>:::<Up>
	command! -nargs=0 Slide normal! i#<CR><CR>::: notes<CR><CR>:::<CR><CR>----<CR>

	command! -nargs=0 Toc Vista toc
	command! -nargs=0 Image call SelectImage()
	command! -nargs=0 Line normal 25i-
	command! -nargs=* Search Rg <args>
	command! Programme r /home/fabrice/note/templates/programme.md
	
	function! InferPluginsFunction()
		tabnew ~/vim_plugins/markdown-client/plugin/markdown-client.vim
	endfunction

	"specific commands for the chants database
	command! -nargs=0 -range Openchant .yank x | execute substitute("e lab/datas/chants/".@x.".toml", "\n", "", "")
	command! -nargs=0 -range Oc Openchant
endfunction

function! SelectImage()
	call FZF("tree -if images", 'norm! "+p', "![_fzf_](_fzf_)")
endfunction

function! VimWikiParams()
	nnoremap <buffer> ét :VimwikiToggleListItem<CR>
	nnoremap <buffer> évp :VimwikiVSplitLink<CR>
	nnoremap <buffer> éru <Plug>VimwikiRenumberList 
	nnoremap <buffer> éta :VimwikiTable 4 4<CR>
endfunction

function! EditParams()
	command! -nargs=0 Edit norm! 0y$:execute "!markdown_edit '\\".@"."'"<CR>
	command! -nargs=0 View norm! 0y$:execute "!xdg-open ".@"." &"<CR>
	command! -nargs=1 NewImage .!/home/fabrice/sh/new_image <args>
endfunction

function! GetRef(args)
	if len(args) == 0
		normal! yiw
		execute "Rg ".@"
	else
		execute "Rg ".a:args
	endif
endfunction

function! GetRef2()
	normal! yiw
	execute "Rg ".@"
endfunction

function! Navigation()
	"command! Refe call GetRef(<args>)
	command! -nargs=0 Ref call GetRef2()
endfunction

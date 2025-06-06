function! LProlog()
	set filetype=lprolog
	"syntax
	source /usr/share/nvim/runtime/syntax/prolog.vim
	
	"Raccourci pour le langage python
	nnoremap <buffer> éc ^i% <Esc><CR>
	xnoremap <buffer> éc :normal I% <CR>
	xnoremap <buffer> éd :normal ^xx<CR>
	nnoremap <buffer> éd ^xx 

	command! Console call TmuxSplit("prolog ".expand("%"), "-v") 
	command! Run call SendToPane("consult(\"".expand("%")."\").")
	command! SingleTest call SendToPane("run_tests.")
	command! Test execute "Run" | execute "SingleTest"
	command! -nargs=0 -range Send <line1>,<line2>yank a | call PasteToPane()
	nnoremap <buffer> <silent> <Return> yy:call PasteToPane()<CR>

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/prolog-client/plugin/prolog-client.vim
	endfunction

	"elpi
	syn match   lprologIdentifier  "\<\l[-a-zA-Z\.+*/\\^<>=`'~?@#$&!_]*\>"
	syn region  lprologClause start="^\<\l[-a-zA-Z\.+*/\\^<>=`'~?@#$&!_]*\>" end=" \|:-\|\."
	syn match lprologClauseSymbols ":-"
	syn match lprologClauseSymbols "\."
	hi def link lprologClauseSymbols Type

	syn keyword elpiKeyword mode macro type pred namespace rule constraint uvar shorten
	syn match elpiKeyword ":before"
	syn match elpiKeyword ":after"
	syn match elpiKeyword ":name"
	syn match elpiMacro "@\(\w\|-\)\+"
	syn match elpiSpill "{"
	syn match elpiSpill "}"
	syn region elpiQuotation start="{{" end="}}" contains=@elpiAntiQuotation
	hi def link elpiKeyword Keyword
	hi def link elpiMacro Special
	hi def link elpiSpill Special
endfunction


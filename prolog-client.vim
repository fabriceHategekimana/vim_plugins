"syntax
source /usr/share/nvim/runtime/syntax/prolog.vim

"Raccourci pour le langage python
nnoremap <buffer> éc ^i% <Esc><CR>
xnoremap <buffer> éc :normal I% <CR>
xnoremap <buffer> éd :normal ^xx<CR>
nnoremap <buffer> éd ^xx 

command! Tracing call SendToPane("trace.") | call PasteToPane()
xnoremap <buffer> tra y:Tracing<CR>

command! Console !zrf2 prolog %  
command! Run call SendToPane("consult(\"".expand("%")."\").")
command! SingleTest call SendToPane("run_tests.")
command! Test execute "Run" | execute "SingleTest"
command! -nargs=0 -range Send <line1>,<line2>yank a | call PasteToPane()
nnoremap <buffer> <silent> <Return> yy:call PasteToPane()<CR>

function! InferPluginsFunction()
	tabnew ~/vim_plugins/prolog-client/plugin/prolog-client.vim
endfunction

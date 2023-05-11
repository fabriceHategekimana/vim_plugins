function! Scala()
	set nospell
	let gextention="scala"
	set makeprg=scalac\ %
	set efm=%f:%l:%m
	nnoremap <F5> :terminal ++shell scalac % && scala %:p:t:r<CR>
	"Commente une ligne
	nnoremap <buffer> éc ^i//<Esc>
	"Commente des lignes
	xnoremap <buffer> éc :normal I//<CR>
	"Enlève le commentaire sur une ligne"
	nnoremap <buffer> éd ^xx<Esc>
	"Enlève le commentaire sur une sélection de ligne"
	xnoremap <buffer> éd :normal ^xx<CR>

	"Pseudo snippet pour le print
	inoremap <buffer> print print()<Esc>i
	"Pseudo snippet pour faire une fonciton
	inoreabbrev <buffer> function public void (){<CR>}<Esc><Up>$Tda
	"Pseudo snippet pour faire un if
	inoreabbrev <buffer> if if(){<CR>}<Esc><Up>t)a
	"Pseudo snippet pour faire un else
	inoreabbrev <buffer> else	else{<CR>}<Up>
	"Pseudo snippet pour faire un while
	inoreabbrev <buffer> while while(){<CR>}<Esc><Up>t)a
	"Pseudo snippet pour faire un fore
	inoreabbrev <buffer> for for(int i= 0; i<len; i++){<CR>}<Up>

	command! -nargs=1 Search execute "vimgrep /<args>/j **.scala" | copen

	function! InferPluginsFunction()
		tabnew ~/vim/scala-client/plugin/scala-client.vim
	endfunction
endfunction

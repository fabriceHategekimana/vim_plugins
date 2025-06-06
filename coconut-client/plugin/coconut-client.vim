
function! Coconut()
	"ALEDisable
	set nospell
	let g:extention="coco"

	"with the console
	nnoremap <buffer> <silent> <F3> yip:call PasteToPane()<CR>
	xnoremap <buffer> <silent> <F5> y:call PasteToPane()<CR>
	nnoremap <buffer> <silent> <Return> yy:call PasteToPane()<CR>
	command! -nargs=0 -range Send <line1>,<line2>yank a | call PasteToPane()

	"Raccourci pour le langage python
	nnoremap <buffer> éc ^i# <Esc><CR>
	xnoremap <buffer> éc :normal I# <CR>
	xnoremap <buffer> éd :normal ^xx<CR>
	nnoremap <buffer> éd ^xx 
	"ajouter le f du f string
	nnoremap <buffer> fs F"if<Esc>
	"trouve l'ensemble des variables invoquées jusqu'ici
	nnoremap <buffer> éfm :call SendToPane("from functionModule import *")<cr>
	"trouve les variables et les fonctions
	nnoremap <buffer> éw :call SendToPane("whos")<cr>
	"trouve les fonctions
	nnoremap <buffer> éwf :call SendToPane("whos function")<cr>
	"trouve les Dataframes
	nnoremap <buffer> éwd :call SendToPane("whos DataFrame")<cr>
	"trouve les arrays
	nnoremap <buffer> éwa :call SendToPane("whos ndarray")<cr>
	"affiche la gallerie 1
	nnoremap <buffer> éoG :!firefox images/. &<cr>
	"affiche la gallerie 2
	nnoremap <buffer> éog :!myfeh -R 10 images/ &<cr>
	"connaître le contenu d'un variable simple
	nnoremap <buffer> év yiw:call PasteToPane()<cr>
	"connaître le 'head' d'un dataframe
	nnoremap <buffer> éh yiw:call SendToPane(@".".head()")<cr>
	"connaître le 'shape' d'un vecteur
	nnoremap <buffer> és yiw:call SendToPane(@".".shape")<cr>
	"ouvrir une image (mise sous la forme de lien)
	nnoremap <buffer> éoi yy:call OpenImage()<CR>
	nnoremap <buffer> éoi yy:call OpenImage()<CR>
	"regarde le max d'un array
	command! -nargs=0 Max call SendToPane("np.max(".@".")")
	"regarde le min d'un array
	command! -nargs=0 Min call SendToPane("np.min(".@".")")
	"initialise le répertoir
	command! -nargs=0 Init !mkdir images csv tables
	nnoremap <buffer> <silent> ée yy:call PasteToPane()<CR>

	"python interpreter
	command! -nargs=0 Console call TmuxSplit("ipython --no-autoindent", "-v")
	command! -nargs=0 Build term coconut %
	command! -nargs=0 Run term coconut -r --no-line-numbers --package % 
	command! -nargs=0 Check term coconut --mypy %
	xnoremap <buffer> <silent> <F5> y:call PasteToPane()<CR>
	nnoremap <buffer> <silent> <F6> :term pytest %<CR>
	nnoremap <buffer> <silent> <F7> yip:call PasteToPane()<CR>
	command!  -nargs=0 Doc ! coconut --docs &
	nnoremap éco :!gnome-terminal -- tmux new-session ipython<CR>

	"numpy shortcuts
	inoremap <buffer> npa np.array([])<Left><Left>
	inoremap <buffer> npdo np.dot(,_)<Left><Left><Left>
	inoremap <buffer> npde np.linalg.det()<Left>
	command! -nargs=0 Look execute "norm! yiwoprint(':',)\<Esc>F'hhpt)p"
	command! -nargs=0 Ref execute 'norm! yiw:vimgrep /<C-R>"/j *.py<Enter>:cope<Enter>'
	command! -nargs=0 Debug !python3 -m pudb %

	command! -nargs=1 Search execute "vimgrep /<args>/j **.coco" | copen

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/coconut-client/plugin/coconut-client.vim
	endfunction
	
	command! -nargs=0 Tomodule '<,'>w >> artifacts/module.py
	command! -nargs=0 Coco call Coconut()

endfunction

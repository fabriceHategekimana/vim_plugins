
function! Python()
	"ALEDisable
	set nospell
	let g:extention="py"

	"with the console
	nnoremap <buffer> <silent> <F3> yip:call PasteToPane()<CR>
	xnoremap <buffer> <silent> <F5> y:call PasteToPane()<CR>
	nnoremap <buffer> <silent> <Return> yy:call PasteToPane()<CR>
	command! -nargs=0 -range Send <line1>,<line2>yank a | call PasteToPane()
	command! -nargs=0 -range Fix !black % | e

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
	nnoremap <buffer> <silent> <F4> :call TmuxSplit("ipython --no-autoindent", "-v")<CR>
	command! -nargs=0 Console call TmuxSplit("ipython --no-autoindent", "-v")
	nnoremap <buffer> <silent> <F5> :term python3 %<CR>
	command! -nargs=0 Ru term python3 %
	command! -nargs=0 Run term ++shell mypy --ignore-missing-imports % && python3 %
	command! -nargs=0 Check term mypy %
	xnoremap <buffer> <silent> <F5> y:call PasteToPane()<CR>
	nnoremap <buffer> <silent> <F6> :term pytest %<CR>
	nnoremap <buffer> <silent> <F7> yip:call PasteToPane()<CR>
	command!  -nargs=1 Doc :!python3 -m pydoc <args>
	nnoremap éco :!gnome-terminal -- tmux new-session ipython<CR>

	"numpy shortcuts
	inoremap <buffer> npa np.array([])<Left><Left>
	inoremap <buffer> npdo np.dot(,_)<Left><Left><Left>
	inoremap <buffer> npde np.linalg.det()<Left>
	command! -nargs=0 Look execute "norm! yiwoprint(':',)\<Esc>F'hhpt)p"
	command! -nargs=0 Ref execute 'norm! yiw:vimgrep /<C-R>"/j *.py<Enter>:cope<Enter>'
	command! -nargs=0 Debug !python3 -m pudb %

	command! -nargs=1 Search execute "vimgrep /<args>/j **.py" | copen

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/python-client/plugin/python-client.vim
	endfunction
	
	command! -nargs=0 Tomodule '<,'>w >> artifacts/module.py

endfunction

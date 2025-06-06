set nospell
let g:extention="py"

map = :norm! I#<CR>

command! Peek norm! yy:call PeekFunction()<CR>

"with the console
command! -nargs=0 -range Fix !black % | e

"Raccourci pour le langage python
nnoremap <buffer> éc ^i# <Esc><CR>
xnoremap <buffer> éc :normal I# <CR>
xnoremap <buffer> éd :normal ^xx<CR>
nnoremap <buffer> éd ^xx 
"ajouter le f du f string
nnoremap <buffer> fs F"if<Esc>
"affiche la gallerie 1
nnoremap <buffer> éoG :!firefox images/. &<cr>
"affiche la gallerie 2
nnoremap <buffer> éog :!myfeh -R 10 images/ &<cr>
"ouvrir une image (mise sous la forme de lien)
nnoremap <buffer> éoi yy:call OpenImage()<CR>
nnoremap <buffer> éoi yy:call OpenImage()<CR>
"initialise le répertoir
command! -nargs=0 Init !mkdir images csv tables

"python interpreter
command! -nargs=0 Console call TmuxSplit("ipython --no-autoindent", "-v")
command! -nargs=0 Ru term /usr/local/bin/ipython %
command! -nargs=0 Run term python3 %
command! -nargs=0 Test term python3 test.py
command! -nargs=0 Check split | term mypy --ignore-missing-imports %
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
	tabnew ~/vim_plugins/python-client.vim
endfunction

command! -nargs=0 Tomodule '<,'>w >> artifacts/module.py

function! PeekFunction()
	let res = system("python3 /home/fabrice/sh/vim_jump_from_console python '".getline(".")."'")
	let num_file = split(res, " ")
	execute "split ".num_file[1]
	execute ":".num_file[0]
endfunction

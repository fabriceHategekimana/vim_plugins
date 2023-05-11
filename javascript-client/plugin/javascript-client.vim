
function! NewFunction(type, name, ...)
    	echom "package= ".a:0

    	if a:0 == 0
	    let package=""
	else
	    let package=a:1
	endif

	"Le plugin lf fait des effets de bord sur la variable g:app
	let g:inter=g:app

	if a:type == "class"
		tabnew ~/note/snippet/java/Class.java
		execute "%s/Class/".a:name."/g"
	elseif a:type == "abstract"
		tabnew ~/note/snippet/java/AbstractClass.java
		execute "%s/AbstractClass/".a:name."/g"
	elseif a:type == "interface"
		tabnew ~/note/snippet/java/Interface.java
		execute "%s/Interface/".a:name."/g"
	elseif a:type == "package"
	    	execute "!mkdir ".g:app."/".a:name
	endif

	if a:type != "package"
	    let g:app=g:inter
	    execute "saveas ".g:app."/".package.a:name.".java"
	endif
endfunction

function! Javascript()
	set nospell
	let g:extention= "js"
	let g:app=expand("%:p:h")
	let g:JavaComplete_IgnoreErrorMsg=1
	"Quand je quitte le mode insert, JavaComplete se charge de faire des
	"Déplace le curseur à la prochaine fonction
	nnoremap <buffer> énf /\(public\<Bar>private\)\ \(static\ \)\=\w\+\ \w\+(<CR>
	nnoremap <buffer> énF :/\(public\<Bar>private\) \(static \)\=\w\+ \w\+(/normal! f(B<CR>

	command! Console call TmuxSplit("node", "-v")
	nnoremap <buffer> <silent> <Return> yy:call PasteToPane()<CR>
	command! -range Send <line1>,<line2>yank a | call PasteToPane()
	"Déplace le curseur à la prochaine variable
	nnoremap <buffer> énv /\w\+\(\.\w\+\)\=\(\w\+\)\=\(;\<Bar>\ =[^;]\+;\)<CR>
	"Operator pending maping qui cible la prochaine variable"
	onoremap nv :<C-U>call search('=')<Space><Bar><Space>normal! llvt;<CR>
	"Operator pending maping qui cible la prochaine variable"
	onoremap nc :<C-U>call search('//')<Space><Bar><Space>normal! llv$h<CR>
	"Debug le code java
	nnoremap <buffer> <F4> :terminal ++close ++shell cd %:p:h && jdb %:t:r<CR>
	"Permet de créer des fichiers java
	nnoremap <buffer> <F6> :New<Space>
	"Permet de créer des fonctions java
	nmap écf G:call search('}','b')<CR>ofunction<Space>
	command! Run term node %

	"Commente une ligne
	nnoremap <buffer> éc ^i//<Esc>
	"Commente des lignes
	xnoremap <buffer> éc :normal I//<CR>
	"Enlève le commentaire sur une ligne"
	nnoremap <buffer> éd ^xx<Esc>
	"Enlève le commentaire sur une sélection de ligne"
	xnoremap <buffer> éd :normal ^xx<CR>

	command! -nargs=1 Search execute "vimgrep /<args>/j **.js" | copen

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/javascript-client/plugin/javascript-client.vim
	endfunction
endfunction	

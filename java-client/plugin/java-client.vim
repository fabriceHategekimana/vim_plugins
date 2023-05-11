function! Java()
	set nospell
	let g:extention= "java"
	let g:app=expand("%:p:h")
	let g:JavaComplete_IgnoreErrorMsg=1
	"Quand je quitte le mode insert, JavaComplete se charge de faire des
	"Déplace le curseur à la prochaine fonction
	nnoremap <buffer> énf /\(public\<Bar>private\)\ \(static\ \)\=\w\+\ \w\+(<CR>
	nnoremap <buffer> énF :/\(public\<Bar>private\) \(static \)\=\w\+ \w\+(/normal! f(B<CR>
	"Déplace le curseur à la prochaine variable
	nnoremap <buffer> énv /\w\+\(\.\w\+\)\=\(\w\+\)\=\(;\<Bar>\ =[^;]\+;\)<CR>
	"Operator pending maping qui cible la prochaine variable"
	onoremap nv :<C-U>call search('=')<Space><Bar><Space>normal! llvt;<CR>
	"Operator pending maping qui cible la prochaine variable"
	onoremap nc :<C-U>call search('//')<Space><Bar><Space>normal! llv$h<CR>
	"Debug le code java
	nnoremap <buffer> <F4> :terminal ++close ++shell cd %:p:h && jdb %:t:r<CR>
	"Compile et execute le code
	nnoremap <buffer> <F5> :terminal ++shell find . -type f -name "*.class" -delete && javac %:p:h:r/*.java && java %<CR>
	"Permet de créer des fichiers java
	nnoremap <buffer> <F6> :New<Space>
	"Permet de créer des fonctions java
	nmap écf G:call search('}','b')<CR>ofunction<Space>

	"Commente une ligne
	nnoremap <buffer> éc ^i//<Esc>
	"Commente des lignes
	xnoremap <buffer> éc :normal I//<CR>
	"Enlève le commentaire sur une ligne"
	nnoremap <buffer> éd ^xx<Esc>
	"Enlève le commentaire sur une sélection de ligne"
	xnoremap <buffer> éd :normal ^xx<CR>

	command! -nargs=1 Search execute "vimgrep /<args>/j **.java" | copen

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/java-client/plugin/java-client.vim
	endfunction
endfunction	

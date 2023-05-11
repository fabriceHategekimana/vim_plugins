

function! RunC()
	!gcc % -o main && ./main
endfunction

function! RunCPart()
	!cat % | grep include >> RunCPart.c && echo "int main(int argc, char *argv[]){" >> RunCPart.c
	call writefile(split(@","\n"), 'RunCPart.c', "a")
	!echo "}" >> RunCPart.c && gcc RunCPart.c -o main && ./main
	!rm RunCPart.c
endfunction

function! CLike()
	let g:extention= "c"
	set nospell
	"Raccourci pour le langage c
	"Commentaires
	"Snippets
	xnoremap <buffer> éc :normal I//<CR>
	xnoremap <buffer> éd :normal ^xx<CR>
	nnoremap <buffer> édc ^xx
	nnoremap <buffer> éc ^i//<Esc>$<CR>
	inoremap <buffer> for for(int i= 0; i < n; i++){<CR><CR>}<Up>
	inoremap <buffer> for<CR> for
	inoremap <buffer> if if(){<CR><CR>}<Esc>2<Up>t)a
	inoremap <buffer> if<CR> if
	inoremap <buffer> else	else{<CR><CR>}<Up>
	inoremap <buffer> print printf("");<Left><Left><Left>
	inoremap <buffer> print<CR> printf("%d", );<Left><Left>
	inoremap <buffer> print<CR><CR> printf("%s", );<Left><Left>
	nnoremap <buffer> ép oprintf("%s\n", );<Esc>hi
	inoremap <buffer> function! int<Space>(_){<CR><CR>}<Up><Up><Esc>f(i
	"Compilation et débugage
	nnoremap <buffer> <F5> :call RunC()<CR>
	xnoremap <buffer> <F5> y:call RunCPart()<CR>
	nnoremap <buffer> <F6> :! gcc *.c -o main && ./main<CR>
	nnoremap <buffer> <F9> :! bash ~/sh/mkc.sh

	function! InferPluginsFunction()
		tabnew ~/vim/c-client/plugin/c-client.vim
	endfunction
	command! -nargs=1 Search execute "vimgrep /<args>/j **.h **.c" | copen

endfunction

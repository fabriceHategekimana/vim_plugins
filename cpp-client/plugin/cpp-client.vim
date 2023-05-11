function! RunCpp3(type)
	let filepath = expand('%:p:h')
	let parentname = expand('%:p:h:t')
	let nomunique = expand('%:t:r')
	if a:type == "normal"
		silent execute "!g++ ".expand('%') " -o ".expand('%:r')." -std=c++11 -pthread" | execute "redraw" | execute "terminal ./".nomunique 
	elseif a:type == "mpi"
		execute "terminal mpiCC ".bufname('%')." -o ".nomunique." -std=c++11"
		execute "terminal mpirun -np ".g:parallele." --oversubscribe ./".expand('%:t:r')
	elseif a:type == "part"
		!cat % | grep include >> RunCppPart.cpp && echo "int main(int argc, char **argv){" >> RunCppPart.cpp && sed -i '1d' RunCppPart.cpp 
		call writefile(split(@","\n"), 'RunCppPart.cpp', "a")
		!echo "}" >> RunCppPart.cpp && g++ RunCppPart.cpp && ./a.out
		terminal g++ RunCppPart.cpp
		terminal ./a.out
		!rm RunCppPart.cpp
	endif
endfunction

function! CppLike()
	set nospell
	let g:extention= "cpp"
	let g:extention_supplementaire= "hpp"
	"Définition d'une variable globale pour changer le nombre de processus parallèles
	let g:parallele= 1
	
	nnoremap <buffer> éc I//<Esc>$<CR>
	xnoremap <buffer> éc :normal I//<CR>
	nnoremap <buffer> éd ^xx
	xnoremap <buffer> éd :normal ^xx<CR>
	inoremap <buffer> print	std::cout<Space><<<Space><Space><<<Space>std::endl;<Esc>2F<Space>i
	inoreabbrev <buffer> ok Okay
	inoreabbrev <buffer> vector std::vector<><Space>(,<Right>;<Esc>F<a
	inoreabbrev <buffer> list std::list<int><Space>
	inoreabbrev <buffer> for for(auto i: v<Right>{<CR><CR><Up>
	inoreabbrev <buffer> forr for({<CR><CR><Up><Up><Left><Left>
	inoreabbrev <buffer> forrr for(int i= 0; i < n; i++<Right>{<CR><CR><Right><Up>
	inoreabbrev <buffer> if if(<Right>{<CR><CR><Esc>2<Up>ta
	inoreabbrev <buffer> while while(<Right>{<CR><CR><Esc>2<Up>ta
	inoreabbrev <buffer> else	else{<CR><CR><Up>
	inoremap <buffer> function! int<Space>({<CR><CR>}<Up><Up><Esc>f(i
	inoreabbrev <buffer> recv MPI_Status<Space>status;<CR>MPI_Recv(&, sizeof(int, MPI_INT, i, 0, MPI_COMM_WORLD, &status;<Esc>F&a
	inoreabbrev <buffer> vrecv MPI_Status<Space>status;<CR>MPI_Recv(v.data(, v.size(, MPI_INT, i, 0, MPI_COMM_WORLD, &status;<Esc>
	inoreabbrev <buffer> send MPI_Send(&, sizeof(int, MPI_INT, i, 0, MPI_COMM_WORLD;<Esc>F&a
	inoreabbrev <buffer> vsend MPI_Send(v.data(, v.size(, MPI_INT, i, 0, MPI_COMM_WORLD;<Esc>
	inoreabbrev <buffer> barri MPI_Barrier(MPI_COMM_WORLD;<CR>double<Space>start<space>=<space>MPI_Wtime(;
	inoreabbrev <buffer> end end<Space>=<Space>MPI_Wtime(;<CR><CR>if(myRank==0<Space>std::cout<Space><<<Space>"temps<Space>de<Space>l'operation<Space>:<Space>"<Space><<<Space>end-start<Space><<<Space>"[s]"<Space><<<Space>std::endl;<Esc>

	"SNIPPETS
	inoreabbrev <buffer> smain <Esc>:r<Space>~/note/snippet/cpp.cpp<CR>
	inoreabbrev <buffer> smainmpi <Esc>:r<Space>~/note/snippet/cpp_mpi.cpp<CR>
	xnoremap <buffer> <F5> y:call RunCpp3("part")<CR>
	nnoremap <buffer> <F5> :call RunCpp3("normal")<CR>
	nnoremap <buffer> <F6> :let g:parallele= 
	inoremap <buffer> <C-d> <Esc>/_<CR>s


	command! -nargs=1 Search execute "vimgrep /<args>/j **.h **.cpp" | copen

	function! InferPluginsFunction()
		tabnew ~/vim/cpp-client/plugin/cpp-client.vim
	endfunction
endfunction


"____ commands for the Makefile

let g:makePreviousCommand=""

function! Rofi(command)
	return system(a:command." | rofi -dmenu")
endfunction

function! MakeCreateFunction()
	silent !echo "all:start" > Makefile
	silent !echo "" >> Makefile
	silent !echo "start: FORCE" >> Makefile
	silent !echo "	echo hello" >> Makefile
	silent !echo "" >> Makefile
	silent !echo "FORCE: " >> Makefile
	redraw!
endfunction

command! -nargs=0 MakeCreate call MakeCreateFunction()

function! MakeAddFunction(...)
	execute "silent !echo '' >> Makefile"
	execute "silent !echo '".a:1.": FORCE' >> Makefile"
	execute "silent !echo '	".join(a:000[1:])."' >> Makefile"
	redraw!
endfunction

command! -nargs=* -complete=file MakeAdd call MakeAddFunction(<f-args>)

function! MakeListFunction()
	call Rofi('cat Makefile | grep "^\w\+:" | sed "s/^\(\w\+\):.*$/\1/" | sed "1,3d"')
endfunction

command! -nargs=0 MakeList call MakeListFunction()

function! MakeDeleteFunction()
	"get line
	let command = MakeListFunction()
	let linenb=substitute(system('grep -nh '.a:command.' Makefile | sed "s/^\([0-9]\+\):.*/\1/"'), '\n', '','')
	execute '!cat Makefile | sed "'.linenb.'d" | sed "'.linenb.'d" > Makefile'
endfunction

command! -nargs=0 MakeDelete call MakeDeleteFunction()

function! MakeFunction(command)
	let g:makePreviousCommand = a:command
	execute "make! ".a:command
endfunction

command! -nargs=* Make call MakeFunction(<f-args>)

command! -nargs=0 MakeLast execute "make! ".g:makePreviousCommand
command! -nargs=0 ML execute "make! ".g:makePreviousCommand

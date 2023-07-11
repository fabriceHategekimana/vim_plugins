function! Xargs(args) range
	execute a:firstline.",".a:lastline."!xargs -I \"%\" bash -c \"".a:args."\""
endfunction

function! Borrow_Function(args) range
	execute a:firstline.",".a:lastline."!xargs -I \"%\" ".a:args
	undo
endfunction

command! -nargs=* -range Filter <line1>,<line2>call Xargs(<args>)
command! -nargs=* -range Borrow <line1>,<line2>call Borrow_Function(<q-args>)

function! Predicat()
	command! -nargs=0 Console call TmuxSplit("opredicat", "-v")
	command! -nargs=0 Build call TmuxSplit("typer", "-v")
	command! -nargs=0 Load call SendToPane("import final")
	command! -nargs=0 Run execute "Build" | execute "Console" | execute "Load"

	xnoremap <buffer> <silent> <F5> y:call PasteToPane()<CR>
endfunction

function! ConvertEntry(entry)
	" 1 -> string, 3 -> list
	if type(a:entry) == 1
		let tab = split(a:entry)
	elseif type(a:entry) == 3
		let tab = a:entry
	endif
	if len(tab) > 1
		let res = "\"".join(tab)."\""
	else 
		let res = join(tab)
	endif 
	return res
endfunction

"------------------
"Add

function! PredicatAddFunction(subject,link,goal)
	let subject = ConvertEntry(a:subject)
	let link = a:link
	let goal = ConvertEntry(a:goal)
	call SendToPane("add ".subject." ".link." ".goal)
endfunction

"-------------------
"check

function! PredicatCheckFunction(subject,link,goal)
	let subject = ConvertEntry(a:subject)
	let link = a:link
	let goal = ConvertEntry(a:goal)
	call SendToPane("check ".subject." ".link." ".goal)
endfunction

"------------------
"label
function! PredicatAddLabelsFunction(...)
	let subject=ConvertEntry(@")
	for i in a:000
		call PredicatAddFunction(subject, "label", i)
	endfor
endfunction

command! -nargs=* PredicatAddLabels call PredicatAddLabelsFunction(<f-args>)
nnoremap <buffer> éél yiw:PredicatAddLabels 
xnoremap <buffer> éél y:PredicatAddLabels 

"------------------
"description
function! PredicatAddDescriptionFunction(...)
	echom a:000
	call PredicatAddFunction(@", "description", a:000)
endfunction

command! -nargs=* PredicatAddDescription call PredicatAddDescriptionFunction(<f-args>)
nnoremap <buffer> ééd yiw:PredicatAddDescription 
xnoremap <buffer> ééd y:PredicatAddDescription 

"-------------------
"general add

function! PredicatGeneralAddFunction(...)
	let link=a:1
	let goal=a:000[1:-1]
	call PredicatAddFunction(@",link,goal)
endfunction

command! -nargs=* PredicatGeneralAdd call PredicatGeneralAddFunction(<f-args>)
nnoremap <buffer> ééa yiw:PredicatGeneralAdd 
xnoremap <buffer> ééa y:PredicatGeneralAdd 

"-------------------
"general add

function! PredicatGetInfo()
	let subject=ConvertEntry(@")
	call SendToPane("check ".subject." A B")
endfunction 

nnoremap <buffer> ééi yiw:call PredicatGetInfo()<CR>
xnoremap <buffer> ééi y:call PredicatGetInfo()<CR>

"-------------------
"query
function! PredicatQueryFunction(...)
	let link = a:1
	let goal=a:000[1:-1]
	call PredicatCheckFunction(@",link,goal)
endfunction

command! -nargs=* PredicatQuery call PredicatQueryFunction(<f-args>)

nnoremap <buffer> ééq yiw:PredicatQuery 
xnoremap <buffer> ééq y:PredicatQuery

"-------------------
"general command

function! PredicatFunction(...)
	call SendToPane(join(a:000))	
endfunction

command! -nargs=* Predicat call PredicatFunction(<f-args>)

nnoremap <buffer> éé<Space> :Predicat 

"-------------------
"add type
function! PredicatAddTypeFunction(given_type)
	call SendToPane("add ".@"." type ".a:given_type)
endfunction
command! -nargs=1 PredicatAddType call PredicatAddTypeFunction(<f-args>)
nnoremap <buffer> éét yiw:PredicatAddType 
xnoremap <buffer> éét y:PredicatAddType

"-------------------
"delete node
function! PredicatDeleteNodeFunction()
	call SendToPane("delete ".@"." A B")
	call SendToPane("delete A B ".@")
endfunction
"command! -nargs=1 PredicatDeleteNode call PredicatDeleteNodeFunction(<f-args>)
nnoremap <buffer> ééD yiw:call PredicatDeleteNodeFunction()<CR>
xnoremap <buffer> ééD y:call PredicatDeleteNodeFunction()<CR>

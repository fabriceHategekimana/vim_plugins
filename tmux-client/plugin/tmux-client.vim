"TMUX configs

let g:pane = 1

function! MyEscape(cmd)
	let escaped= escape(escape(escape(escape(a:cmd, "#"),"!"),"%"),";")
	return substitute(escaped, "\;", ";", "g")  "for sql
endfunction

function! SendToPane(val) range
		let exp = MyEscape(a:val)
		execute "silent ".a:firstline.",".a:lastline."!tmux send-keys -t ".g:pane." '".exp."' Enter"
		execute "redraw!"
endfunction

function! PasteToPane()
	"attention, la fonction prend la sélection 'yankée' avec y
	let exp = MyEscape(@")
	let tab= split(exp, "\n")	
	for line in tab
		execute "silent !tmux send-keys -t '".g:pane."' '".line."' Enter"
	endfor
	execute "redraw!"
endfunction

function! TmuxSplit(command, orientation,...)
	let size = "30"
	let startDirectory = ""
	let pos = ""
	if a:orientation == "-h"
		let size = "20"
	endif
	if a:1 == "reverse"
		let pos = "-b"
	elseif a:0 == 1
		let startDirectory = "-c ".a:1
	endif
	execute "silent !tmux split-window -p ".size." ".a:orientation." ".startDirectory." ".pos." ".a:command
	execute "redraw!"
endfunction

function! TmuxChangeTargetPaneFunction()
	"choisi un pane parmi une liste des pane possibles
	let g:pane = systemlist('tmux list-panes -a -F "#{session_name}:#{window_name}.#{pane_index}" | rofi -dmenu')[2]
endfunction

command! -nargs=0 TmuxChangeTargetPane call TmuxChangeTargetPaneFunction()

" TmuxBackground run a command in the 'Background' by putting it in the
" 'hidden' session
function! TmuxBackground(command)
	"choisi un pane parmi une liste des pane possibles
	execute "silent !tmux new-window -t hidden ".a:command | redraw
endfunction

"TmuxHidePane hide the first side pane (= move it to the 'hidden' session)
function! TmuxHidePane(num)
	execute "silent !tmux break-pane -s ".a:num." -t hidden"
endfunction

"TmuxSelectPane select a pane to show between the given panes in the 'hidden'
"session
function! TmuxSelectPane()
	let pane = systemlist('tmux list-windows -t hidden -F "#{session_name}:#{window_name}.#{pane_index}"| rofi -dmenu')[1]
	execute "silent !tmux move-pane -s ".pane." -l 10 -v" | redraw
endfunction

function! TmuxClear()
	execute "silent !tmux send-keys -t '".g:pane."' C-l"	
endfunction

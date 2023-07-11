" autocomandes
augroup programmation
	autocmd!
	autocmd FileType markdown call Markdown()
	autocmd FileType tex call Latex()
	autocmd FileType python call Python()
	autocmd FileType javascript call Javascript()
	autocmd FileType java call Java()
	autocmd FileType rust call Rust()
	autocmd BufRead,BufNewFile *.pl call Prolog()
	autocmd	FileType r call RLike()
	autocmd BufRead,BufNewFile *.v call Coq()
	autocmd BufRead,BufNewFile *.cs call CSharp()
	autocmd BufRead,BufNewFile *.hs call Haskell()
	autocmd BufRead,BufNewFile *.nim call Nim()
	autocmd FileType sh call Sh()
	"autocmd BufRead,BufNewFile *.puml call Puml()
	autocmd FileType plantuml call Puml()
	autocmd BufRead,BufNewFile *.nu call Nu()
	autocmd BufRead,BufNewFile *.ty call Typer()
	"autocmd BufRead,BufNewFile *.toml call Toml()
	autocmd FileType toml call Toml()
augroup END

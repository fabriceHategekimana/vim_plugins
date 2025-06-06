call plug#begin() 
"Custom plugins
Plug '/home/fabrice/vim_plugins/markdown-client/'
Plug '/home/fabrice/vim_plugins/tmux-client/'
Plug '/home/fabrice/vim_plugins/rust-client/'
Plug '/home/fabrice/vim_plugins/bash-client/'
Plug '/home/fabrice/vim_plugins/haskell-client/'
Plug '/home/fabrice/vim_plugins/latex-client/'
Plug '/home/fabrice/vim_plugins/javascript-client/'
Plug '/home/fabrice/vim_plugins/java-client/'
Plug '/home/fabrice/vim_plugins/coq-client/'
Plug '/home/fabrice/vim_plugins/nu-client/'
Plug '/home/fabrice/vim_plugins/toml-client/'
Plug '/home/fabrice/vim_plugins/r-client/'
Plug '/home/fabrice/vim_plugins/csharp-client/'
Plug '/home/fabrice/vim_plugins/predicat-client/'
Plug '/home/fabrice/vim_plugins/typer-client/'
Plug '/home/fabrice/vim_plugins/nim-client/'
Plug '/home/fabrice/vim_plugins/fzf-client/'
Plug '/home/fabrice/vim_plugins/filter-client/'
Plug '/home/fabrice/vim_plugins/coconut-client/'
Plug '/home/fabrice/vim_plugins/mojo-client/'
Plug '/home/fabrice/vim_plugins/quickfix-client/'
Plug '/home/fabrice/vim_plugins/quarto-client/'
Plug '/home/fabrice/vim_plugins/typst-client/'
Plug '/home/fabrice/vim_plugins/json-client/'
Plug '/home/fabrice/vim_plugins/php-client/'
Plug '/home/fabrice/vim_plugins/typetaking-client/'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

"Autocommands settings
Plug '/home/fabrice/vim_plugins/autocommands-client/'
Plug '/home/fabrice/vim_plugins/default-client/'

" External plugins
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-fugitive'
Plug 'cespare/vim-toml'
Plug 'zah/nim.vim'

"Text Object
Plug 'wellle/targets.vim'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'sirver/ultisnips'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'honza/vim-snippets'
Plug 'liuchengxu/vista.vim'
Plug 'mxw/vim-prolog'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Syntax
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'quarto-dev/quarto-vim'
Plug 'vim-scripts/coq-syntax'
Plug 'kaarmu/typst.vim'

call plug#end()

"Personal plugins
autocmd FileType python source /home/fabrice/vim_plugins/python-client.vim
autocmd VimEnter,BufNew,BufRead *.pl source /home/fabrice/vim_plugins/prolog-client.vim
autocmd VimEnter,BufNew,BufRead *.txt source /home/fabrice/vim_plugins/text-client.vim
autocmd VimEnter,BufNew,BufRead *.ty source /home/fabrice/vim_plugins/typr-client.vim

"Vista.vim
nnoremap évi :Vista vim_lsp<CR>
command! -nargs=0 Symbols Vista vim_lsp
let g:lsp_diagnostics_virtual_text_prefix = " ‣ "

"Lsp command
nnoremap gd :LspDefinition<CR>
nnoremap éh :LspHover<CR>
command! Def LspDefinition
command! Dec LspDeclaration
command! Hov LspPeekDefinition
command! Ref LspReferences
command! Format LspDocumentFormat
command! Rename LspRename
command! Err LspNextDiagnostic
command! -nargs=* S1 LspWorkspaceSymbol <args>
command! -nargs=* S2 LspWorkspaceSymbolSearch <args>
command! -nargs=* S3 Vista finder vim_lsp
command! -range Action <line1>,<line2>LspCodeAction
command! -nargs=0 Diagnostic LspDocumentDiagnostics
command! -nargs=0 Implementation LspImplementation

function ExecInBash(cmd_list)
	set shell=/usr/bin/bash
    for cmd in a:cmd_list
		execute cmd
    endfor
	set shell=/home/fabrice/.cargo/bin/nu
endfunction

"UTILITAIRES---------------------------
" custom commands
command! -nargs=0 Cd execute "cd ".expand("%:p:h")
command! -nargs=0 Todo execute "vimgrep /TODO/j **" | copen
"Custom commands
command! -nargs=0 Config !tmux new-window -n "vimrc" vim /home/fabrice/vim_plugins/.vimrc
command! -nargs=* Help tab help  <args>
command! -nargs=0 FzfCommands :tabnew ~/note/fzf_commands.md
command! Hist History:
" ajoute deux espace en fin de ligne pour markdown
command! Aligne %norm! A  
command! Date :call ExecInBash([".!date"]) 
nnoremap élf :!/home/fabrice/sh/side_bar_lf<CR>
inoremap <C-C> <Esc>
command! Source source ~/.vimrc
command! Load w | Source
command! Snip UltiSnipsEdit
command! -nargs=1 Store !firefox https://vimawesome.com/?q=<args> &

"NAVIGATION---------------------------
nnoremap <C-J> }zz
nnoremap <C-K> {zz
xnoremap <C-J> }zz
xnoremap <C-K> {zz
" Move in insert mode
inoremap <C-L> <Right>
nnoremap éF :Buffers<CR>


" Custom vertical split
nnoremap vp :call ExecInBash(["vsplit", "Files"])<CR>

" Buffer navigation
nnoremap <C-B> :bp<CR>
nnoremap éf :call ExecInBash(["Files"])<CR>
nnoremap ér yiw:execute "Rg ".@"<CR>
xnoremap ér normal! y:execute "Rg ".@"<CR>
nnoremap és :split<CR>:Files<CR>
xnoremap <silent> * "my/<C-R>m<CR>
xnoremap <silent> # "my?<C-R>m<CR>
nnoremap é<C-O> :bp<cr>
nnoremap é<C-I> :bn<cr>
nnoremap <Tab> :bp<cr>

"EDITION---------------------------
nnoremap d<C-J> dd}kp{j
nnoremap d<C-K> dd{p}k
"copy a specific line
nnoremap cp :t.<Left><Left>

inoremap """ "<Esc>A"<Esc>
inoremap ((( (<Esc>A)<Esc>
inoremap [[[ [<Esc>A]<Esc>
inoremap {{{ {<Esc>A}<Esc>

nnoremap éyy "+yy
nnoremap ép "+p
xnoremap éy "+y

nnoremap éo o<Esc>k
nnoremap éO O<Esc>j

nnoremap éS ^C

function! ExecuteCommandOnSelection(...)
	let l:cmd = join(a:000, ' ')
	let l:selection = getline("'<", "'>")
	let l:selection_str = join(l:selection, "\n")
	let l:complet = "echo '".l:selection_str."' | ".l:cmd
	let l:result = system(l:complet)
	call setline("'<", split(l:result, "\n"))
	normal! gv
endfunction

command! -nargs=* -range Filter call ExecuteCommandOnSelection(<f-args>)

"Config saving
command! -range ToConfig <line1>,<line2>w >> /root/.config/nvim/init.vim
command! -range ToSettings <line1>,<line2>w >> settings.vim

"Nushell cmd.nu file
command! CmdDoc term source cmd.nu ; help main
command! CmdNew !touch cmd.nu
command! CmdOpen e cmd.nu
command! -nargs=* Cmd !nu cmd.nu <q-args>

"MISCELLANIOUS---------------------------
nnoremap <C-C> :noh<CR>
nnoremap <C-P> :Command<CR>
nnoremap éz <c-w>o



"demo
"execute "normal yiwGo\<cr>fn\<tab>\i\<c-w>\<c-o>p"

"let g:vimwiki_key_mappings = { 'table_mappings': 0, }

let g:vim_markdown_folding_disabled = 1

command! -nargs=0 Plugin call InferPluginsFunction()
command! -nargs=0 Plugins !/home/fabrice/sh/vim_plugins
command! -nargs=0 Plugs call ExecInBash(["Files /home/fabrice/vim_plugins/"])
command! -nargs=0 Note call NoteFunction()


nnoremap R :Vista finder vim_lsp<CR>
xnoremap <Space>  :!espeak -v en -s 100<CR>

"command! -nargs=0 Lazygit !/home/fabrice/sh/zrf lazygit
command! -nargs=0 Lazygit !multiplexer floating new --command "lazygit" 
command! -nargs=0 Vimrc2 !/home/fabrice/sh/zrf vim /home/fabrice/vim_plugins/.vimrc
command! -nargs=0 Lf !zellij action new-pane -- lf
command! -nargs=0 Save :w /home/fabrice/sessions/saved/%

function! ToQCM()
	%s/\d\+\. /
	%s/**//g
	%s/\s\+\u\. /- 
	%s/\s\+Réponse :/Réponse:
	g/^Réponse:/norm! kdd
endfunction

command! Qcm call ToQCM()

"Settings
command! Settings source settings.vim

" Vérifier si le fichier settings.vim existe
if filereadable("settings.vim")
  source settings.vim
endif

autocmd VimEnter,BufNew /home/fabrice/sh/* set syntax=bash

silent command! -nargs=* Runner !multiplexer pane new --fixed --command <q-args>
command! -nargs=* App !multiplexer floating new --command <q-args>
command! -nargs=* Float !multiplexer floating new --command <q-args>
command! -nargs=* IFloat !multiplexer floating new --fixed --command <q-args>
command! -nargs=* Agenda !multiplexer floating new --command calcurse
command! -nargs=0 Rendu !cp -f % /home/fabrice/rendu/

nnoremap én $%


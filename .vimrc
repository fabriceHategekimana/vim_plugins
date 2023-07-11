call plug#begin() 
"Custom plugins
Plug '/home/fabrice/vim_plugins/markdown-client/'
Plug '/home/fabrice/vim_plugins/prolog-client'
Plug '/home/fabrice/vim_plugins/tmux-client/'
Plug '/home/fabrice/vim_plugins/rust-client/'
Plug '/home/fabrice/vim_plugins/bash-client/'
Plug '/home/fabrice/vim_plugins/haskell-client/'
Plug '/home/fabrice/vim_plugins/latex-client/'
Plug '/home/fabrice/vim_plugins/javascript-client/'
Plug '/home/fabrice/vim_plugins/java-client/'
Plug '/home/fabrice/vim_plugins/python-client/'
Plug '/home/fabrice/vim_plugins/coq-client/'
Plug '/home/fabrice/vim_plugins/nu-client/'
Plug '/home/fabrice/vim_plugins/toml-client/'
Plug '/home/fabrice/vim_plugins/r-client/'
Plug '/home/fabrice/vim_plugins/csharp-client/'
Plug '/home/fabrice/vim_plugins/predicat-client/'
Plug '/home/fabrice/vim_plugins/typer-client/'
Plug '/home/fabrice/vim_plugins/nim-client/'
Plug '/home/fabrice/vim_plugins/autocommands-client/'
Plug '/home/fabrice/vim_plugins/fzf-client/'
Plug '/home/fabrice/vim_plugins/filter-client/'
Plug '/home/fabrice/vim_plugins/default-client/'
Plug 'tpope/vim-fugitive'
Plug 'ekalinin/dockerfile.vim'
Plug 'cespare/vim-toml'
Plug 'zah/nim.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" External plugins
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/coq-syntax'
Plug 'justinmk/vim-sneak'

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

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"PlantUml
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug '/home/fabrice/vim_plugins/puml-client/'
Plug 'tyru/open-browser.vim'

call plug#end()


"Autocomplete
let g:asyncomplete_auto_popup = 1

"Airline
let g:airline_theme='lucius' "ou monochrome

"Lsp
let g:lsp_diagnostics_float_cursor = 1

let g:lsp_diagnostics_signs_error = {"text": ""}
let g:lsp_diagnostics_signs_warning = {"text": ""}
let g:lsp_diagnostics_signs_information = {"text": ""}
let g:lsp_diagnostics_signs_hint = {"text": ""}
let g:lsp_document_code_action_signs_hint = {"text": ""}
let g:lsp_document_code_action_signs_enabled = 0

"ultisnip
let g:lsp_snippet_expand = ["ultisnip"]
    let g:UltiSnipsExpandTrigger="<Tab>"
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'allowlist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))

"Sneak vim
let g:sneak#label = 1

"Vista.vim
nnoremap évi :Vista vim_lsp<CR>
command! -nargs=0 Symbols Vista vim_lsp

"Lsp command
nnoremap gd :LspDefinition<CR>
nnoremap éh :LspHover<CR>
command! Def LspDefinition
command! Hov LspPeekDefinition
command! Ref LspReferences
command! Format LspDocumentFormat
command! Rename LspRename
command! Err LspNextDiagnostic
command! -range Action <line1>,<line2>LspCodeAction

"UTILITAIRES---------------------------
" custom commands
command! -nargs=0 Cd execute "cd ".expand("%:p:h")
command! -nargs=0 Todo execute "vimgrep /TODO/j **" | copen
"Custom commands
command! -nargs=0 Vimrc !tmux new-window -n "vimrc" vim /home/fabrice/vim_plugins/.vimrc
command! -nargs=* Help tab help  <args>
command! -nargs=0 FzfCommands :tabnew ~/note/fzf_commands.md
command! Hist History:
" ajoute deux espace en fin de ligne pour markdown
command! Aligne %norm! A  
command! Date .!date
nnoremap élf :!/home/fabrice/sh/side_bar_lf<CR>
inoremap <C-C> <Esc>
command! Source source ~/.vimrc
command! Load w | Source
command! Snip UltiSnipsEdit
command! -nargs=1 Store !firefox https://vimawesome.com/?q=<args> &

"NAVIGATION---------------------------
nnoremap <C-J> }
nnoremap <C-K> {
xnoremap <C-J> }
xnoremap <C-K> {
"move in insert mode
inoremap <C-L> <Right>
nnoremap éF :Buffers<CR>
" custom vertical split
nnoremap vp :vsplit<CR>:Files<CR>
"Buffer navigation
nnoremap <C-B> :bp<CR>
nnoremap éf :Files<CR>

"EDITION---------------------------
nnoremap d<C-J> dd}kp{j
nnoremap d<C-K> dd{p}k
"copy a specific line
nnoremap cp :t.<Left><Left>

inoremap """ "<Esc>A"<Esc>
inoremap ((( (<Esc>A)<Esc>
inoremap [[[ [<Esc>A]<Esc>
inoremap {{{ {<Esc>A}<Esc>

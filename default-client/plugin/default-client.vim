"Custom configs
set shell=/home/fabrice/.cargo/bin/nu
set wildmenu
set wildmode=list:longest,list:full
set completeopt+=menuone
set noswapfile
set splitbelow
set splitright

" indentation config
set tabstop=4
set softtabstop=4
set cindent shiftwidth=4

" compatibility
filetype plugin indent on

set number
set timeoutlen=500

"search settings
set ignorecase
set smartcase
set cursorline
let g:pane = 1

" Enter to the file path after the booting of Vim
autocmd VimEnter * execute "cd ".expand("%:h")

" Color settings
"color elflord
highlight Pmenu ctermfg=0 ctermbg=4

function! PluginsFunction()
	let selectedPlugin = RofiFunction("^ls /home/fabrice/vim_plugins/")
	echom "!tmux new-window -n '".selectedPlugin."' vim /home/fabrice/vim_plugins/".selectedPlugin."/plugin/".selectedPlugin.".vim"
	"execute "!tmux new-window -n '".selectedPlugin."' vim /home/fabrice/vim_plugins/".selectedPlugin."/plugin/".selectedPlugin.".vim"
endfunction

"Autocomplete
let g:asyncomplete_auto_popup = 1

"Airline
let g:airline_theme='lucius' "ou monochrome

"Lsp
let g:lsp_diagnostics_float_cursor = 1

let g:lsp_diagnostics_signs_error = {"text": ""}
let g:lsp_diagnostics_signs_warning = {"text": ""}
let g:lsp_diagnostics_signs_information = {"text": ""}
let g:lsp_diagnostics_signs_hint = {"text": ""}
let g:lsp_document_code_action_signs_hint = {"text": ""}
"let g:lsp_document_code_action_signs_enabled = 0

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

autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'b': {'pair': [
		\				{'o':'(', 'c':')'},
		\				{'o':'[', 'c':']'},
		\				{'o':'{', 'c':'}'},
		\				{'o':'<', 'c':'>'}
		\			]}
    \ })


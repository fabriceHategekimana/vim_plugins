"Custom configs
set shell=/bin/bash
set noswapfile
set wildmenu
set wildmode=list:longest,list:full
set completeopt+=menuone
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
color elflord
highlight Pmenu ctermfg=0 ctermbg=4

function! PluginsFunction()
	let selectedPlugin = RofiFunction("^ls /home/fabrice/vim_plugins/")
	echom "!tmux new-window -n '".selectedPlugin."' vim /home/fabrice/vim_plugins/".selectedPlugin."/plugin/".selectedPlugin.".vim"
	"execute "!tmux new-window -n '".selectedPlugin."' vim /home/fabrice/vim_plugins/".selectedPlugin."/plugin/".selectedPlugin.".vim"
endfunction

command! -nargs=0 Plugin call InferPluginsFunction()
command! -nargs=0 Plugins !/home/fabrice/sh/vim_plugins

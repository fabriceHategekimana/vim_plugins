set syntax=scala

syntax match rComment "^#.*"
highlight link rComment Comment

syntax match scalaComment "DONE"
highlight scalaComment guifg=Blue

syntax match scalaComment "//.*"
highlight scalaComment guifg=White

syntax match Pipe "|>"
highlight Pipe guifg=Yellow

syntax match letExp "let"
highlight letExp guifg=Yellow

syntax match letExp "opaque"
highlight letExp guifg=Yellow

syntax match letExp "mut"
highlight letExp guifg=Yellow

syntax match letExp "pub"
highlight letExp guifg=Yellow

syntax match fnToken "fn"
highlight link fnToken Function

syntax match threeDots "\.\.\."
highlight threeDots guifg=#AAAAAA

syntax match myFunctionName /\w\(\w\)*(/me=e-1,he=e-1
highlight link myFunctionName Function

command! -nargs=0 Run split | term typr % 
command! Plugin tabnew /home/fabrice/vim_plugins/typr-client.vim
command! -range ToPlugin <line1>,<line2>w >> /home/fabrice/vim_plugins/typr-client.vim


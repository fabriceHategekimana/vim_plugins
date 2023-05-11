"------------------------------------ARM----------------------
"
function! RunARM()
	let @o= system("arm-linux-gnueabi-gcc ".bufname('%')."&& qemu-arm -L /usr/arm-linux-gnueabi a.out") 
Il faut utiliser la commande:
arm-linux-gnueabi-gcc [filename]
pour compiler et 
qemu-arm -L /usr/arm-linux-gnueabi a.out
pour lancer l'exécutable
	echo @o
endfunction

function! ARM()
	let g:extention="s"
	nnoremap <buffer> <F5> :call RunARM()<CR>
	nnoremap <buffer> éti I//----------a----------//<Esc>Ta<Left>s
	nnoremap <buffer> éc A<Tab>//
	nnoremap <buffer> éwo gg<Down>o:<Tab>.word<tab>
	nnoremap <buffer> éby gg<Down>o:<Tab>.byte<tab>
	nnoremap <buffer> éin gg<Down>o:<Tab>.int<tab>
	nnoremap <buffer> élo gg<Down>o:<Tab>.long<tab>
	nnoremap <buffer> ést gg<Down>o:<Tab>.string<tab>
	nnoremap <buffer> éas gg<Down>o:<Tab>.asciz<tab>""<Left>
	inoremap <buffer> function! :<Tab>stmfd<Tab>sp!,{r4-r11}<CR><Tab>ldmfd<Tab>sp!,{r4-r11}<CR><Tab>mov<Tab>pc,lr<Esc><Up><Up>I
	inoremap <buffer> print ldr<Tab>r0,=<CR><Tab>bl<Tab>printf<Esc><Up>A

	command! -nargs=1 Search execute "vimgrep /<args>/j **.s" | copen
endfunction

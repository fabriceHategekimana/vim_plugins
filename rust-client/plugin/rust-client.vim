
function! Rust()
	let g:extention="rs"

	command! Doc LspRustOpenDoc

	nnoremap <buffer> <silent> <F4> :call TmuxSplit("evcxr", "-v")<CR>
	command! Run term cargo +nightly run
	command! Ru execute "term ++shell rustc ".expand("%")." && ./".expand("%:r")
	command! Fix term cargo clippy --fix --allow-dirty
	command! -nargs=? Test term cargo +nightly test <args>
	command! Build term cargo +nightly build
	command! Check term cargo +nightly check
	command! Console term evcxr
	command! -nargs=1 Module !/home/fabrice/sh/rust_module <args>
	command! -nargs=1 Rust !firefox https://docs.rs/<args>/latest/<args>/ &
	xnoremap <buffer> éc :normal I//<CR>
	xnoremap <buffer> éd :normal ^xx<CR>
	nnoremap <buffer> édc ^xx
	nnoremap <buffer> éc ^i//<Esc>$<CR>

	command! -nargs=1 Search execute "vimgrep /<args>/j **.rs" | copen

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/rust-client/plugin/rust-client.vim
	endfunction
endfunction


function! Rust()
	let g:extention="rs"

	command! Doc LspRustOpenDoc

	command! Run silent! bd run | execute "term cargo +nightly run" | file run
	command! Ru execute "term ++shell rustc ".expand("%")." && ./".expand("%:r")
	command! Fix term cargo clippy --fix --allow-dirty
	command! -nargs=? Test silent! bd test | execute "term cargo +nightly test ".<q-args> | file test
	command! Build silent! bd build | execute "term cargo +nightly build" | file build
	command! Check silent! bd check | execute "term cargo +nightly check" | file check
	command! Console term evcxr
	command! Console silent! call TmuxSplit("evcxr", "-v")
	command! -nargs=1 Module !/home/fabrice/sh/rust_module <args>
	command! -nargs=1 Rust !firefox https://docs.rs/<args>/latest/<args>/ &
	xnoremap <buffer> éc :normal I//<CR>
	xnoremap <buffer> éd :normal ^xx<CR>
	nnoremap <buffer> édc ^xx
	nnoremap <buffer> éc ^i//<Esc>$<CR>
	nnoremap <buffer> ts f"a.to_string()<Esc>

	command! -nargs=1 Search execute "vimgrep /<args>/j **.rs" | copen

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/rust-client/plugin/rust-client.vim
	endfunction
endfunction

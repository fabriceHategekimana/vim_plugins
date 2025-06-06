function! Rust()
	"let g:extention="rs"

	command! Doc LspRustOpenDoc
	command! Run silent! bd run | execute "term cargo +nightly run" | file run
	command! Ru term rustc % ; ./%:r
	command! Fix term cargo clippy --fix --allow-dirty
	command! Publish term cargo publish
	command! -nargs=? Test silent! bd test | execute "term cargo +nightly test ".<q-args>." -- --nocapture" | file test 
	command! -bar Build silent! bd build | execute "term cargo +nightly build" | file build
	command! Check silent! bd check | execute "term cargo +nightly check" | file check
	command! Console silent! call TmuxSplit("evcxr", "-v")
	command! Back cd ../..
	command! -nargs=1 Use !echo <args> = { path = \"../<args>\" } >> %:p:h:h/Cargo.toml
	command! -nargs=1 Add term cargo add <args>
	command! -nargs=1 Module !/home/fabrice/sh/rust_module <args>
	command! -nargs=1 Rust !firefox https://docs.rs/<args>/latest/<args>/ &
	xnoremap <buffer> éc :normal I//<CR>
	xnoremap <buffer> éd :normal ^xx<CR>
	nnoremap <buffer> éd ^xx
	nnoremap <buffer> éc ^i//<Esc>$<CR>
	nnoremap <buffer> ts /"[^"]*"<CR>f"a.to_string()<Esc>:noh<CR>
	command! -nargs=1 Search execute "vimgrep /<args>/j *.rs" | copen
	command! -nargs=0 Todo execute "vimgrep /TODO/j **/*.rs" | copen

	function! InferPluginsFunction()
		tabnew ~/vim_plugins/rust-client/plugin/rust-client.vim
	endfunction

	function! NoteFunction()
		tabnew ~/vim_plugins/rust-client/plugin/rust-note.md
	endfunction
endfunction


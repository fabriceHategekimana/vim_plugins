function! LinkImage()
	if ! filereadable("images")
		!mkdir images && echo création du dossier images
	endif
	execute "silent :normal! ^d$"
	let formated= substitute(@", " ", "_", "g")
	execute "silent normal! i![".formated."](images/".formated.".png)"
	execute "!import $(pwd)/images/".@".".png"
endfunction

function! LinkImage2()
	if ! filereadable("images")
		!mkdir images && echo création du dossier images
	endif
	execute "silent :normal! ^d$"
	let formated= substitute(@", " ", "_", "g")
	execute "silent normal! i![".formated."](images/".formated.".png)"
	execute "!flameshot gui -p $(pwd)/images"
	"flameshot correction
	execute escape("!mv images/$(date +%m).png images/".formated.".png", "%")
endfunction

function! GetImagePath()
	let image_path = systemlist("zettel image '".substitute(escape(@","!"),"!","\!","")."'")[0]
	echom image_path
	let imagePath = split(@", "(")
	let imagePath = imagePath[1][0:-2]
	return imagePath
endfunction

function! EditImage()
	let impath = GetImagePath()
	let tab= split(impath, "\\.")
	let xcfFile = tab[0].".xcf"
	if filereadable(xcfFile)
		execute "silent !gimp ".xcfFile." &"
	else
		execute "silent !gimp ".impath." &"
	endif 
endfunction

function! OpenImage()
	let impath = GetImagePath()
	execute "!myfeh ".impath." &"
endfunction

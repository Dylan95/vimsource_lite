"author: Dylan Gundlach

"LOAD VIMSOURCE

let vimsourceDir = '~/vimsource_lite/'

function DCG_SourceAll(dir)
	let files = a:dir . '*.vim'
	for f in split(glob(l:files), '\n')
		exec 'source ' . f
	endfor
endfunction

call DCG_SourceAll(vimsourceDir . 'functions/')
call DCG_SourceAll(vimsourceDir . 'filetypes/')
call DCG_SourceAll(vimsourceDir . 'plugins/')
call DCG_SourceAll(vimsourceDir)


"this keeps indents for empty lines.
"it does this by inserting and deleting a character each time a line is inserted
inoremap <CR> <CR>x<BS>
"inoremap <CR> <CR>x

nnoremap O Ox<BS><ESC>l




function DCG_cloneLineBelow()
	let l:selection = getline(".")
	"
	let l:pos = getpos(".")
	"put l:selection after the current line
	put =l:selection
	call setpos(".", l:pos)
endfunction

function DCG_cloneSelectionBelow()
	let l:lineStart = line("'<") "start of the selection
	let l:lineEnd = line("'>") "end of the selection
	"
	if(line(".") == l:lineEnd) "makes sure it only runs once
		let l:selection = DCG_get_visual_selection_lines()
		"
		"let l:pos = getpos(".")
		"go to end of file
		"exec ":" . l:lineEnd
		"put l:selection at end of file
		put =l:selection
		"return to position
		"call setpos(".", l:pos)
		"
		"gv goes to the last visual selection. delete the selection (into the black hole register).
		"exec "normal! gv" . "\"_d"
		exec "normal! gv"
	endif
endfunction


"duplicate line
nnoremap <leader>d :call DCG_cloneLineBelow()<CR>
vnoremap <leader>d :call DCG_cloneSelectionBelow()<CR>






"disables all easymotion plug shortcuts (there are a lot and I only need a few)
nmap <leader><leader> <NOP>
nmap <leader><leader> <Plug>(easymotion-w)
"word above/below
nmap <leader>i <Plug>(easymotion-k)
vmap <leader>i <Plug>(easymotion-k)
nmap <leader>k <Plug>(easymotion-j)
vmap <leader>k <Plug>(easymotion-j)
"word in line
nmap <leader>j <Plug>(easymotion-b)
vmap <leader>j <Plug>(easymotion-b)
nmap <leader>l <Plug>(easymotion-w)
vmap <leader>l <Plug>(easymotion-w)




nnoremap <leader>p :set paste!<CR>









































"the echo command should be fairly cross platform.  Probably.
function g:DCG_writeTextToFileCommand(path, content)
	return "echo " . shellescape(a:content) . " > " . a:path
endfunction
function g:DCG_writeTextToFile(path, content)
	call system(s:writeTextToFileCommand(a:path, a:content))
endfunction

"requires unix-like OS
function g:DCG_readAllTextFromFileCommand(path)
	return "cat " . a:path
endfunction

function g:DCG_spawnProc(proc, args)
	exec "!" . "gnome-terminal -x " . a:proc . " " . join(a:args, " ")
endfunction



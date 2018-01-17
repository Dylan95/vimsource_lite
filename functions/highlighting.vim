"example usage:
"let s:group_current = "group_current"
"call s:initializeGroup(s:group_current, "blue")
"
"call clearmatches()
"call s:setGroup(s:group_current, s:nodePattern(l:current))



function g:DCG_initializeGroup(groupName, color)
	silent exec "highlight " . a:groupName . " ctermbg=" . a:color
endfunction

"let s:matchNone = "/\%0l/"
"function g:DCG_clearGroup(groupName)
	"call s:setGroup(a:groupName, s:matchNone)
"endfunction


function g:DCG_setGroup(groupName, pattern)
	let l:deliminatedPattern = "/" . a:pattern . "/"
	exec "match " . a:groupName . " " . l:deliminatedPattern
endfunction
function g:DCG_addToGroup(groupName, pattern)
	call matchadd(a:groupName, a:pattern)
	"exec "matchadd " . a:groupName . " " . a:pattern
endfunction


function g:DCG_matchRange(startLine, startCol, endLine, endCol)
	let l:startColInclude = a:startCol-1
	let l:endColInclude = a:endCol+1
	"
	if(a:startLine == a:endLine)
		return("\\%>" . l:startColInclude . "c" . "\\%<" . l:endColInclude . "c" . "\\%" . a:startLine . "l")
	else
		let l:afterStartLine = "\\%>" . a:startLine . "l"
		let l:beforeEndLine = "\\%<" . a:endLine . "l"
		let l:afterStartColOnStartLine = "\\%>" . l:startColInclude . "c" . "\\%" . a:startLine . "l"
		let l:beforeEndColOnEndLine = "\\%<" . l:endColInclude . "c" . "\\%" . a:endLine . "l"
		return((l:afterStartLine . "\\&" . l:beforeEndLine) . "\\|" . l:afterStartColOnStartLine . "\\|" . l:beforeEndColOnEndLine)
	endif
endfunction

function g:DCG_matchPosition(line, col)
	"return("\\%" . a:col . "c" . "\\%" . a:line)
	return(DCG_matchRange(a:line, a:col, a:line, a:col))
endfunction







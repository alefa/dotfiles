function! RFolds()
	let thisline = getline(v:lnum)
	if match(thisline, '^#.\{-1,} -\{-3,}$') >= 0
		return ">1"
	else
		return "="
	endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=RFolds()

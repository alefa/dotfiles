" Forward search from (Neo)Vim to Evince (requires evince_dbus.py in ~/bin):
" function! ForwardSearch()
"     let filename = bufname("%")
"     let lineno = line(".")
"     for syncfile in split(system('zgrep -l "' . filename . '" *.synctex.gz'), "\n")
"         let pdffile = substitute(syncfile, ".synctex.gz$", ".pdf", "")
"         exec 'silent ! python /home/gita/bin/evince_dbus.py ' .
"             \ '"' . pdffile . '" ' . lineno . ' "' . filename . '"'
"     endfor
" endfunction

" nnoremap <buffer> <LocalLeader>e :silent! call ForwardSearch()<CR>

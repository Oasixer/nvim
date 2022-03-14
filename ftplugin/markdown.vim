" let b:delimitMate_matchpairs = "(:),[:],{:},<:>,```:```"
let b:delimitMate_nesting_quotes = ['`']

function! CheckIfBulletPoint()
    " let pos=getpos(".")
    " let win=winsaveview()
    " if first non whitespace character is * or -
    if getline(".") =~ '\s*\(\*\|\-\)'
        " copy first char
        norm yyp^lDA 
        startinsert!
    else 
        norm! o
        startinsert!
    endif
endfunction   

nmap <buffer><silent> o :call CheckIfBulletPoint()<CR>
" inoremap <buffer><silent> <CR> <Esc>:call CheckIfBulletPoint()<CR>

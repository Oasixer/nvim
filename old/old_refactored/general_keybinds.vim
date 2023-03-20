" VANILLA BINDINGS --------------------------------------
"bind redo to U ( tags: UNDO, REDO)
nnoremap U <C-r>

"------------------------------------------------------------
" YANK, PASTE, DELETE, PUT, PRINT RELATED ---------------------------------------------
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
nnoremap Y y$

nnoremap <silent><Leader>j :set paste<CR>m`o<Esc>`:set nopaste<CR>
nnoremap <silent><Leader>k :set paste<CR>m`O<Esc>`:set nopaste<CR>
nnoremap <silent><Leader>J m`j"_dd`
nnoremap <silent><Leader>K m`k"_dd``

"Yanking and putting to and from clipboard
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nmap <Leader>Y "+Y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p

" Override g; so that if we are already at the most recent edit, we hit g;
" again. to go to the actual last edit that wasn't where we currently are
function! OverrideGotoLastEdit()
    if IsNerdTreeCurrentBuffer()
        return
    endif
    let line_orig = line(".")
    " execute 'Silent normal! g;'
    try
        normal! g;
    catch /E664:/
      echom "Empty changelist"
    endtry
    if line(".") == line_orig
        " execute 'Silent normal! g;'
        try
            normal! g;
        catch /E664:/
          echom "Empty changelist"
        endtry
    endif
endfunction
map <silent> g; :call OverrideGotoLastEdit()<CR>

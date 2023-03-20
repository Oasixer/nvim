setlocal ts=2 sw=2 expandtab smartindent

let b:ale_fixers = ['']
let b:ale_linters = ['']


" ------------------------------------------------------------------------
" This script is for switching between headers and implementation in c/cpp,
" but it is much less effective than the plugin vim-fswitch so we just use
" that instead. -----------------------------------------
" fun! s:switchBetweenHeaderAndImplementation()
  " if match(expand('%'), '\.\(c\|cc\|cpp\)$') > 0
    " let target = 'header'
    " let search_pattern = substitute(expand('%:t'), '\.c\(.*\)$', '.h*', '')
  " elseif match(expand('%'), '\.\(h\|hpp\)$') > 0
    " let target = 'implementation'
    " let search_pattern = substitute(expand('%:t'), '\.h\(.*\)$', '.c*', '')
  " else
    " echo 'Failed to switch to header or implementation for this file'
    " retu
  " endif
  " let dir_name = fnamemodify(expand('%:p'), ':h')
  " let cmd = 'find ' . dir_name .  ' . -type f ' .
        " \ '-iname ' . search_pattern . ' -print -quit'
  " let file_name = substitute(system(cmd), '\n$', '', '')
  " if filereadable(file_name)
    " exe 'e ' file_name
  " else
    " echo 'No ' . target . ' file found for ' . expand('%:t')
  " endif
" endf
" nnoremap <silent> <leader>o :call <SID>switchBetweenHeaderAndImplementation()<CR>

" s is for swap :)
" These keybinds are designed to match those of NerdTree for the sake of
" muscle memory. So Enter is cur window, i is hsplit, s is vsplit
nnoremap <silent><buffer> <leader>s<CR> :FSHere<cr>
nnoremap <silent><buffer> <leader>si :FSSplitAbove<cr>
nnoremap <silent><buffer> <leader>ss :FSSplitLeft<cr>

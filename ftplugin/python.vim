" Python -----------------
" Make a string into an f string and return to original position
" (overwrites u mark!)
nnoremap <buffer> <Leader>fs mu:s/\(\W\)\(['"]\)/\1f\2<CR>:noh<CR>`ul

setlocal ts=4 sw=4 expandtab smartindent
setlocal colorcolumn=80

let b:ale_fixers = ['yapf']


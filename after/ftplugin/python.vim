" Python -----------------
" Make a string into an f string and return to original position
" (overwrites u mark!)
nnoremap <buffer> <Leader>fs mu:s/\(\W\)\(['"]\)/\1f\2<CR>:noh<CR>`ul

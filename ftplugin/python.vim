" Python -----------------
" Make a string into an f string and return to original position
" (overwrites u mark!)
nnoremap <buffer> <Leader>fs mu:s/\(\W\)\(['"]\)/\1f\2<CR>:noh<CR>`ul

setlocal ts=4 sw=4 expandtab smartindent
setlocal colorcolumn=80

let b:ale_fixers = ['yapf']
<<<<<<< HEAD
=======

nnoremap <buffer><silent> <Leader>fp :s/print(\(.*\))/\1/e<CR>^iprint(<Esc>A)<Esc>$hvi)yif'<Esc>$i: {<Esc>pa}'<Esc>
>>>>>>> 16e6d527f95f429af34f23aecd51d664c1ca43cd

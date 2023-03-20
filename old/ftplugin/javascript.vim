" log selected var w/ name in quotes in second statement
command! Clog norm <Esc>oconsole.log("<Esc>pa");<Esc>oconsole.log(<Esc>pa);<Esc>
iabbrev <buffer> clog console.log('');<Esc>F'
iabbrev <buffer> clog2 console.log(`: ${}`);<Esc>F:
iabbrev <buffer> clog3 console.log(`: ${}`);<Esc>F:Pf{p$
iabbrev <buffer> forEach forEach(function (i) {<CR><CR>});<Esc>k
iabbrev <buffer> foreach forEach(function (i) {<CR><CR>});<Esc>k
iabbrev <buffer> forEach2 forEach(function (i, n) {<CR><CR>});<Esc>k
iabbrev <buffer> foreach2 forEach(function (i, n) {<CR><CR>});<Esc>k
iabbrev <buffer> forin for (const property in object) {<CR>console.log(`${property}: ${object[property]}`);<CR>}
iabbrev <buffer> forin2 for (const property in <Esc>pa) {<CR>console.log(`${property}: ${<Esc>pa[property]}`);<CR>}

nnoremap <buffer><silent> <Leader>fp :s/print(\(.*\))/\1/e<CR>^iprint(<Esc>A)<Esc>$hvi)yif'<Esc>$i: ${<Esc>pa}'<Esc>:s/print(\(.*\))/console.log(\1);/
setlocal ts=2 sw=2 noexpandtab smartindent

let b:ale_fixers = ['eslint', 'prettier']
let b:ale_linters = ['eslint']

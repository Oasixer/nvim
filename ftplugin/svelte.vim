setlocal ts=2 sw=2 noexpandtab formatoptions+=ro

" comment at end of line
" nnoremap <buffer> <Leader>ch A <!--  --><Esc>3hi

" comment in front and behind block
" also the dumbest fuckin script i've ever written
" command! -nargs=1 -range HB norm <line2>Go<!-- End of <args><Esc>b:s/>//ge<CR>A --><Esc>:s/>>$/>/ge<CR><line1>GO<<Esc>:s/>//ge<CR>a!-- Start of <args><Esc>bA --><Esc><line1>G

" nnoremap <buffer> <Leader>cb vat:HB 
" vnoremap <buffer> <Leader>cb :HB 

"  -------------------------------------------------
" A totally seperate block commenting command, I forget what the difference is

" Toggle block comment (call)
" function! HtmlCommentToggle()
    " :norm I<!-- 
    " :s/<!-- <!-- //e
    " :norm A -->
    " :s/ --> -->//e
" endfunction

" noremap <Leader>ch :call HtmlCommentToggle()<CR>
"

command! Clog norm <Esc>oconsole.log("<Esc>pa");<Esc>oconsole.log(<Esc>pa);<Esc>
iabbrev <buffer> clog console.log('');<Esc>F'
iabbrev <buffer> clog2 console.log(`: ${}`);<Esc>F:
iabbrev <buffer> clogp console.log(`: ${}`);<Esc>F:Pf{p$
iabbrev <buffer> 4clog $: console.log(`: ${}`);<Esc>F:
iabbrev <buffer> 4clogp $: console.log(`: ${}`);<Esc>F:Pf{p$
iabbrev <buffer> forEach forEach(function (i) {<CR><CR>});<Esc>k
iabbrev <buffer> foreach forEach(function (i) {<CR><CR>});<Esc>k
iabbrev <buffer> forEach2 forEach(function (i, n) {<CR><CR>});<Esc>k
iabbrev <buffer> foreach2 forEach(function (i, n) {<CR><CR>});<Esc>k
iabbrev <buffer> onmount import { onMount } from 'svelte';<CR>onMount(async => {<CR>);
iabbrev <buffer> onMount import { onMount } from 'svelte';<CR>onMount(async => {<CR>});
iabbrev <buffer> forin for (const property in object) {<CR>console.log(`${property}: ${object[property]}`);<CR>}
iabbrev <buffer> forin2 for (const property in <Esc>pa) {<CR>console.log(`${property}: ${<Esc>pa[property]}`);<CR>}
iabbrev <buffer> dispatch import { createEventDispatcher <Right><Right> from 'svelte';<CR>const dispatch = createEventDispatcher();<CR>const dispatchThing = () => {dispatch('thing')};<CR><button on:click={dispatchThing}/

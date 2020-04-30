setlocal ts=2 sw=2 expandtab smartindent

" comment at end of line
nnoremap <buffer> <Leader>ch A <!--  --><Esc>3hi

" comment in front and behind block
" also the dumbest fuckin script i've ever written
command! -nargs=1 -range HB norm <line2>Go<!-- End of <args><Esc>b:s/>//ge<CR>A --><Esc>:s/>>$/>/ge<CR><line1>GO<<Esc>:s/>//ge<CR>a!-- Start of <args><Esc>bA --><Esc><line1>G

nnoremap <buffer> <Leader>cb vat:HB 
vnoremap <buffer> <Leader>cb :HB 

"  -------------------------------------------------
" A totally seperate block commenting command, I forget what the difference is

" Toggle block comment (call)
function! HtmlCommentToggle()
    :norm I<!-- 
    :s/<!-- <!-- //e
    :norm A -->
    :s/ --> -->//e
endfunction

noremap <Leader>ch :call HtmlCommentToggle()<CR>

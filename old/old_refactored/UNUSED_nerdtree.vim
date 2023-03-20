" Plug 'scrooloose/nerdtree'

" NERDTREE ------------------------------------------
"open nerdtree on vim startup
" autocmd vimenter call LaunchNerdtreeIfNotDisabled()

function! IsNerdTreeEnabled()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

"show hidden files by default
let NERDTreeShowHidden=1

"close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowLineNumbers=0

"nerd tree toggle
noremap <silent> <C-n> :NERDTreeToggle<CR>

" nerd tree focus
noremap <silent> <A-1> :call NerdTreeFocus()<CR>

function! NerdTreeFocus()
    if IsNerdTreeEnabled()
        if IsNerdTreeCurrentBuffer() == 0
            norm 15h 
        endif
    else
        echo "nerdtree closed"
        exe "NERDTreeToggle"
    endif
endfunction

" open Nerd Tree in folder of file in active buffer
map <Leader>ncd :NERDTree %:p:h<CR>

function! IsNerdTreeCurrentBuffer()
    return (expand('%') =~ 'NERD_Tree')
endfunction

function! GotoBookmarks()
    if IsNerdTreeEnabled()
        if IsNerdTreeCurrentBuffer() == 0
            norm 15h 
        endif
    else
        echo "nerdtree closed"
        exe "NERDTreeToggle"
    endif
    if getline(3) =~ "----------Bookmarks----------"
        norm 3G
    else
        norm B
    endif

    " norm B
endfunction

" Super janky way of defining this mapping but I couldnt get stupid wordmotion
" to stop overwriting this mapping
autocmd VimEnter * :nnoremap <silent> B :call GotoBookmarks()<CR>
nnoremap <silent> B :call GotoBookmarks()<CR>

function! CopyCWD()
    if IsNerdTreeEnabled() == 1 && IsNerdTreeCurrentBuffer() == 1
        norm yy
        if !isdirectory(getreg("0"))
          let @+= substitute(getreg("0"),'\(^.*\)\/[^\/]*$', '\1', 'i')
        else
          let @+=getreg("0")
        endif
    else
        let @+=expand("%:p:h")
    endif
endfunction

command! CopyCWD call CopyCWD()

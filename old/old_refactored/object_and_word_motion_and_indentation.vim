" SEE ALSO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
" nerdcommenter / commenting settings: general_keybinds.vim
" related plugins:

" indentation based text objects
" Plug 'michaeljsmith/vim-indent-object'

" indentation based movement
" Plug 'jeetsukumaran/vim-indentwise'

" User defined textobjs (required for textobj-entire)
" Plug 'kana/vim-textobj-user'

" Entire textobj
" Plug 'kana/vim-textobj-entire'

"delimitor (auto close brackets) () NOT surround.vim but similar
" Plug 'raimondi/delimitmate'

" highlight current word and all occurances of it
" (useful for predicting wordmotion and shit)
" Plug 'dominikduda/vim_current_word'
" ^^^^^^^^^^^ configured in './appearance.vim'


" treat hyphenated-word-series as a single word
set iskeyword+=-

set ignorecase
set smartcase

set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Indentwise, default keybindings (already enabled) ----------
"<count>ai	An Indentation level and line above.
"<count>ii	Inner Indentation level (no line above).
"<count>aI	An Indentation level and lines above/below.
"<count>iI	Inner Indentation level (no lines above/below).
" ------------------------------------------------------------
"
"  WORDMOTION VIM-WORDMOTION CAMELCASEMOTION CAMELCASEMOTION
"  Bindings for default wordmotion, ie. use vio to select all of wordWord
xnoremap io iw
xnoremap ao aw
onoremap io iw
onoremap ao aw

" TEXTOBJ STUFF VIM-TEXTOBJ ---
" Note: doesnt seem to be working rn
" Note: it does work on windows 10 + neovim as of 2020! neat. I knew I kept
" this for some reason
xmap ae <Plug>(textobj-entire-a)
xmap ie <Plug>(textobj-entire-i)
omap ae <Plug>(textobj-entire-a)
omap ie <Plug>(textobj-entire-i)

" DELIMITMATE STUFF
" DOESNT WORK FOR SOME REASON
"let g:delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:},<:>"
set matchpairs+=<:>
" below: TODO: adapt this aucommand into the ftplugin files for filetype specific
" matchpairs
" au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" key bindings for avoiding delimitmate
inoremap <A-[> [
inoremap <A-]> ]
inoremap <A-(> (
inoremap <A-)> )
inoremap <A-"> "
inoremap <A-'> '


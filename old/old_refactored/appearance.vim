" SEE ALSO:
" comment appearance: nerdcommenter settings in 

colorscheme onedark

let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name',
    \   'filename': 'LightlineFilename'},
    \ }



" highlighting highlight search
" set hlsearch
set nohlsearch

" Make esc hide highlights
nnoremap <silent> <Esc> :noh<CR>

" CURRENT WORD CURRENTWORD
" from plugin: Plug 'dominikduda/vim_current_word'

" highlight twins of current word
let g:vim_current_word#highlight_twins = 1

" highlight the word under cursor:
let g:vim_current_word#highlight_current_word = 1

 " delay in ms
let g:vim_current_word#highlight_delay = 300

" also seems kinda ugly? wsl 2023
" styling
hi CurrentWord guibg=#101010 
hi CurrentWordTwins guibg=#202060
"hi CurrentWord guifg=#XXXXXX guibg=#XXXXXX gui=underline,bold,italic ctermfg=XXX ctermbg=XXX cterm=underline,bold,italic
"                      └┴┴┴┴┴──┐     └┴┴┴┴┤     └┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┤         └┴┤         └┴┤       └┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┤
"   gui-vim font color hex code│          │   gui-vim special styles│           │           │ console-vim special styles│
"   ───────────────────────────┘          │   ──────────────────────┘           │           │ ──────────────────────────┘
"        gui-vim background color hex code│     console-vim font term color code│           │
"        ─────────────────────────────────┘     ────────────────────────────────┘           │
"                                                     console-vim background term color code│
"                                                     ──────────────────────────────────────┘


" line number related------------------------------------
set number
" turn hybrid line numbers on
set number relativenumber
"set nu rnu

" turn hybrid line numbers off
set nonumber norelativenumber
"set nonu nornu

" toggle hybrid line numbers
set number! relativenumber!

" always show signcolumns (for breakpoint symbols etc)
set signcolumn=yes
" -------------------------------------------------------

" CSS COLORIZER
let g:colorizer_fgcontrast = 0
" for customization of: Plug 'lilydjwg/colorizer'


" comments related:
" NERDCOMMENTER COMMENTING COMMENTS
" ---------------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact sexy comments (<space>cs)
let g:NERDCompactSexyComs = 1
" /* compact sexy comment example (in c)
"  * compact sexy comment example (in c) */

" use alt comment by default (use // by default in c)
let g:NERDAltDelims_c = 1
let g:NERDAltDelims_cpp = 1

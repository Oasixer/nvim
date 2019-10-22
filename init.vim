let mapleader = ","
syntax on

call plug#begin('~/.config/nvim/plugged')
" below are some vim plugin for demonstration purpose
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"According to github.com/joshdick/onedark.vim,
"Installing the sheerun/vim-polyglot plug-in is recommended for improved
"syntax highlighting for various languages, but is not required.
Plug 'sheerun/vim-polyglot'

Plug 'itchyny/lightline.vim'

Plug 'httpsj//tpope.io/vim/surround.git'
Plug 'https://tpope.io/vim/repeat.git'


"https://github.com/joshdick/onedark.vim

call plug#end()

"Terminal-mode has its own |:tnoremap| namespace for mappings, this can be used
"to automate any terminal interaction.

"To map <Esc> to exit terminal-mode: >
"tnoremap <Esc> <C-\><C-n>
"tnoremap <Leader>c <Esc><C-o>

"bind redo to U
nnoremap U <C-r>


"To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"To use `ALT+{h,j,k,l}` to navigate windows from any mode: >
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-c> :close<CR>
cnoremap <A-c> <C-u>close<CR>


"Use Alt+t to open terminal
"C:\Program Files\Git\bin\bash.exe"

nnoremap <Leader>tt :term "C:\Users\MoffettS\AppData\Local\Programs\Git\bin\bash.exe"<CR>i
nnoremap <A-t> :vsplit<CR>:term "C:\Users\MoffettS\AppData\Local\Programs\Git\bin\bash.exe"<CR>i
inoremap <A-t> <Esc>:vsplit<CR>:term "C:\Users\MoffettS\AppData\Local\Programs\Git\bin\bash.exe"<CR>i

nnoremap <A-f> :vs .<Home>

"Use <Leader>rl to reload init.vim & echom reloaded
nnoremap <Leader>rl :source ~\.config\nvim\init.vim<CR>
echom "reloaded"

"Use <Leader>init to edit init.vim
nnoremap <Leader>init :vsplit<CR>:e ~\.config\nvim\init.vim<CR>

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:netrw_keepdir=0

let g:lightline = {
\ 'colorscheme': 'onedark',
\ }

colorscheme onedark
"let g:airline_theme='onedark'
set noshowmode
"colorscheme NeoSolarized

" highlighting
set hlsearch

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


set number
" turn hybrid line numbers on
set number relativenumber
"set nu rnu

" turn hybrid line numbers off
set nonumber norelativenumber
"set nonu nornu

" toggle hybrid line numbers
set number! relativenumber!
"set nu! rnu!

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
 
"------------------------------------------------------------
nnoremap <leader>y "*y
nnoremap <leader>Y "*Y
nnoremap <leader>p "*p
nnoremap <leader>P "*P


" ------------------ Line numbers
"set relative numbers
nnoremap <Leader>nr :set number relativenumber<CR>
"set absolute numbers
nnoremap <Leader>na :set nonumber norelativenumber<CR>:set number<CR>
"set no numbers
nnoremap <Leader>nn :set nonumber<CR>


"cabbrev docs ~\Documents
"echom "test"
"----------------- pc specific
if expand("$USERNAME") == "MoffettS"
    "@work
    echom "loading work stuff"
    cabbrev kyb ~\Documents\KYB_Form\KYB_FORM
    cabbrev init ~\.config\nvim\init.vim
    nnoremap <Leader>kb i<C-c>kb<CR>
    tnoremap <Leader>kb <C-c>kb<CR>
    " doesnt work
    "nnoremap <Leader>cdk :e kyb<CR>
    nnoremap <Leader>ff vf{%zf
else
    "not @work
    echom "not loading work stuff"
endif


"----------------------------

"binding Leader d to discard & delete (aka save it to reg 9)
nnoremap <Leader>d "9d
nnoremap bh "9dd

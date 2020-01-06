call plug#begin('~/.config/nvim/plugged') "PLUGINS ----------------------------------
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'

"colour scheme
Plug 'w0ng/vim-hybrid'

" Polyglot syntax highlighting for various languages
Plug 'sheerun/vim-polyglot'

" Svelte syntax highlighting (integrates w/ polyglot)
Plug 'evanleck/vim-svelte'

" SCSS syntax highlighting
Plug 'cakebaker/scss-syntax.vim'

" Lightline (lightweight status line)
Plug 'itchyny/lightline.vim'

" show git branch info on lightline
Plug 'itchyny/vim-gitbranch'

"camelCase and snake_case motion for words
Plug 'chaoren/vim-wordmotion'

" surround (for enclosing '/"/(/[/{/< features)
Plug 'tpope/vim-surround'

" provides additional action repeating features
Plug 'https://tpope.io/vim/repeat.git'

"autocomplete via COC
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}

Plug 'davidhalter/jedi-vim'

"bunch of snippets
Plug 'honza/vim-snippets'

"delimitor (auto close brackets)
Plug 'raimondi/delimitmate'

"nerdtree (file browser)
Plug 'scrooloose/nerdtree'

" nerd commenter
Plug 'scrooloose/nerdcommenter'

" Paint css colors with the real color
Plug 'lilydjwg/colorizer'

" Zen coding (abbreviation -> expand to boilerplates)
" isnt this just snippets???
"Plug 'mattn/emmet-vim'

" indentation based text objects
Plug 'michaeljsmith/vim-indent-object'

" indentation based movement
Plug 'jeetsukumaran/vim-indentwise'

"syntax linter
Plug 'dense-analysis/ale'

"latex preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } "ryan

" Jupyter
Plug 'jupyter-vim/jupyter-vim'

" TODOS
"Plug 'aserebryakov/vim-todo-lists'

" Vimwiki (links between pages and shit for note taking)
Plug 'vimwiki/vimwiki'

call plug#end() 
" ------------------------------------------------------------


" SETTINGS/OPTIONS ------------------------------------------------------------
let mapleader = " "
syntax on
syntax enable "ryan

let g:netrw_keepdir=0

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
"suggested by coc documentation --------------------------------------
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

"set ttimeout=10

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
"----------------------------------------------------------------------
colorscheme onedark

set hidden

set noshowmode

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

"--------------------------------------------------------------------

" VANILLA BINDINGS --------------------------------------

"bind redo to U ( tags: UNDO, REDO)
nnoremap U <C-r>

"To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" Switch to a recent buffer and list the recent buffers
nnoremap <Leader>b<space> :ls<CR>:b<space>
nnoremap <Leader>b :ls<CR>:b<space>

" WINDOW / WINDOWS MANAGEMENT/MOVEMENT STUFF ----------------
"Use `ALT+{h,j,k,l}` to navigate windows from any mode: >
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

"Use `ALT+{H,J,K,L}` to move windows (in SPLITS) from any mode:
tnoremap <A-H> <C-\><C-N><C-w>H
tnoremap <A-J> <C-\><C-N><C-w>J
tnoremap <A-K> <C-\><C-N><C-w>K
tnoremap <A-L> <C-\><C-N><C-w>L
inoremap <A-H> <C-\><C-N><C-w>H
inoremap <A-J> <C-\><C-N><C-w>J
inoremap <A-K> <C-\><C-N><C-w>K
inoremap <A-L> <C-\><C-N><C-w>L

nnoremap <A-H> <C-w>H
nnoremap <A-J> <C-w>J
nnoremap <A-K> <C-w>K
nnoremap <A-L> <C-w>L

"Use `ALT+{-, =, _, +}` to vertically resize windows from any mode: >
"Use `ALT+{n, m, N, M}` to horizontally resize windows from any mode: >
nnoremap <A--> :res -1<CR>
nnoremap <A-=> :res +1<CR>
nnoremap <A-_> :res -5<CR>
nnoremap <A-+> :res +5<CR>

nnoremap <A-m> <C-w><lt>
nnoremap <A-n> <C-w>>

nnoremap <A-M> 8<C-w><lt>
nnoremap <A-N> 8<C-w>>

nnoremap <A--> :res -1<CR>
nnoremap <A-=> :res +1<CR>
nnoremap <A-_> :res -5<CR>
nnoremap <A-+> :res +5<CR>

nnoremap <A-m> <C-w><lt>
nnoremap <A-n> <C-w>>

nnoremap <A-M> 8<C-w><lt>
nnoremap <A-N> 8<C-w>>

nnoremap <A-c> :close<CR>
cnoremap <A-c> <C-u>close<CR>
tnoremap <A-c> :close<CR>
" --------------------------------------------
" TAB MANAGEMENT STUFF

" GOTO Tab N
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap <Leader>0 :tablast<CR>

" Switch between last active tab and cur tab
au TabLeave * let g:lasttab = tabpagenr()
vnoremap <silent> <Leader>l :exe "tabn ".g:lasttab<cr>
nnoremap <silent> <Leader>l :exe "tabn ".g:lasttab<cr>

" Shift tab to zero indexed position N
nnoremap <silent> <Leader>! :tabm 0<CR>
nnoremap <silent> <Leader>@ :tabm 1<CR>
nnoremap <silent> <Leader># :tabm 2<CR>
nnoremap <silent> <Leader>$ :tabm 3<CR>
nnoremap <silent> <Leader>% :tabm 4<CR>
nnoremap <silent> <Leader>) :tabm<CR>

 
"------------------------------------------------------------
" Make esc hide highlights
nnoremap <silent> <Esc> :noh<CR>

" Use alt h/j/k/l for :command autocomplete
cnoremap <A-j> <C-n>
cnoremap <A-k> <C-p>
cnoremap <A-l> <space>
cnoremap <A-h> <C-w>


" YANK, PASTE, DELETE, PUT, PRINT RELATED ---------------------------------------------
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
nnoremap Y y$

" DELETING / ADDING NEWLINES (BLANK LINES) ABOVE / BELOW

nnoremap <silent><Leader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><Leader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <silent><Leader>J m`j"_dd``
nnoremap <silent><Leader>K m`k"_dd``

" Bind r to show reg
nnoremap <Leader>r :reg<CR>

"Yanking and putting to and from clipboard
nnoremap <Leader>y "*y
vnoremap <Leader>y "*y
nnoremap <Leader>Y "*Y
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p
nnoremap <Leader>]p "*]p
vnoremap <Leader>]p "*]p
" inoremap <Leader>p <Esc>"*p
" inoremap <Leader>]p <Esc>"*]p
nnoremap <Leader>P "*P
nnoremap <Leader>]P "*]P
" inoremap <Leader>P <Esc>"*P
" inoremap <Leader>]P <Esc>"*]P

" Shortcut for using z reg
nnoremap z "z
vnoremap z "z

" Shortform for blackhole register _
nnoremap _ "_
vnoremap _ "_
" -----------------------------------------------------------------------------

"change cwd to directory of current buffer, for all windows
nnoremap <Leader>cd :cd %:p:h<CR>

"change cwd to directory of current buffer, for cur window
nnoremap <Leader>lcd :lcd %:p:h<CR>

" COMPUTER / PC SPECIFIC -----------------------------------------------------
if expand("$USERNAME") == "MoffettS"
    "@work
    echom "loading work stuff"
    cd ~/Documents
    command! Hterm norm :new<CR>:term "C:\Users\MoffettS\AppData\Local\Programs\Git\bin\bash.exe"<CR>
    command! Vterm norm :vnew<CR>:term "C:\Users\MoffettS\AppData\Local\Programs\Git\bin\bash.exe"<CR>

    "necessary on windows in nvim-qt to make autocomplete dropdown/popupmenu not ugly
    autocmd VimEnter * GuiPopupmenu 0

    " Open init.vim
    command! Vinit vsplit ~\.config\nvim\init.vim
    command! Init e ~\.config\nvim\init.vim
    command! Tinit tabe ~\.config\nvim\init.vim
    command! Hinit split ~\.config\nvim\init.vim

    " RELOAD init.vim 
    command! RL source ~\.config\nvim\init.vim
else
    "not @work
    " Open init.vim
    command! Vinit vsplit ~/.config/nvim/init.vim
    command! Init e ~/.config/nvim/init.vim
    command! Tinit tabe ~/.config/nvim/init.vim
    command! Hinit split ~/.config/nvim/init.vim

    " RELOAD init.vim 
    command! RL source ~/.config/nvim/init.vim
endif
"----------------------------
"

"PLUGIN SHIT--------------------------------------------------------------------------

" NERDTREE ------------------------------------------
"open nerdtree on vim startup
"autocmd vimenter call LaunchNerdtreeIfNotDisabled()

"show hidden files by default
let NERDTreeShowHidden=1

"close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowLineNumbers=0
"nerd tree toggle
noremap <C-n> :NERDTreeToggle<CR>

" open Nerd Tree in folder of file in active buffer
map <Leader>nt :NERDTree %:p:h<CR>
" --------------------------------------------------

" LATEX PREVIEW / LLP-------------------
"live preview toggle (ryan)
"nnoremap <Leader>l :LLPStartPreview
"------------------------------------

" ALE-------------------------------------
" only run linters after saving file
let g:ale_lint_on_text_changed = 'never'
" also don't run when opening file
let g:ale_lint_on_enter = 0

let g:ale_fixers = {'python':['yapf'], 'javascript':['eslint', 'prettier']}
nnoremap <Leader>fix :ALEFix<CR>
let b:ale_fixers = {'javascript': ['eslint', 'prettier'], 'python':['yapf']}
" ----------------------------------------
" COC AUTOCOMPLETE COMPLETION
inoremap <expr> <A-j> pumvisible() ? "\<C-n>" : "\<A-j>"
inoremap <expr> <A-k> pumvisible() ? "\<C-p>" : "\<A-k>"

inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Tab>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" --------------------------------------

" -------------------------------------------------

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

" DELIMITMATE STUFF
" DOESNT WORK FOR SOMEW REASON
"let g:delimitMate_expand_cr = 1

" PYTHON JUPYTER JUPYTER-VIM -------------------------------------------------
let g:jupyter_mapkeys = 0

" Send a selection of lines
nnoremap <buffer> <silent> <Leader>X :JupyterSendCell<CR>

" JEDI AUTOCOMPLETE COMPLETION FUNCTIONS DOCS--------
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 1
let g:jedi#auto_vim_configuration = 0
" Some useful default keybinds: 
" <Leader>d goto definition

"augroup python
    "autocmd!
    "autocmd FileType python setlocal 
"augroup END
"
" NERDCOMMENTER COMMENTING COMMENTS
" ---------------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact sexy comments (<space>cs)
let g:NERDCompactSexyComs = 1


" CSS COLORIZER
let g:colorizer_fgcontrast = 0

" END PLUGIN SHIT -----------------------------------------------

" ---------------------------------------------------------------------------------
" LONG ASS SCRIPTS AND SHIT


" LINE NUMBERING RELATED ---------------------------------------
" Fix relative numbers for nerdtree
function! NoRelNumIfNerdTree()
    let isNERDTreeBuffer = (bufname("%") =~ "NERD_Tree_")?1:0
    if isNERDTreeBuffer
        "no line numbers in nerdtree
        set norelativenumber
    endif
endfunction

"line numbering
set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufEnter,FocusGained,InsertLeave * call NoRelNumIfNerdTree()
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Super useful function that swaps the position of the last two windows
" well technically it swaps the buffers contained in the last two windows
" see below for mapping to active this - i use <Leader>bs
function! WinBufSwap()
  let thiswin = winnr()
  let thisbuf = bufnr("%")
  let lastwin = winnr("#")
  let lastbuf = winbufnr(lastwin)

  exec  lastwin . " wincmd w" ."|".
      \ "buffer ". thisbuf ."|".
      \ thiswin ." wincmd w" ."|".
      \ "buffer ". lastbuf
endfunction

command! Wswap :call WinBufSwap()
map <Leader>bs <C-c>:call WinBufSwap()<CR>

function! s:Surround()
  let chr = nr2char(getchar())
  return "viws" . chr . chr . "\<esc>P"
endfunction

" note: <Nop> or <nop> does nothing, this is so that you can cancel w/ esc
nnoremap yso<esc> <nop>
" note: <SID> tells vim to look ONLY for locally defined mappings in RHS
" note: <expr> tells vim that the rhs is an expression to evaluate
nnoremap <expr> yso <SID>Surround()
" the reason that the binding above is yso is:
" y: the keybind from vim surround to add a surrounding
" s: surrounding
" o: since i use camelCaseWords/motions, o means original definition of a
" word, so that wordWord will all be surrounded instead of just 'word'Word



" Extremely specific command to fix ALE on my windows PC b/c ALE always failes
" to create the temp folder that it needs
command! -nargs=1 ALEDir !C:\Users\MoffettS\AppData\Local\Programs\Git\bin\bash.exe -c "mkdir -p ~/AppData/Local/Temp/1/nvim<args>"

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" VIMWIKI --------------------------------------
let wiki_1 = {}
let wiki_1.path = '~/Documents/notes/'
let wiki_1_syntax = 'markdown'
let wiki_1_ext = '.md'
let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown'}


"------------------------------------------------
" SYNTAX SPECIFIC

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set shiftwidth=4
set expandtab "tab key becomes {shiftwidth} spaces
set smartindent
"  'ts' : number of spaces that <Tab> in file uses (tabstop)
"  'sw'	: number of spaces to use for (auto)indent step (shiftwidth)

" python, 4 spaces
autocmd Filetype python setlocal ts=4 sw=4 expandtab smartindent
autocmd Filetype python nnoremap <buffer> <Leader>fs mu:s/\(\W\)\(['"]\)/\1f\2<CR>:noh<CR>`ul

" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab smartindent

" for svelte files, 2 spaces
autocmd Filetype svelte setlocal ts=2 sw=2 expandtab smartindent

" html comment at end of line
autocmd Filetype html,svelte nnoremap <Leader>ch A <!--  --><Esc>3hi

" html comment in front and behind block
" also the dumbest fuckin script i've ever written
autocmd Filetype html,svelte command! -nargs=1 -range HB norm <line2>Go<!-- End of <args><Esc>b:s/>//ge<CR>A --><Esc>:s/>>$/>/ge<CR><line1>GO<<Esc>:s/>//ge<CR>a!-- Start of <args><Esc>bA --><Esc><line1>G

autocmd Filetype html,svelte nnoremap <Leader>cb vat:HB 
autocmd Filetype html,svelte vnoremap <Leader>cb :HB 

" Html comment out
autocmd Filetype html,svelte vnoremap <Leader>co <Esc>`<I<!--  <Esc>`>A  --><Esc>

" for js files, 2 spaces
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab smartindent
" log selected var w/ name in quotes in second statement
autocmd Filetype javascript,svelte command! Clog norm <Esc>oconsole.log("<Esc>pa");<Esc>oconsole.log(<Esc>pa);<Esc>
autocmd Filetype javascript,svelte iabbrev clog console.log(
autocmd Filetype javascript,svelte iabbrev clog2 $: console.log(`: ${}`);
autocmd Filetype javascript,svelte iabbrev foreach myArray.forEach(function (i, n) {<CR><CR>});

" SCSS SASS SYNTAX HIGHLIGHTING ----------------------
au! BufRead,BufNewFile *.scss setfiletype scss
autocmd Filetype scss setlocal ts=2 sw=2 expandtab smartindent

filetype plugin on


" Things to remember!
" o to switch sides of visual selection!!

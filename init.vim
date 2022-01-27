" if empty(glob('~/.config/nvim/autoload/plug.vim'))
  " silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
let $TMPDIR = "/tmp"
silent exec "!source /etc/profile"
silent exec "!source ~/.bashrc"
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    exec '!curl -fL --create-dirs -o ' . autoload_plug_path . 
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    echo filereadable(autoload_plug_path)
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path
let nerdtree_yank_path = stdpath('config') . '/plugged/nerdtree/nerdtree_plugin/yank_mapping.vim'
let nerdtree_yank_custom_in_root = stdpath('config') . '/nerdtree_custom_yank_mapping.vim'
if !filereadable(nerdtree_yank_path)
    exe '!cp ' . nerdtree_yank_custom_in_root . ' ' . nerdtree_yank_path
    echo filereadable(nerdtree_yank_path)
endif
unlet nerdtree_yank_path
unlet nerdtree_yank_custom_in_root

call plug#begin('~/.config/nvim/plugged') "PLUGINS ----------------------------------
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'

"colour scheme
Plug 'w0ng/vim-hybrid'

"vim git integrations
Plug 'tpope/vim-fugitive'

" Polyglot syntax highlighting for various languages
Plug 'sheerun/vim-polyglot'

" Plug 'burner/vim-svelte'
" Svelte syntax highlighting (integrates w/ polyglot)

" I used to use this one but the indentation is hella broken for me
Plug 'evanleck/vim-svelte'

" CPP syntax highlighting (integrates w/ polyglot)
Plug 'octol/vim-cpp-enhanced-highlight'

" SCSS syntax highlighting
Plug 'cakebaker/scss-syntax.vim'

" go support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Lightline (lightweight status line)
Plug 'itchyny/lightline.vim'

" show git branch info on lightline
Plug 'itchyny/vim-gitbranch'

"camelCase and snake_case motion for words
Plug 'chaoren/vim-wordmotion'

" easymotion, nuff said
Plug 'easymotion/vim-easymotion'

" highlight current word and all occurances of it
" (useful for predicting wordmotion and shit)
Plug 'dominikduda/vim_current_word'

" surround (for enclosing '/"/(/[/{/< features)
Plug 'tpope/vim-surround'

" provides additional action repeating features
Plug 'https://tpope.io/vim/repeat.git'

"syntax linter (Currently using COC for this instead!)
" Plug 'dense-analysis/ale'

"autocomplete via COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" To install language servers after installing release branch (above), just
" Use CocInstall (for list of the coc languageservers i use, see coc section way below)

"Plug 'jackguo380/vim-lsp-cxx-highlight'

"Switch between header and implementation for cpp/c
Plug 'derekwyatt/vim-fswitch' 

" Syntax highlighting for kitty.conf (terminal config for kitty)
Plug 'fladson/vim-kitty'

" Passthrough vim window navigation to kitty terminal
"   note the {} part is to copy some python scripts into .config/kitty for
"   keybinds
Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'}

"bunch of snippets
Plug 'honza/vim-snippets'

"delimitor (auto close brackets) () NOT surround.vim but similar
Plug 'raimondi/delimitmate'

"nerdtree (file browser)
Plug 'scrooloose/nerdtree'

" grep integration with nerdtree
Plug 'MarSoft/nerdtree-grep-plugin'

" nerd commenter
Plug 'scrooloose/nerdcommenter'

" context_filetype for setting up nerd comments with svelte, html, etc
Plug 'Shougo/context_filetype.vim'

" Paint css colors with the real color
Plug 'lilydjwg/colorizer'

" Zen coding (abbreviation -> expand to boilerplates)
" isnt this just snippets???
"Plug 'mattn/emmet-vim'

" indentation based text objects
Plug 'michaeljsmith/vim-indent-object'

" indentation based movement
Plug 'jeetsukumaran/vim-indentwise'

"latex preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } "ryan

" Jupyter
" Plug 'jupyter-vim/jupyter-vim'

" Kotlin
Plug 'udalov/kotlin-vim'

" TODOS
"Plug 'aserebryakov/vim-todo-lists'

" Vimwiki (links between pages and shit for note taking)
Plug 'vimwiki/vimwiki'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" User defined textobjs (required for textobj-entire)
Plug 'kana/vim-textobj-user'

" Entire textobj
Plug 'kana/vim-textobj-entire'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'dbakker/vim-projectroot'

call plug#end() 

" ------------------------------------------------------------


" SETTINGS/OPTIONS ------------------------------------------------------------
let mapleader = " "
syntax on
syntax enable

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

" treat a-word as a single word
set iskeyword+=-

" keep cursor from reaching bottom/top of screen (show context)
set scrolloff=5
"----------------------------------------------------------------------
colorscheme onedark

set hidden

set noshowmode

" highlighting highlight search
" set hlsearch
set nohlsearch

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
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:go_version_warning = 0

" Distinguish <C-i> from <Tab>
" doesnt seem to work for termite, so im disabling this for now
" let &t_TI = "\<Esc>[>4;2m"
" let &t_TE = "\<Esc>[>4;m"

"--------------------------------------------------------------------

" VANILLA BINDINGS --------------------------------------
"bind redo to U ( tags: UNDO, REDO)
nnoremap U <C-r>

" Insert mode related (mostly defaults) --------------------------
inoremap <C-b> <C-o>0
inoremap <C-e> <C-o>$

" FOLD RELATED (Mostly defaults) ------------------
" Defaults
" zr: reduces fold level throughout the buffer
" zR: opens all folds
" zm: increases fold level throughout the buffer
" zM: folds everything all the way
" za: open a fold your cursor is on
" zA: open a fold your cursor is on recursively
" zc: close a fold your cursor is on
" zC: close a fold your cursor is on recursively

" Close all folds except the current one
nno <leader>zv mazMzv`a

" WINDOW / WINDOWS MANAGEMENT/MOVEMENT STUFF ----------------
"Use `ALT+{h,j,k,l}` to navigate windows from any mode: >
" tnoremap <A-h> <C-\><C-N><C-w>h
" tnoremap <A-j> <C-\><C-N><C-w>j
" tnoremap <A-k> <C-\><C-N><C-w>k
" tnoremap <A-l> <C-\><C-N><C-w>l
" inoremap <A-h> <C-\><C-N><C-w>h
" inoremap <A-j> <C-\><C-N><C-w>j
" inoremap <A-k> <C-\><C-N><C-w>k
" inoremap <A-l> <C-\><C-N><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

let g:kitty_navigator_no_mappings = 1

nnoremap <silent> <C-h> :KittyNavigateLeft<cr>
nnoremap <silent> <C-j> :KittyNavigateDown<cr>
nnoremap <silent> <C-k> :KittyNavigateUp<cr>
nnoremap <silent> <C-l> :KittyNavigateRight<cr>

function! MoveWindow(...)
    let wasOpen = 0
    if IsNerdTreeEnabled()
        let wasOpen = 1
        exe "NERDTreeClose"
    endif
    exe "wincmd " . a:1
    if wasOpen == 1
        exe "NERDTreeToggle"
        exe "wincmd p"
    endif
endfunction

"Use `ALT+{H,J,K,L}` to move windows (in SPLITS) from any mode:
nnoremap <A-J> :call MoveWindow("J")<CR>
nnoremap <A-K> :call MoveWindow("K")<CR>
nnoremap <A-L> :call MoveWindow("L")<CR>
nnoremap <A-H> :call MoveWindow("H")<CR>
tnoremap <A-J> <C-\><C-N>:call MoveWindow("J")<CR>
tnoremap <A-K> <C-\><C-N>:call MoveWindow("K")<CR>
tnoremap <A-L> <C-\><C-N>:call MoveWindow("L")<CR>
tnoremap <A-H> <C-\><C-N>:call MoveWindow("H")<CR>
inoremap <A-J> <C-\><C-N>:call MoveWindow("J")<CR>
inoremap <A-K> <C-\><C-N>:call MoveWindow("K")<CR>
inoremap <A-L> <C-\><C-N>:call MoveWindow("L")<CR>
inoremap <A-H> <C-\><C-N>:call MoveWindow("H")<CR>

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

"To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" Switch to a recent buffer and list the recent buffers
nnoremap <Leader>b<space> :ls<CR>:b<space>
nnoremap <Leader>b :ls<CR>:b<space>

" COMMAND LINE STUFF CNOREMAP ETC -----------------------------------------
" defaults:
" <Esc>        abandon command-line without executing it
" CTRL-C       abandon command-line without executing it

" CTRL-B       cursor to begin of command-line
" CTRL-E       cursor to end   of command-line

" CTRL-F       opens the command-line window (unless a different key is specified in 'cedit')

" CTRL-H       delete the character  in front of the cursor (same as <Backspace>)
" CTRL-W       delete the word       in front of the cursor
" CTRL-U       delete all characters in front of the cursor

" CTRL-P       recall previous command-line from history (that matches pattern in front of the cursor)
" CTRL-N       recall next     command-line from history (that matches pattern in front of the cursor)
" <Up>         recall previous command-line from history (that matches pattern in front of the cursor)
" <Down>       recall next     command-line from history (that matches pattern in front of the cursor)
" <S-Up>       recall previous command-line from history
" <S-Down>     recall next     command-line from history
" <PageUp>     recall previous command-line from history
" <PageDown>   recall next     command-line from history

" <S-Left>     cursor one word left
" <C-Left>     cursor one word left
" <S-Right>    cursor one word right
" <C-Right>    cursor one word right
cnoremap <C-h> <S-Left>
cnoremap <C-l> <S-Right>

" Use alt h/j/k/l for :command autocomplete AUTOCOMPLETE
cnoremap <A-j> <C-n>
" cnoremap <A-j> <Down>
cnoremap <A-k> <C-p>
" cnoremap <A-k> <Up>
cnoremap <A-l> <space><backspace>
cnoremap <A-h> <C-w>

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

" YANK, PASTE, DELETE, PUT, PRINT RELATED ---------------------------------------------
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
nnoremap Y y$

" VIMGREP GREPFILES REPFILES grep search related

" VIMGREP vimgrep -------------------------------------
" Shortcuts for using :vimgrep which does NOT replace
vnoremap <Leader>vg "iy:cd %:p:h<CR>:vimgrep /<C-r>i/ *<CR>
nnoremap <Leader>vg :cd %:p:h<CR>:vimgrep // *<Left><Left><Left>
nnoremap <Leader>vn :cnext<CR>
nnoremap <Leader>vN :cprev<CR>

" GREPFILES ------------------------
" RepFiles is a little function that I made that runs a find and
" replace on all the files in the enclosing directory of the current buffer.
"
" Usage :
" Find old and replace with new in directory of cur buffer:
"       using :RepFiles
"               RepFiles /old/new/g
"               
" then use :vn and :vN to go through them

" Find old and replace with new, recursively, in ENCLOSING directory of cur buffer:
"     :RepFiles /old/new/g ../**/*


command! -nargs=+ RepFiles call RepFiles(<f-args>)
function! RepFiles( ... )
    cd %:p:h
    let curFile = expand("%")
    if (a:0 < 2)
        arg ./*.*
        args
    else
        " echo a:2
        execute printf('arg %s', a:2)
        args
    endif
    execute printf('argdo %%substitute%s | update', a:1)
    execute printf('edit %s', curFile)
endfunction

" C-r to find and replace word under cursor like <C-r><C-w> but for original
" words (not affected by camelCaseMotion from wordmotion
nnoremap <C-r> "ryiw:%s/\<r\>//g<Left><Left>

" DELETING / ADDING NEWLINES (BLANK LINES) ABOVE / BELOW

nnoremap <silent><Leader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><Leader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <silent><Leader>J m`j"_dd``
nnoremap <silent><Leader>K m`k"_dd``

" Bind r to show reg
nnoremap <Leader>r :reg<CR>

"Yanking and putting to and from clipboard
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nmap <Leader>Y "+Y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
nnoremap <Leader>]p "+]p
nnoremap <Leader>[p "+[p
vnoremap <Leader>]p "+]p
vnoremap <Leader>[p "+[p
nnoremap <Leader>]P "+]P
nnoremap <Leader>[P "+[P
vnoremap <Leader>]P "+]P
vnoremap <Leader>[P "+[P
nnoremap <Leader>P "+P
nnoremap <Leader>]P "+]P

" Yanking and putting to and from the text selection register
nnoremap <Leader><A-y> "*y 
vnoremap <Leader><A-y> "*y
nmap <Leader><A-Y> "*Y
nnoremap <Leader><A-p> "*p
vnoremap <Leader><A-p> "*p
nnoremap <Leader>]<A-p> "*]p
nnoremap <Leader>[<A-p> "*[p
vnoremap <Leader>]<A-p> "*]p
vnoremap <Leader>[<A-p> "*[p
nnoremap <Leader>]<A-P> "*]P
nnoremap <Leader>[<A-P> "*[P
vnoremap <Leader>]<A-P> "*]P
vnoremap <Leader>[<A-P> "*[P
nnoremap <Leader><A-P> "*P
nnoremap <Leader>]<A-P> "*]P

" Shortcut for using z reg
nnoremap <Leader>z "z
vnoremap <Leader>z "z

" Shortform for blackhole register _
nnoremap _ "_
vnoremap _ "_
" -----------------------------------------------------------------------------
"change cwd to directory of current buffer, for all windows
nnoremap <Leader>cd :cd %:p:h<CR>

"change cwd to directory of current buffer, for cur window
nnoremap <Leader>lcd :lcd %:p:h<CR>

"yank absolute path of current buffer to clipboard
nnoremap <Leader>yd :let @+=expand("%:p:h")<CR>

command! Vinit vsplit ~/.config/nvim/init.vim
command! Init e ~/.config/nvim/init.vim
command! Tinit tabe ~/.config/nvim/init.vim
command! Hinit split ~/.config/nvim/init.vim

command! Vnotes vsplit ~/notes
command! Notes e ~/notes
command! Tnotes tabe ~/notes
command! Hnotes split ~/notes

command! Vgit vsplit ~/notes/git.md
command! Ngit e ~/notes/git.md
command! Tgit tabe ~/notes/git.md
command! Hgit split ~/notes/git.md

" RELOAD init.vim 
command! RL source ~/.config/nvim/init.vim
"

"PLUGIN SHIT--------------------------------------------------------------------------
" makes easymotion global searches work w/ smartcase
let g:EasyMotion_smartcase = 1

" CURRENT WORD CURRENTWORD
" highlight twins of current word
let g:vim_current_word#highlight_twins = 1

" highlight the word under cursor:
let g:vim_current_word#highlight_current_word = 1

 " delay in ms
let g:vim_current_word#highlight_delay = 300

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

"FZF

nnoremap <silent> <C-g> :ProjectRootExe Ag<cr>
" nnoremap <silent> <C-h> :cd %:p:h<cr>:Gr<cr>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
command! -bang -nargs=* Gr call fzf#vim#grep(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
" nnoremap <leader>rc :ProjectRootCD<cr>
" nnoremap <silent> <c-s-h> :ProjectRootExe Files<CR>
nnoremap <silent> <C-f> :ProjectRootExe GFiles<CR>
" nnoremap <silent> <C-g>g :ProjectRootExe GGrep<CR>
" nnoremap <silent> <C-S-a> :ProjectRootExe Ag<CR>
" nnoremap <silent> <C-a> :Ag<CR>

" function! RipgrepFzf(query, fullscreen)
  " let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  " let initial_command = printf(command_fmt, shellescape(a:query))
  " let reload_command = printf(command_fmt, '{q}')
  " let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  " call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction

" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" nnoremap <C-g>r :ProjectRootExe RG<CR>

" nnoremap <leader>dp :ProjectRootCD<cr>
" command! -bang -nargs=* GGrep
  " \ call fzf#vim#grep(
  " \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  " \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" nnoremap <A-a> :AGInParentGitRepo
" command! -bang -nargs=* AGInParentGitRepo
  " \ call fzf#vim#grep(
  " \   'ag -r --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  " \   fzf#vim#with_preview(), <bang>0)

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" NERDTREE ------------------------------------------
"open nerdtree on vim startup
" autocmd vimenter call LaunchNerdtreeIfNotDisabled()

function! IsNerdTreeEnabled()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

function! FindParentGitRepo()
    let dir = finddir('.git/..', expand('%:p:h').';')
    return dir
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


" --------------------------------------------------

" LATEX PREVIEW / LLP-------------------
"live preview toggle (ryan)
"nnoremap <Leader>l :LLPStartPreview
"------------------------------------

" ALE LINTING LINTERS (NOT USED) FIXING FIXERS (NOT USED) COMPLETION (NOT USED)-------------------------------------

" only run linters after saving file
" let g:ale_lint_on_text_changed = 'never'

" also don't run when opening file
" let g:ale_lint_on_enter = 0

" Only run linters named in ale_linters settings.
" let g:ale_linters_explicit = 1

" nnoremap <Leader>fix :ALEFix<CR>
" ----------------------------------------
" COC AUTOCOMPLETE COMPLETION COC-SETTINGS LANGUAGESERVERS COC SETTINGS
" COC-PLUGINS COC PLUGINS

" Language servers (install using, for example, :CocInstall coc-css)
" coc-snippets
" coc-css
" coc-html
" coc-java
" coc-python
" coc-word
" coc-svelte
" coc-clangd
" coc-json
"
let g:coc_disable_startup_warning = 1

" Map alt j and alt k to up and down in the autocomplete popup (if the
" autocomplete popup is open), otherwise just leave them the same
" inoremap <expr> <A-j> pumvisible() ? "\<C-n>" : "\<A-j>"
" inoremap <expr> <A-k> pumvisible() ? "\<C-p>" : "\<A-k>"
" EDIT ^^^ NEVERMIND, JUST USE ARROW KEYS NOW

" Map tab to confirm the selected completion if the autocomplete menu is open,
" otherwise just leave it as tab
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Tab>"

" Map Alt+l to confirm the selected completion if the autocomplete menu is open,
" inoremap <silent><expr> <A-l> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<A-l>"

" Coc Restart
command! CRL CocRestart

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Note: you can use a seperate config file for CoC, but I was having MEGA bugs
" with that
" COC-SETTINGS
let g:coc_user_config = {
  \ "diagnostic.errorSign": '⚠',
  \ "diagnostic.warningSign": '⚐',
  \ "diagnostic.infoSign": '⚐',
  \ "diagnostic.hintSign": '⚐',
  \ "diagnostic.signOffset": 9999,
  \ "coc.preferences.enableFloatHighlight": v:false,
  \ "clangd.disableDiagnostics": 0,
  \ "python.analysis.diagnosticEnabled": 1,
  \ "python.linting.flake8Enabled": 1,
  \ "python.linting.flake8Args": ["--ignore=F401"],
  \ "coc.preferences.rootPatterns": [".git", ".vim", ".vscode"],
  \ "python.linting.pylintEnabled": 1,
  \ "python.linting.pylintArgs": ["--max-line-length=79", "--disable=C0103", "--disable=E0401"],
  \ "python.linting.pylintUseMinimalCheckers": 1,
  \ "python.formatting.provider": "yapf",
  \ "python.formatting.yapfArgs": ["--style={ based_on_style: yapf, indent_width: 4, column_limit: 79 }"],
  \ "python.analysis.disabled": ["import-error"],
  \ }
" Note: disableDiagnostics disables linting for that language server
" \ "python.linting.pylintArgs": ["--max-line-length=79", "--disable=C0103", "--disable=E0401", "--load-plugins", "pylint_flask", "pylint_flask_sqlalchemy"],
"  "python.linting.flake8Args": ["--disable=F401", "--append-config='${workspaceFolder}/.flake8'"],

" Use gD to show documentation in preview window
nnoremap <silent> gD :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" GoTo code navigation (COC)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <Leader>gd :split<CR><A-j><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

function! CustomCOCPythonFormatting()
    call CocAction('runCommand', 'editor.action.organizeImport')
    call CocAction('format')
endfunction

" Add `:Format` command to format current buffer. and Pyformat for python
command! -nargs=0 PyFormat :call CustomCOCPythonFormatting()
command! -nargs=0 Pyformat :call CustomCOCPythonFormatting()
command! -nargs=0 Format :call CocAction('format')

" Add `:SI` command for sort/organize imports of the current buffer.
" PYTHON SORT IMPORTS
command! -nargs=0 SI :call CocAction('runCommand', 'editor.action.organizeImport')


nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
nmap <silent> <leader>ef <Plug>(coc-diagnostic-first)
nnoremap <silent> <leader>ed :CocCommand python.enableLinting<CR>
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

" PYTHON JUPYTER JUPYTER-VIM -------------------------------------------------
let g:jupyter_mapkeys = 0

" Send a selection of lines
nnoremap <buffer> <silent> <Leader>X :JupyterSendCell<CR>

" JEDI AUTOCOMPLETE COMPLETION FUNCTIONS DOCS--------
" let g:jedi#completions_enabled = 0
" let g:jedi#show_call_signatures = 1
" let g:jedi#auto_vim_configuration = 0

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

" CSS COLORIZER
let g:colorizer_fgcontrast = 0

" GO SHIT FOR vim-go --------------------------------------------------------
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save     
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor     
let g:go_fmt_autosave = 0             " autoformat on save

" --------------------------NERDCOMMENTER SET UP svelte, vue.js, html

" svelte-vim vim-svelte setup indent shit
let g:svelte_indent_script = 1
let g:vim_svelte_plugin_load_full_syntax = 1


if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#filetypes = {}
endif
let g:context_filetype#filetypes.svelte =
\ [
\   {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
\   {
\     'filetype': 'typescript',
\     'start': '<script\%( [^>]*\)\? \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>',
\     'end': '</script>',
\   },
\   {'filetype' : 'css', 'start' : '<style \?.*>', 'end' : '</style>'},
\ ]

let g:ft = ''
fu! NERDCommenter_before()
  if (&ft == 'html') || (&ft == 'svelte') || (&ft == 'vue')
    let g:ft = &ft
    let cfts = context_filetype#get_filetypes()
    if len(cfts) > 0
      if cfts[0] == 'svelte'
        let cft = 'html'
      elseif cfts[0] == 'scss'
        let cft = 'css'
      else
        let cft = cfts[0]
      endif
      exe 'setf ' . cft
    endif
  endif
endfu
fu! NERDCommenter_after()
  if (g:ft == 'html') || (g:ft == 'svelte') || (g:ft == 'vue')
    exec 'setf ' . g:ft
    let g:ft = ''
  endif
endfu


" END PLUGIN SHIT -----------------------------------------------

" ---------------------------------------------------------------------------------
" LONG ASS SCRIPTS AND SHIT
"
" SVELTE+SCSS COMPONENT CREATOR---------------------------------------------------

command! -nargs=1 SvNew call SvNew(<q-args>)
function! SvNew( ... )
  if !IsNerdTreeCurrentBuffer()
    echo "Must be in nerdtree!"
    return
  endif
  " create directory
  exe "normal ma" . a:1 . "/"
  " create svelte file in that dir
  exe "normal ma" . a:1 . ".svelte"
  " create scss file in that dir
  exe "normal ma" . a:1 . ".scss"
  " open directory in new tab
  exe "normal /" . a:1 . "t"
  " open svelte file
  exe "normal 2j"

  let svelteContent = ["<script>",
      \"  import Xyz from '../Xyz.svelte'",
      \"</script>",
      \"<style src='" . a:1 . ".scss" . "'></style>"]
  call append(line('$'), svelteContent)

  " delete empty line @ top of file
  normal ggdd
endfunction

" python print helper
" -nargs=? is for 0 to 1 arg
command! -nargs=? PP call PythonPrint(<f-args>)
function! PythonPrint( ... )
  echo a:0
  if a:0 > 0
    let b:var = a:1
  else
    let b:var = getreg("0")
  endif
  let content = "print(f'" . b:var . ": {" . b:var . "}')"
  call append(line('.'), content)
endfunction

" python print helper (w/ type)
" -nargs=? is for 0 to 1 arg
command! -nargs=? PPT call PythonPrintType(<f-args>)
function! PythonPrintType( ... )
  echo a:0
  if a:0 > 0
    let b:var = a:1
  else
    let b:var = getreg("0")
  endif
  let content = "print(f'" . b:var . ": {" . b:var . "}, type: {type(". b:var .")}')"
  call append(line('.'), content)
endfunction
" How to make stuff ACTUALLY silent (this is not needed for GUI vim but I only
" use that in windows, so I need this for linux.
command! -nargs=1 Silent
\   execute 'silent!' . <q-args>
\ | execute 'redraw!'

" LINE NUMBERING RELATED ---------------------------------------
" Fix relative numbers for nerdtree
function! NoRelNumIfNerdTree()
    if IsNerdTreeCurrentBuffer()
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

" fill rest of line with characters
function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 80 | endif
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction

" use f12 to fill hyphens up to col 80
map <F12> $:call FillLine('-')<CR>

" Override g; so that if we are already at the most recent edit, we hit g;
" again. to go to the actual last edit that wasn't where we currently are
map <silent> g; :call OverrideGotoLastEdit()<CR>
function! OverrideGotoLastEdit()
    if IsNerdTreeCurrentBuffer()
        return
    endif
    let line_orig = line(".")
    " execute 'Silent normal! g;'
    try
        normal! g;
    catch /E664:/
      echom "Empty changelist"
    endtry
    if line(".") == line_orig
        " execute 'Silent normal! g;'
        try
            normal! g;
        catch /E664:/
          echom "Empty changelist"
        endtry
    endif
endfunction

" Display tabs as green, spaces as white
function! ToggleWhitespace()
  if &filetype == 'whitespace'
    exe "setlocal ft=" . b:oldft
  else
    let b:oldft = &filetype
    setlocal ft=whitespace
  endif
endfunction
  
command! ToggleWhitespace :call ToggleWhitespace()
command! TW :call ToggleWhitespace()


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
  if chr == '}' || chr=='{'
      return "viws" . "{" . "}". "\<esc>P"
  elseif chr == ')' || chr=='('
      return "viws" . "(" . ")". "\<esc>P"
  elseif chr == '>' || chr=='<'
      return "viws" . "<" . ">". "\<esc>P"
  elseif chr == ']' || chr=='['
      return "viws" . "[" . "]". "\<esc>P"
  else
      return "viws" . chr . chr . "\<esc>P"
  endif
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
" command! -nargs=1 ALEDir !C:\Users\MoffettS\AppData\Local\Programs\Git\bin\bash.exe -c "mkdir -p ~/AppData/Local/Temp/1/nvim<args>"


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
let wiki_1_ext = '.wiki'
let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.wiki': 'markdown'}

" VIM-MARKDOWN --------------------------------
set conceallevel=2
let g:vim_markdown_fenced_languages = ['bash=sh', 'python', 'css', 'js=javascript', 'vim', 'git']
let g:vim_markdown_folding_disabled = 1

" PLATFORM / OS /OPERATING SYSTEM SPECIFIC:
" WINDOWS ONLY
if(has('win32'))
    " On windows I use Neovim-qt, and the default path in vim is wherever you
    " started, which is great for consoles, but really annoying when I open
    " the program in windows using a desktop shortcut
    cd ~
    " reminder: to move nerdtree to CWD, use CD in nerdtree window

    " Extremely specific command to copy the filetype specific (ftplugin, equiv to after\ftplugin) script folder to
    " the runtimepath location that it is looking for the folder in on windows.
    " also, copy the coc-settings file, if one exists
    " (super duper hardcoded for my current windows machine)
    silent exec "!robocopy C:\\Users\\Kaelan\\.config\\nvim\\ftplugin C:\\Users\\Kaelan\\AppData\\Local\\nvim\\ftplugin"
    " silent exec "!robocopy C:\\Users\\Kaelan\\.config\\nvim C:\\Users\\Kaelan\\AppData\\Local\\nvim coc-settings.json"
    " command! CopyFtplugin !robocopy C:\\Users\\Kaelan\\.config\\nvim\\ftplugin C:\\Users\\Kaelan\\AppData\\Local\\nvim\\ftplugin

    " Necessary on windows in nvim-qt to make autocomplete dropdown/popupmenu not ugly
    autocmd! VimEnter * GuiPopupmenu 0
endif
    

"------------------------------------------------
" INDENTATION
" filetype specific -> Moved to ftplugin/*.vim

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
" set shiftwidth=2
" set expandtab "tab key becomes {shiftwidth} spaces
" set smartindent
"  'ts' : number of spaces that <Tab> in file uses (tabstop)
"  'sw'	: number of spaces to use for (auto)indent step (shiftwidth)

" SCSS SASS SYNTAX HIGHLIGHTING ----------------------
au! BufRead,BufNewFile *.scss setfiletype scss
autocmd FileType scss setl iskeyword+=@-@

filetype plugin on
exe "set ft=" . &filetype

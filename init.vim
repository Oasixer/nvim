call plug#begin('~/.config/nvim/plugged') "PLUGINS ----------------------------------
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'

"colour scheme
Plug 'w0ng/vim-hybrid'

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Polyglot syntax highlighting for various languages
Plug 'sheerun/vim-polyglot'
Plug 'evanleck/vim-svelte'

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

"camelCase and snake_case motion for words
Plug 'chaoren/vim-wordmotion'

Plug 'tpope/vim-surround'
Plug 'https://tpope.io/vim/repeat.git'

"autocomplete via COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}

"delimitor (auto close brackets)
Plug 'raimondi/delimitmate'

"nerdtree (file browser) 
Plug 'scrooloose/nerdtree'

"terminal integration
"Plug 'wvffle/vimterm' "ryan

"syntax linter
"Plug 'w0rp/ale' "ryan
"same thing - not sure which one works
Plug 'dense-analysis/ale'

"latex
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } "ryan
call plug#end() " ---------------------------------------------------------------


" SETTINGS/OPTIONS ------------------------------------------------------------
let mapleader = ","
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
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ }
"suggested by coc documentation --------------------------------------
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

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

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set shiftwidth=4
set softtabstop=4
set expandtab

"open nerdtree on vim startup
autocmd vimenter * NERDTree

"show hidden files by default
let NERDTreeShowHidden=1

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowLineNumbers=0

" DOESNT WORK---------------------------
"To map <Esc> to exit terminal-mode: >
"tnoremap <Esc> <C-\><C-n>
"tnoremap <Leader>c <Esc><C-o>
"--------------------------------------

"bind redo to U
nnoremap U <C-r>

"To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" WINDOW / WINDOWS MANAGEMENT/MOVEMENT STUFF -----------------------
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

nnoremap <A--> :res -1<CR>
nnoremap <A-=> :res +1<CR>
nnoremap <A-_> :res -5<CR>
nnoremap <A-+> :res +5<CR>

nnoremap <A-m> <C-w><lt>
nnoremap <A-n> <C-w>>

" cant map A-< so just use m since its left of less than
nnoremap <A-M> 8<C-w><lt>
nnoremap <A-N> 8<C-w>>

nnoremap <A--> :res -1<CR>
nnoremap <A-=> :res +1<CR>
nnoremap <A-_> :res -5<CR>
nnoremap <A-+> :res +5<CR>

nnoremap <A-m> <C-w><lt>
nnoremap <A-n> <C-w>>

" cant map A-< so just use m since its left of less than
nnoremap <A-M> 8<C-w><lt>
nnoremap <A-N> 8<C-w>>

nnoremap <A-c> :close<CR>
cnoremap <A-c> <C-u>close<CR>
tnoremap <A-c> :close<CR>

"--------------------------------------------

"Use Alt+t to open terminal
"C:\Program Files\Git\bin\bash.exe"

"todo: put this in the 
nnoremap <Leader>tt :term "C:\Users\MoffettS\AppData\Local\Programs\Git\bin\bash.exe"<CR>i
nnoremap <A-t> :vsplit<CR>:term "C:\Users\MoffettS\AppData\Local\Programs\Git\bin\bash.exe"<CR>i
inoremap <A-t> <Esc>:vsplit<CR>:term "C:\Users\MoffettS\AppData\Local\Programs\Git\bin\bash.exe"<CR>i

"nnoremap <A-f> :vs .<Home>

nnoremap <Leader>b :ls<CR>:b<space>

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

 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <Esc> :noh<CR>
 
"------------------------------------------------------------


" ------------------ Line numbers
"set relative numbers
nnoremap <Leader>nr :set number relativenumber<CR>
"set absolute numbers
nnoremap <Leader>na :set nonumber norelativenumber<CR>:set number<CR>
"set no numbers
nnoremap <Leader>nn :set nonumber<CR>

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


"cabbrev docs ~\Documents
"----------------- pc specific
"The username on windows - update this when changing computers later
if expand("$USERNAME") == "MoffettS"
    "@work
    echom "loading work stuff"
    cabbrev kyb ~\Documents\KYB_Form\KYB_FORM
    cd ~/Documents
    nnoremap <Leader>kb i<C-c>kb<CR>
    tnoremap <Leader>kb <C-c>kb<CR>
    " doesnt work
    "nnoremap <Leader>cdk :e kyb<CR>
    nnoremap <Leader>ff vf{%zf

    "necessary on windows in nvim-qt to make autocomplete dropdown/popupmenu not ugly
    GuiPopupmenu 0

else
    "not @work
endif
"----------------------------

nnoremap <Leader>rl :source ~\.config\nvim\init.vim<CR>

"Use <Leader>init to edit init.vim in vsplit
nnoremap <Leader>vinit :vsplit<CR>:e ~\.config\nvim\init.vim<CR>
nnoremap <Leader>tinit :tabe ~\.config\nvim\init.vim<CR>
nnoremap <Leader>init :e ~\.config\nvim\init.vim<CR>
nnoremap <Leader>hinit :spl ~\.config\nvim\init.vim<CR>


" PASTING SHIT---------------------------------------------------------
" Ctrl-J/K deletes blank line below/above, and C-j/k inserts.
" from https://vim.fandom.com/wiki/Quickly_adding_and_deleting_empty_lines
nnoremap <silent><C-J> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-K> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
inoremap <silent><C-J> <Esc>:m`:silent +g/\m^\s*$/d<CR>``:noh<CR>i
inoremap <silent><C-K> <Esc>:m`:silent -g/\m^\s*$/d<CR>``:noh<CR>i
inoremap <silent><C-j> <Esc>:set paste<CR>m`o<Esc>``:set nopaste<CR>i
inoremap <silent><C-k> <Esc>:set paste<CR>m`O<Esc>``:set nopaste<CR>i

" Bind r to show reg
nnoremap <Leader>r :reg<CR>

"Yanking and putting to and from clipboard
nnoremap <leader>y "*y
nnoremap <leader>Y "*Y
nnoremap <leader>p "*p
nnoremap <leader>]p "*]p
inoremap <leader>p <Esc>"*p
inoremap <leader>]p <Esc>"*]p
nnoremap <leader>P "*P
nnoremap <leader>]P "*]P
inoremap <leader>P <Esc>"*P
inoremap <leader>]P <Esc>"*]P

" Shortcut for using z reg
nnoremap z "z
vnoremap z "z

nnoremap _ "_
" -----------------------------------------------------------------------------

"change cwd to directory of current buffer, for all windows
nnoremap <Leader>cd :cd %:p:h<CR>

"change cwd to directory of current buffer, for cur window
nnoremap <Leader>lcd :lcd %:p:h<CR>


"PLUGIN SHIT--------------------------------------------------------------------------

"nerd tree toggle
noremap <C-n> :NERDTreeToggle<CR>

" open Nerd Tree in folder of file in active buffer
map <Leader>nt :NERDTree %:p:h<CR>

"live preview toggle (ryan)
"nnoremap <Leader>l :LLPStartPreview

" only run linters after saving file
let g:ale_lint_on_text_changed = 'never'
" also don't run when opening file
let g:ale_lint_on_enter = 0

let g:ale_fixers = ['yapf']
"['prettier', 'eslint']

""autocomplete via coc " (Ryans version) -------------------------------
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
"
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" --------------------------------------------------------------------


"auto complete shit (default version)
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"
" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

"" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"
"" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Create mappings for function text object, requires document symbols feature of languageserver.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)
"
"" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)
"
"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')
"
"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Using CocList
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>




" LONG ASS SCRIPTS AND SHIT

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

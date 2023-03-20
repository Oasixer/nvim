"latex preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } "ryan

"syntax linter (Currently using COC for this instead!)
" Plug 'dense-analysis/ale'

" go support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Plug 'burner/vim-svelte'
" Svelte syntax highlighting (integrates w/ polyglot)

" I used to use this one but the indentation is hella broken for me
" Plug 'evanleck/vim-svelte'

Plug 'dbakker/vim-projectroot'

Plug 'nvim-lua/plenary.nvim' " req for harpoon
Plug 'ThePrimeagen/harpoon'


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Vimwiki (links between pages and shit for note taking)
Plug 'vimwiki/vimwiki'

" TODOS
"Plug 'aserebryakov/vim-todo-lists'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Kotlin
Plug 'udalov/kotlin-vim'

" grep integration with nerdtree
Plug 'MarSoft/nerdtree-grep-plugin'

"nerdtree (file browser)
Plug 'scrooloose/nerdtree'
" context_filetype for setting up nerd comments with svelte, html, etc
" Plug 'Shougo/context_filetype.vim'

" Zen coding (abbreviation -> expand to boilerplates)
" isnt this just snippets???
"Plug 'mattn/emmet-vim'

"Plug 'jackguo380/vim-lsp-cxx-highlight'


"Switch between header and implementation for cpp/c
" Plug 'derekwyatt/vim-fswitch' 

" Syntax highlighting for kitty.conf (terminal config for kitty)
" Plug 'fladson/vim-kitty'
" Passthrough vim window navigation to kitty terminal
"   note the {} part is to copy some python scripts into .config/kitty for
"   keybinds
Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'}

"bunch of snippets
Plug 'honza/vim-snippets'


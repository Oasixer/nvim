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
"let g:coc_disable_startup_warning = 1
"
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


 python print helper (w/ type)
 -nargs=? is for 0 to 1 arg
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

" let g:go_version_warning = 0

" Distinguish <C-i> from <Tab>
" doesnt seem to work for termite, so im disabling this for now
" let &t_TI = "\<Esc>[>4;2m"
" let &t_TE = "\<Esc>[>4;m"


" Insert mode related (mostly defaults) --------------------------
inoremap <C-b> <C-o>0
inoremap <C-e> <C-o>$


function! FindParentGitRepo()
    let dir = finddir('.git/..', expand('%:p:h').';')
    return dir
endfunction


call plug#begin('~/.config/nvim/plugged') "PLUGINS ----------------------------------
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'

"colour scheme
Plug 'w0ng/vim-hybrid'


"Plug 'scrooloose/nerd-commenter'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'

" Plug 'francoiscabrol/ranger.vim' " integration with ranger.vim but limited, see https://www.reddit.com/r/vim/comments/8x4glu/vimnetranger_a_good_alternative_to_nerdtree/
" Plug 'rbgrouleff/bclose.vim' " depencency of ranger.vim
" Plug 'ipod825/vim-netranger'
" Plug 'nvim-lua/plenary.nvim'
Plug 'ipod825/libp.nvim'
" Plug 'ipod825/ranger.nvim'


"vim git integrations
Plug 'tpope/vim-fugitive'

" Polyglot syntax highlighting for various languages
Plug 'sheerun/vim-polyglot'

" CPP syntax highlighting (integrates w/ polyglot)
Plug 'octol/vim-cpp-enhanced-highlight'

" SCSS syntax highlighting
Plug 'cakebaker/scss-syntax.vim'

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

" provides additional action repeating features
Plug 'https://tpope.io/vim/repeat.git'

"autocomplete via COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" To install language servers after installing release branch (above), just
" Use CocInstall (for list of the coc languageservers i use, see coc section way below)

" Paint css colors with the real color
Plug 'lilydjwg/colorizer' " settings: ./appearance.vim

"delimitor (auto close brackets) () NOT surround.vim but similar
Plug 'raimondi/delimitmate'

" indentation based text objects
Plug 'michaeljsmith/vim-indent-object'

" indentation based movement
Plug 'jeetsukumaran/vim-indentwise'

" User defined textobjs (required for textobj-entire)
Plug 'kana/vim-textobj-user'

" Entire textobj
Plug 'kana/vim-textobj-entire'
call plug#end() 
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/basic_settings_no_keybinds.vim
source ~/.config/nvim/general_keybinds.vim
source ~/.config/nvim/appearance.vim
source ~/.config/nvim/autocomplete_and_intellisense.vim
source ~/.config/nvim/filesystem.vim
source ~/.config/nvim/object_and_word_motion_and_indentation.vim
source ~/.config/nvim/buf_navigation.vim
source ~/.config/nvim/old_idk_innocuous.vim
source ~/.config/nvim/UNUSED_nerdtree.vim


nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>aC  <Plug>(coc-codeaction-cursor)
nmap <leader>gd <Plug>(coc-definition)
" luafile ~/.config/nvim/lua_stuff.lua
" lua require("libp").setup()
" lua require("ranger").setup()
" lua local foo = 1

""let g:ranger_rifle_path = join(stdpath('config'), 'settings/rifle.conf')
"nnoremap <leader>f :call s:esearch()<CR>
"nnoremap <leader>ip :call s:rename()<CR>
"nnoremap <leader>pp :call s:paste()<CR>
"
"function! s:esearch() abort
"    let [bufnr, node] = call(ranger#action#utils#get_cur_buffer_and_node(), [])
"    let paths = empty(node.abspath) ? getcwd() : node.abspath
"    call call('esearch#init', [{'paths': paths, 'root_markers': []}])
"endfunction
"
"function! s:rename() abort
"    call ranger#action#rename(get(g:, 'cur_env', {}).get('ranger_rename_fn', function('libp.fs.uv.fs_rename')))
"endfunction
"
"function! s:paste() abort
"    let copy_fn = get(g:, 'cur_env', {}).get('ranger_copy_fn', function('libp.fs.copy'))
"    let rename_fn = get(g:, 'cur_env', {}).get('ranger_rename_fn', function('libp.fs.uv.fs_rename'))
"    call ranger#action#transfer#paste({
"                \ 'copy_fn': copy_fn,
"                \ 'rename_fn': rename_fn,
"                \ })
"endfunction

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


function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction


" SCSS SASS SYNTAX HIGHLIGHTING ----------------------
au! BufRead,BufNewFile *.scss setfiletype scss
autocmd FileType scss setl iskeyword+=@-@

filetype plugin on
exe "set ft=" . &filetype

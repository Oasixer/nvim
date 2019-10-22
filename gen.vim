let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~\Documents\KYB_Form\KYB_FORM
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 serve.py
badd +1 front/src/InForm.svelte
badd +1 sqlOb.py
badd +0 ~\nvim\Neovim\bin\$KYB
badd +1 ~/Documents/KYB_Form/
badd +0 front/src/App.svelte
badd +0 front/src/Change.svelte
badd +0 globdb.py
badd +0 front/src/Modal.svelte
badd +0 front/src/utils.js
argglobal
%argdel
edit front/src/App.svelte
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
3wincmd h
wincmd w
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
wincmd w
wincmd w
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
3wincmd k
wincmd w
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 59 + 120) / 240)
exe '2resize ' . ((&lines * 27 + 28) / 56)
exe 'vert 2resize ' . ((&columns * 60 + 120) / 240)
exe '3resize ' . ((&lines * 5 + 28) / 56)
exe 'vert 3resize ' . ((&columns * 60 + 120) / 240)
exe '4resize ' . ((&lines * 20 + 28) / 56)
exe 'vert 4resize ' . ((&columns * 60 + 120) / 240)
exe 'vert 5resize ' . ((&columns * 59 + 120) / 240)
exe '6resize ' . ((&lines * 21 + 28) / 56)
exe 'vert 6resize ' . ((&columns * 59 + 120) / 240)
exe '7resize ' . ((&lines * 21 + 28) / 56)
exe 'vert 7resize ' . ((&columns * 59 + 120) / 240)
exe '8resize ' . ((&lines * 5 + 28) / 56)
exe 'vert 8resize ' . ((&columns * 59 + 120) / 240)
exe '9resize ' . ((&lines * 4 + 28) / 56)
exe 'vert 9resize ' . ((&columns * 59 + 120) / 240)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 49 - ((48 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
49
normal! 0
wincmd w
argglobal
if bufexists("serve.py") | buffer serve.py | else | edit serve.py | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 2 - ((1 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
lcd ~\Documents\KYB_Form\KYB_FORM
wincmd w
argglobal
if bufexists("~/Documents/KYB_Form/KYB_FORM/sqlOb.py") | buffer ~/Documents/KYB_Form/KYB_FORM/sqlOb.py | else | edit ~/Documents/KYB_Form/KYB_FORM/sqlOb.py | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 2 - ((0 * winheight(0) + 2) / 5)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
lcd ~\Documents\KYB_Form\KYB_FORM
wincmd w
argglobal
if bufexists("~/Documents/KYB_Form/KYB_FORM/globdb.py") | buffer ~/Documents/KYB_Form/KYB_FORM/globdb.py | else | edit ~/Documents/KYB_Form/KYB_FORM/globdb.py | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~\Documents\KYB_Form\KYB_FORM
wincmd w
argglobal
if bufexists("~/Documents/KYB_Form/KYB_FORM/front/src/Change.svelte") | buffer ~/Documents/KYB_Form/KYB_FORM/front/src/Change.svelte | else | edit ~/Documents/KYB_Form/KYB_FORM/front/src/Change.svelte | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 20 - ((19 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
20
normal! 011|
lcd ~\Documents\KYB_Form\KYB_FORM\front\src
wincmd w
argglobal
if bufexists("~/Documents/KYB_Form/KYB_FORM/front/src/InForm.svelte") | buffer ~/Documents/KYB_Form/KYB_FORM/front/src/InForm.svelte | else | edit ~/Documents/KYB_Form/KYB_FORM/front/src/InForm.svelte | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~\Documents\KYB_Form\KYB_FORM\front\src
wincmd w
argglobal
if bufexists("~/Documents/KYB_Form/KYB_FORM/front/src/Modal.svelte") | buffer ~/Documents/KYB_Form/KYB_FORM/front/src/Modal.svelte | else | edit ~/Documents/KYB_Form/KYB_FORM/front/src/Modal.svelte | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~\Documents\KYB_Form\KYB_FORM\front\src
wincmd w
argglobal
if bufexists("~/Documents/KYB_Form/KYB_FORM/front/src/utils.js") | buffer ~/Documents/KYB_Form/KYB_FORM/front/src/utils.js | else | edit ~/Documents/KYB_Form/KYB_FORM/front/src/utils.js | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 2) / 5)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~\Documents\KYB_Form\KYB_FORM\front\src
wincmd w
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
lcd ~\Documents\KYB_Form\KYB_FORM\front\src
wincmd w
exe 'vert 1resize ' . ((&columns * 59 + 120) / 240)
exe '2resize ' . ((&lines * 27 + 28) / 56)
exe 'vert 2resize ' . ((&columns * 60 + 120) / 240)
exe '3resize ' . ((&lines * 5 + 28) / 56)
exe 'vert 3resize ' . ((&columns * 60 + 120) / 240)
exe '4resize ' . ((&lines * 20 + 28) / 56)
exe 'vert 4resize ' . ((&columns * 60 + 120) / 240)
exe 'vert 5resize ' . ((&columns * 59 + 120) / 240)
exe '6resize ' . ((&lines * 21 + 28) / 56)
exe 'vert 6resize ' . ((&columns * 59 + 120) / 240)
exe '7resize ' . ((&lines * 21 + 28) / 56)
exe 'vert 7resize ' . ((&columns * 59 + 120) / 240)
exe '8resize ' . ((&lines * 5 + 28) / 56)
exe 'vert 8resize ' . ((&columns * 59 + 120) / 240)
exe '9resize ' . ((&lines * 4 + 28) / 56)
exe 'vert 9resize ' . ((&columns * 59 + 120) / 240)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

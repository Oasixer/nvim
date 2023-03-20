"change cwd to directory of current buffer, for all windows
nnoremap <Leader>cd :cd %:p:h<CR>

"change cwd to directory of current buffer, for cur window
nnoremap <Leader>lcd :lcd %:p:h<CR>

command! Vinit vsplit ~/.config/nvim/init.vim
command! Init e ~/.config/nvim/init.vim
command! Tinit tabe ~/.config/nvim/init.vim
command! Hinit split ~/.config/nvim/init.vim

" RELOAD init.vim 
command! RL source ~/.config/nvim/init.vim



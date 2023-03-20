-- " highlighting highlight search
-- " set hlsearch
-- set nohlsearch

vim.opt.hlsearch = false
vim.g["vim_current_word#highlight_current_word"] = 1
vim.g["vim_current_word#highlight_twins"] = 1
vim.g["vim_current_word#highlight_delay"] = 300

-- vim.api.nvim_exec(
-- [[
--  " Make esc hide highlights
--  nnoremap <silent> <Esc> :noh<CR>
-- 
-- " CURRENT WORD CURRENTWORD
-- " from plugin: Plug 'dominikduda/vim_current_word'
-- 
-- " highlight twins of current word
-- let g:vim_current_word#highlight_twins = 1
-- 
-- " highlight the word under cursor:
-- let g:vim_current_word#highlight_current_word = 1
-- 
--  " delay in ms
-- let g:vim_current_word#highlight_delay = 300
-- ]],
--   true
-- )

vim.keymap.set('n', "<Esc>", ":noh<CR>", {silent=true})

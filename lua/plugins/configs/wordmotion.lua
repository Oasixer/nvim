local status_ok, wordmotion = pcall(require, "vim-wordmotion")
if not status_ok then
  return
end

wordmotion.setup()

local result = vim.api.nvim_exec([[
"  WORDMOTION VIM-WORDMOTION CAMELCASEMOTION CAMELCASEMOTION
"  Bindings for default wordmotion, ie. use vio to select all of wordWord
xnoremap io iw
xnoremap ao aw
onoremap io iw
onoremap ao aw
]])
vim.keymap.set("x", "io", "iw")
print(result) -- 'hello world'

local blahBlah = 1

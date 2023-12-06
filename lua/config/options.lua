-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.cmd([[
  augroup SpellAndWrap
    autocmd!
    autocmd FileType norg setlocal spell wrap
  augroup END
]])

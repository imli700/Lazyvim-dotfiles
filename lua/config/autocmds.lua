-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set local options for norg files
vim.cmd("autocmd FileType norg setlocal spell wrap")

-- Remove 'c', 'r', and 'o' from formatoptions for norg files
vim.cmd([[
  augroup FormatOptions
    autocmd!
    autocmd FileType norg setlocal formatoptions-=cro
  augroup END
]])

-- Remember folds
vim.cmd([[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave ?* mkview
    autocmd BufWinEnter ?* silent! loadview
  augroup END
]])

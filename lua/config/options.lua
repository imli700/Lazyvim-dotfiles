-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.linebreak = true -- Makes sure wraps don't break in-between words
opt.breakindent = true -- Make sure indentation of wrapped lined matches indentation of oringal line

-- let tree_sitter handle folds
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Enable terminal transparency
vim.cmd([[
    highlight Normal ctermbg=none guibg=none
    highlight NonText ctermbg=none guibg=none
]])

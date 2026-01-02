-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.linebreak = true -- Makes sure wraps don't break in-between words
opt.breakindent = true -- Make sure indentation of wrapped lined matches indentation of oringal line
opt.title = true

-- let tree_sitter handle folds
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Enable terminal transparency
vim.cmd([[
    highlight Normal ctermbg=none guibg=none
    highlight NonText ctermbg=none guibg=none
]])

vim.api.nvim_set_keymap(
  "n", -- Normal mode
  "<C-t>", -- The keybinding
  "<Plug>(neorg.qol.todo-items.todo.task-cycle)", -- The Neorg plug key
  { noremap = false, silent = true } -- `noremap` must be false to allow `<Plug>` mappings
)

-- to fix html shiftwidth
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true -- Use spaces, not tabs

-- conceal org files
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

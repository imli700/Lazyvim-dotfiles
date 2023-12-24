-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete the existing mappings for 'n' and 'N'
vim.keymap.del("n", "n")
vim.keymap.del("n", "N")
vim.keymap.del("x", "n")
vim.keymap.del("x", "N")

-- Set 'n' and 'N' to their default behaviors
vim.api.nvim_set_keymap("n", "n", "n", {})
vim.api.nvim_set_keymap("n", "N", "N", {})
vim.api.nvim_set_keymap("x", "n", "n", {})
vim.api.nvim_set_keymap("x", "N", "N", {})

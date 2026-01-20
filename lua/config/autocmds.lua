-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set local options for norg files
vim.cmd("autocmd FileType org setlocal spell wrap")

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

-- clear snacks image cache on every startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local cache_dir = vim.fn.stdpath("cache") .. "/snacks/image"
    vim.fn.delete(cache_dir, "rf")
  end,
})

-- disable automatic org heading continuation
vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function()
    -- Make sure formatoptions doesn’t re-add any list/heading continuations
    vim.opt_local.formatoptions:remove({ "r", "o" })

    -- Remap in org buffers: behave like default o/O (open line + go to insert)
    vim.keymap.set("n", "o", "o", { buffer = true, silent = true })
    vim.keymap.set("n", "O", "O", { buffer = true, silent = true })

    -- Ensure <CR> just inserts a newline (no extra plugin logic)
    vim.keymap.set("n", "<CR>", "i<CR><Esc>", { buffer = true, silent = true })
  end,
})

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
-- Combined Org Mode Configuration
vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function()
    -- --- PART 1: Your Existing Config ---
    vim.opt_local.formatoptions:remove({ "r", "o", "c" })
    vim.opt_local.comments = ""
    vim.keymap.set("n", "o", "o", { buffer = true, silent = true })
    vim.keymap.set("n", "O", "O", { buffer = true, silent = true })
    vim.keymap.set("n", "<CR>", "i<CR><Esc>", { buffer = true, silent = true })

    -- --- PART 2: The Fix for List Indentation (Insert Mode) ---
    vim.keymap.set("i", "<CR>", function()
      local current_line = vim.api.nvim_get_current_line()
      local row = vim.api.nvim_win_get_cursor(0)[1]

      -- Get previous line (handle edge case if we are on first line)
      local prev_line = (row > 1) and vim.api.nvim_buf_get_lines(0, row - 2, row - 1, false)[1] or ""

      -- Pattern to detect a list item (whitespace + hyphen + space)
      local list_pattern = "^%s*-%s"

      -- LOGIC:
      -- 1. If CURRENT line is a list item: Align to hyphen.
      -- 2. If CURRENT line is empty/whitespace AND PREVIOUS line was a list item: Align to hyphen.

      if current_line:match(list_pattern) then
        local indent = current_line:match("^(%s*)")
        return "\r\021" .. indent
      elseif current_line:match("^%s*$") and prev_line:match(list_pattern) then
        -- We are on a blank line, but the line above was a list.
        -- Steal the indentation from the previous line.
        local indent = prev_line:match("^(%s*)")
        return "\r\021" .. indent
      else
        -- For Headings or regular paragraphs, do standard behavior
        return "\r"
      end
    end, { buffer = true, expr = true })
  end,
})

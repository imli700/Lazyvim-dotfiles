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
    -- 1. Aggressively disable internal auto-indenting
    vim.opt_local.indentexpr = ""
    vim.opt_local.smartindent = false
    vim.opt_local.autoindent = false
    vim.opt_local.formatoptions:remove({ "r", "o", "c" })
    vim.opt_local.comments = ""

    -- 2. Normal mode overrides
    vim.keymap.set("n", "o", "o", { buffer = true, silent = true })
    vim.keymap.set("n", "O", "O", { buffer = true, silent = true })
    vim.keymap.set("n", "<CR>", "i<CR><Esc>", { buffer = true, silent = true })

    -- 3. Insert mode: Fixed Logic (keeps behavior, avoids <C-u> issues)
    vim.keymap.set("i", "<CR>", function()
      local current_line = vim.api.nvim_get_current_line()
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))

      -- Safe fetch for previous line: returns string, not table
      local prev_lines = (row > 1) and vim.api.nvim_buf_get_lines(0, row - 2, row - 1, false) or {}
      local prev_line = prev_lines[1] or ""

      -- REQUIRE a real list marker: hyphen followed by at least one space
      local list_pattern = "^%s*-%s+"

      -- Helper to get leading whitespace
      local get_indent = function(str)
        return str:match("^(%s*)") or ""
      end

      local tc = function(keys)
        return vim.api.nvim_replace_termcodes(keys, true, true, true)
      end

      -- Behavior:
      -- * Use <CR> so the line is split at the cursor (normal enter)
      -- * Then use <C-o>0 to run a single Normal-mode command that moves to col 0
      --   on the new line (this is safe and won't delete text), and then
      --   append the stolen indent string so the new line is aligned like before.
      if current_line:match(list_pattern) then
        return tc("<CR><C-o>0") .. get_indent(current_line)
      elseif current_line:match("^%s*$") and prev_line:match(list_pattern) then
        return tc("<CR><C-o>0") .. get_indent(prev_line)
      else
        return tc("<CR>")
      end
    end, { buffer = true, expr = true })
  end,
})

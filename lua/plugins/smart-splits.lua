return {
  "mrjones2014/smart-splits.nvim",
  -- This is the crucial line that fixes the issue.
  -- It tells LazyVim to load this plugin on startup.
  lazy = false,
  opts = {
    -- Keep the 'stop' behavior at the edge of Neovim splits
    at_edge = "stop",
  },
  keys = {
    {
      "<C-h>",
      function()
        require("smart-splits").move_cursor_left()
      end,
      desc = "Move to left split",
    },
    {
      "<C-j>",
      function()
        require("smart-splits").move_cursor_down()
      end,
      desc = "Move to below split",
    },
    {
      "<C-k>",
      function()
        require("smart-splits").move_cursor_up()
      end,
      desc = "Move to above split",
    },
    {
      "<C-l>",
      function()
        require("smart-splits").move_cursor_right()
      end,
      desc = "Move to right split",
    },
  },
}

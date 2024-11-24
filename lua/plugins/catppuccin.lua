return {
  -- Add Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Choose your preferred flavor
        transparent_background = true, -- Enables transparent background
        show_end_of_buffer = false, -- Optional: Hide ~ after end of buffer
        term_colors = false, -- Optional: Disable terminal colors
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
        },
      })
      vim.cmd.colorscheme("catppuccin") -- Apply the colorscheme
    end,
  },
  -- Configure LazyVim to load Catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}

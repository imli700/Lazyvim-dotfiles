return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  -- We'll use the config function to both set up the plugin and apply the colorscheme
  config = function(_, opts)
    -- This will run the setup function with the options defined in `opts`
    require("gruvbox").setup(opts)

    -- It is important to set the colorscheme *after* running setup
    vim.cmd.colorscheme("gruvbox")
  end,
  -- These are the options that will be passed to the setup function
  opts = {
    transparent_mode = true,
    -- You can add other gruvbox options here, for example:
    -- contrast = "hard",
    -- italic = { comments = false },
  },
}

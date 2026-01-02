return {
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "*" },
      user_default_options = {
        mode = "background",
        names = true, -- "blue", "red", etc.
        RGB = true,
        RRGGBB = true,
        RRGGBBAA = true,
        css = true,
        css_fn = true,
      },
    },
  },
}

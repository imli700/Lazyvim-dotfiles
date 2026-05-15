return {
  {
    "folke/noice.nvim",
    opts = {
      messages = {
        view_search = false,
      },
    },
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("hlslens").setup({
        virt_text_pos = "inline",
        fmt_string = " [%s/%s] ",
      })

      -- Creates a distinct, framed layout that instantly pops away from regular code lines
      local distinct_indicator = {
        fg = "#ffffff", -- Sharp, highly readable white text
        bg = "#2e3b4e", -- Muted dark slate blue background block
        force = true,
      }

      vim.api.nvim_set_hl(0, "HlSearchLens", distinct_indicator)
      vim.api.nvim_set_hl(0, "HlSearchLensNear", distinct_indicator)
    end,
  },
}

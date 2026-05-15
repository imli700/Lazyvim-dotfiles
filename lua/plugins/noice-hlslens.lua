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

        -- This native option completely removes all [N 2] / [2N 1] indicators from other lines
        nearest_only = true,
      })

      -- Your preferred high-contrast slate blue indicator style
      local distinct_indicator = {
        fg = "#ffffff", -- Sharp white text
        bg = "#2e3b4e", -- Slate blue background block
        force = true,
      }

      vim.api.nvim_set_hl(0, "HlSearchLens", distinct_indicator)
      vim.api.nvim_set_hl(0, "HlSearchLensNear", distinct_indicator)
    end,
  },
}

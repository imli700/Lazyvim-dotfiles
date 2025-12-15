return {
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = false, -- Fixes the original treesitter error
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
      "3rd/image.nvim",
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.export"] = {},
          ["core.defaults"] = {},
          ["core.autocommands"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                top = "~/Documents/zettelkasten-notes/top/",
                cs50 = "~/Documents/zettelkasten-notes/cs50/",
                projects = "~/Documents/zettelkasten-notes/5th-sem/projects/",
                artificialCognitiveSystem = "~/Documents/zettelkasten-notes/6th-sem/artificialCognitiveSystem/",
                iotAndSmartSensors = "~/Documents/zettelkasten-notes/6th-sem/iotAndSmartSensors/",
                elective = "~/Documents/zettelkasten-notes/6th-sem/elective/",
              },
              default_workspace = "top",
            },
          },

          -- REMOVED ["core.completion"] block to prevent the crash

          ["core.integrations.image"] = {},
          ["core.latex.renderer"] = {
            config = {
              render_on_enter = true,
              dpi = 400,
              conceal = true,
            },
          },
        },
      })

      -- Fix for syntax highlighting (Required since we used version = false)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "norg", "neorg" },
        callback = function()
          if pcall(vim.treesitter.start) then
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}

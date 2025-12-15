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
                essentialMathematicsForMachineLearning = "~/Documents/zettelkasten-notes/swayam/essential-mathematics-for-machine-learning",
                ethicalHacking = "~/Documents/zettelkasten-notes/swayam/ethicalHacking",
                cs50 = "~/Documents/zettelkasten-notes/cs50/",
                advanedWebTechnologies = "~/Documents/zettelkasten-notes/5th-sem/advanced-web-technologies/",
                cloudComputing = "~/Documents/zettelkasten-notes/5th-sem/cloud-computing/",
                dataMining = "~/Documents/zettelkasten-notes/5th-sem/data-mining/",
                foundationOfMachineLearning = "~/Documents/zettelkasten-notes/5th-sem/foundation-of-machine-learning/",
                mobileComputing = "~/Documents/zettelkasten-notes/5th-sem/mobile-computing/",
                machineLearningLab = "~/Documents/zettelkasten-notes/5th-sem/machine-learning-lab/",
                projects = "~/Documents/zettelkasten-notes/5th-sem/projects/",
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

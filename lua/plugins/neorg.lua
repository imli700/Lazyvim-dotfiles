return {
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    dependencies = {
      -- treesitter is required for norg highlighting/parsing
      "nvim-treesitter/nvim-treesitter",

      -- completion engine and some common companion plugins
      "hrsh7th/nvim-cmp", -- completion engine
      "hrsh7th/cmp-nvim-lsp", -- LSP source for cmp (optional but useful)
      "saadparwaiz1/cmp_luasnip", -- snippet source (optional)
      "L3MON4D3/LuaSnip", -- snippet engine (optional, recommended)

      -- canonical image plugin that Neorg integrates with
      -- (image rendering backends use Kitty or ueberzug++ etc.)
      "3rd/image.nvim",
    },
    config = function()
      -- neorg setup: completion engine set to nvim-cmp and image integration enabled
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

          -- enable completion: tell Neorg which engine to use
          -- (Neorg expects this field; engine "nvim-cmp" uses the cmp source provided by Neorg)
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },

          -- enable image integration (uses image.nvim)
          ["core.integrations.image"] = {},

          -- keep latex renderer (it relies on image.nvim too)
          ["core.latex.renderer"] = {
            config = {
              render_on_enter = true,
              dpi = 400,
              conceal = true,
            },
          },
        },
      })
    end,
  },
}

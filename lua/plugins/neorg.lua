return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  dependencies = { "vhyrro/luarocks.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
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
      },
    })
  end,
}

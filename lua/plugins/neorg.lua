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
              swayam = "~/Documents/zettelkasten-notes/swayam/",
              cs50 = "~/Documents/zettelkasten-notes/cs50/",
              advanedWebTechnologies = "~/Documents/zettelkasten-notes/5th-sem/advanced-web-technologies/",
              cloudComputing = "~/Documents/zettelkasten-notes/5th-sem/cloud-computing/",
              dataMining = "~/Documents/zettelkasten-notes/5th-sem/data-mining/",
              foundationOfMachineLearning = "~/Documents/zettelkasten-notes/5th-sem/foundation-of-machine-learning/",
              elective1 = "~/Documents/zettelkasten-notes/5th-sem/elective-1/",
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

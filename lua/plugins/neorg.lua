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
              iot = "~/Documents/zettelkasten-notes/fourth-sem/iot/",
              iotLab = "~/Documents/zettelkasten-notes/fourth-sem/iotLab",
              philosophy = "~/Documents/zettelkasten-notes/fourth-sem/philosophy/",
              javaP = "~/Documents/zettelkasten-notes/fourth-sem/javaProgramming/",
              softwareEngineerig = "~/Documents/zettelkasten-notes/fourth-sem/softwareEngineering/",
            },
            default_workspace = "top",
          },
        },
      },
    })
  end,
}

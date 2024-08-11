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
              NlpAndAi = "~/Documents/zettelkasten-notes/3-semester/nlp-and-ai/",
              evs = "~/Documents/zettelkasten-notes/3-semester/evs/",
              dbms = "~/Documents/zettelkasten-notes/3-semester/dbms/",
              pythonProgramming = "~/Documents/zettelkasten-notes/3-semester/pythong-programming",
              pythonLab = "~/Documents/zettelkasten-notes/3-semester/python-lab",
              dataStructure = "~/Documents/zettelkasten-notes/3-semester/data-structure",
              cs50 = "~/Documents/zettelkasten-notes/cs50/",
            },
            default_workspace = "top",
          },
        },
      },
    })
  end,
}

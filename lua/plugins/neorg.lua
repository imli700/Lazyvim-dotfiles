return {
  "nvim-neorg/neorg",
  lazy = false,
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              top = "~/Documents/zettelkasten-notes/top/",
              communicationSkills = "~/Documents/zettelkasten-notes/2-semester/communication-skills/",
              problemSolvingAndProgramming = "~/Documents/zettelkasten-notes/2-semester/problem-solving-and-programming/",
              computerOrganisationAndAssemblyLanguageProgramming = "~/Documents/zettelkasten-notes/2-semester/computer-organisation-and-assembly-language-programming/",
              cProgrammingLab = "~/Documents/zettelkasten-notes/2-semester/cProgrammingLab/",
            },
            default_workspace = "top",
          },
        },
      },
    })
  end,
}

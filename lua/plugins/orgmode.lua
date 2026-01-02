return {
  -- 1. Setup Treesitter (Ensure 'org' parser is installed)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- Only add 'org' if it's not already in the list
      if type(opts.ensure_installed) == "table" then
        local found = false
        for _, lang in ipairs(opts.ensure_installed) do
          if lang == "org" then
            found = true
          end
        end
        if not found then
          table.insert(opts.ensure_installed, "org")
        end
      end
    end,
  },

  -- 2. Setup Autocompletion (Add 'orgmode' source to nvim-cmp)
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" }, -- Standard deps just in case
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "orgmode" })
    end,
  },

  -- 3. Setup Image Support (For inline images)
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty", -- Change to "ueberzug" if on X11/generic terminal
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki", "org" }, -- Add org here
        },
      },
    },
  },

  -- 4. Main Orgmode Configuration
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
      "nvim-orgmode/org-bullets.nvim",
    },
    config = function()
      require("orgmode").setup({
        -- Paths for Agenda and Capture
        org_agenda_files = {
          "~/Documents/zettelkasten-notes/top/**/*",
          "~/Documents/zettelkasten-notes/cs50/**/*",
          "~/Documents/zettelkasten-notes/5th-sem/projects/**/*",
          "~/Documents/zettelkasten-notes/6th-sem/artificialCognitiveSystem/**/*",
          "~/Documents/zettelkasten-notes/6th-sem/iotAndSmartSensors/**/*",
          "~/Documents/zettelkasten-notes/6th-sem/elective/**/*",
        },
        org_default_notes_file = "~/Documents/zettelkasten-notes/top/refile.org",

        -- Visuals & Syntax
        org_hide_emphasis_markers = true, -- Like concealer
        org_startup_indented = true,
        org_todo_keywords = { "TODO", "NEXT", "|", "DONE", "CANCELLED" },

        -- LaTeX Support
        org_highlight_latex_and_related = "entities",
      })

      -- Optional: Enable nicer bullets
      require("org-bullets").setup()
    end,
  },
}

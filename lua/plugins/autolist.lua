return {
  "gaoDean/autolist.nvim",
  lazy = false, -- Ensure it loads immediately
  ft = { "markdown", "text", "org" },
  config = function()
    local autolist = require("autolist")

    autolist.setup({
      lists = {
        markdown = {
          "[-+*]",
          "%d+[.)]",
          "%a[.)]",
        },
        org = {
          "%*+", -- Matches Org Headings (*, **, ***)
          "[-+]", -- Matches standard bullets (- or +)
          "%d+[.)]", -- Matches Numbers (1. or 1))
          "%a[.)]", -- Matches Letters (a. or A. or a) or A))
          "%u*[.)]", -- (Optional) Matches Roman Numerals (I., II., IV.)
        },
      },
    })

    -- Mappings
    -- <CR> inserts a newline, then the command formats it
    vim.keymap.set("i", "<M-CR>", "<CR><cmd>AutolistNewBullet<cr>")

    -- Normal mode mappings to recalculate/continue lists
    vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
    vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
    vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
  end,
}

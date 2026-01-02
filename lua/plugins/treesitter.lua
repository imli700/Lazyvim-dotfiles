-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Add parsers explicitly to ensure installation, even if they are defaults.
    -- `vim.list_extend` merges with existing defaults.
    vim.list_extend(opts.ensure_installed, {
      "html",
      "css",
      "lua",
      "latex",
      "scss",
      "svelte",
      "typst",
      "vue",
      -- add any other *always wanted* parsers here
    })
  end,
}

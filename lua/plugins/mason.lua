-- lua/plugins/mason.lua
return {
  "mason-org/mason.nvim",
  opts = function(_, opts)
    -- Add LSP servers and other tools to ensure installation.
    -- `vim.list_extend` merges with existing defaults.
    vim.list_extend(opts.ensure_installed, {
      "html-lsp", -- LSP server for HTML
      "css-lsp", -- LSP server for CSS, SCSS, Less
      "lua-language-server", -- LSP server for Lua
      -- add any other *always wanted* mason tools here
    })
  end,
}

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      html = {
        settings = {
          html = {
            format = {
              -- These numbers MUST match the numbers in Step 1
              tabSize = 2,
              insertSpaces = true,
              indentInnerHtml = true, -- Optional: helps with <head> and <body> indentation
              wrapLineLength = 120,
            },
          },
        },
      },
    },
  },
}

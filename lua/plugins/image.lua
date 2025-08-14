-- lua/plugins/image.lua
return {
  "3rd/image.nvim",
  opts = {
    -- Set the backend to 'kitty'. This is the most important step.
    backend = "kitty",
    integrations = {
      neorg = {
        enabled = true,
      },
    },
  },
}

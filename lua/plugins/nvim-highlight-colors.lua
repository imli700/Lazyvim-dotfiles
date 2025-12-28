return {
  "brenoprata10/nvim-highlight-colors",
  event = "VeryLazy", -- Loads the plugin only after startup to keep things fast
  opts = {
    render = "background", -- Shows a small color square next to the hex code
    enable_named_colors = true, -- Highlights "red", "blue", etc.
    enable_tailwind = true, -- Highlights Tailwind CSS classes
  },
}

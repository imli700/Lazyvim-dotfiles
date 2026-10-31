return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      doc = {
        inline = true,
        float = false, -- MUST be false to stop the hover ghosting/overlapping
        max_width = 70,
      },
      math = {
        latex = {
          font_size = "normalsize", -- Options: "small", "normalsize", "large", "Large"
        },
      },
      convert = {
        magick = {
          -- Revert to standard trimming without arbitrary -resize scaling
          math = { "-density", "192", "{src}[0]", "-trim" },
        },
      },
    },
    math = {
      enabled = true,
    },
  },
}

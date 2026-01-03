return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      doc = {
        inline = true, -- Best attempt at keeping it inline
        float = true,
        max_width = 60,
      },
      convert = {
        magick = {
          -- CORRECT ORDER:
          -- 1. -density (BEFORE src): Sets high resolution so it's crisp, not blurry.
          -- 2. {src}[0]: Loads the LaTeX PDF.
          -- 3. -trim: Cuts off white space.
          -- 4. -resize (AFTER src): Shrinks the crisp image to % size.
          math = { "-density", "200", "{src}[0]", "-trim", "-resize", "70%" },
        },
      },
    },
    math = {
      enabled = true,
    },
  },
}

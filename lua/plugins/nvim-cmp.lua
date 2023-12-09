return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- Add your custom configuration here
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- Don't forget to return the opts
    return opts
  end,
}

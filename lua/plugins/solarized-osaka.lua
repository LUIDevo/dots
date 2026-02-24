return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("solarized-osaka").setup({
      transparent = false,    -- MAKE SURE THIS IS FALSE
      -- style = "default",    -- optional, try later
    })
  end,
}

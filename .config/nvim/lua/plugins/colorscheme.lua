return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    local kanagawa = require("kanagawa")

    kanagawa.setup({
      background = {
        dark = "wave",
        light = "lotus"
      },
    })

    vim.cmd("colorscheme kanagawa")
  end
}

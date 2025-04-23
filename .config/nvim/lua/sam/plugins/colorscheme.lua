return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local tokyonight = require("tokyonight")
    tokyonight.setup({
      style = "night",
    })

    vim.cmd("colorscheme tokyonight")
  end
}

--[[
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
}-]]

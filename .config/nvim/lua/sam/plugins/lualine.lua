return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local theme = require("kanagawa.colors").setup().theme
    local lazy_status = require("lazy.status")

    local kanagawa_theme = {}

    kanagawa_theme.normal = {
      a = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
      b = { bg = theme.diff.change, fg = theme.syn.fun },
      c = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
    }

    kanagawa_theme.insert = {
      a = { bg = theme.diag.ok, fg = theme.ui.bg },
      b = { bg = theme.ui.bg, fg = theme.diag.ok },
    }

    kanagawa_theme.command = {
      a = { bg = theme.syn.operator, fg = theme.ui.bg },
      b = { bg = theme.ui.bg, fg = theme.syn.operator },
    }

    kanagawa_theme.visual = {
      a = { bg = theme.syn.keyword, fg = theme.ui.bg },
      b = { bg = theme.ui.bg, fg = theme.syn.keyword },
    }

    kanagawa_theme.replace = {
      a = { bg = theme.syn.constant, fg = theme.ui.bg },
      b = { bg = theme.ui.bg, fg = theme.syn.constant },
    }

    kanagawa_theme.inactive = {
      a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
      b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = "bold" },
      c = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    }

    if vim.g.kanagawa_lualine_bold then
      for _, mode in pairs(kanagawa_theme) do
        mode.a.gui = "bold"
      end
    end

    lualine.setup({
      options = {
        theme = kanagawa_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })

  end,
}

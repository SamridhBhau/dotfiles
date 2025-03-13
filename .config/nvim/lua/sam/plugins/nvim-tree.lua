return {
  "nvim-tree/nvim-tree.lua",
  config = function()

    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local nvimtree = require("nvim-tree")
    nvimtree.setup({
      view = {
        width = 30,
      }

    }) 

    local keymap = vim.keymap

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>");
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>");
  end
}


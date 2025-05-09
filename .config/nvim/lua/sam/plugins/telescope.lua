return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = {
    'nvim-lua/plenary.nvim' ,
    { "nvim-telescope/telescope-fzf-native.nvim", build="make"},
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "BurntSushi/ripgrep",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        }
      }
    })

    --telescope.load_extension("fzf")

    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
    keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>")
    keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

  end

}

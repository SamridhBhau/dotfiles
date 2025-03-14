return {
	{
	"nvim-treesitter/nvim-treesitter",
  event = {"BufReadPre", "BufNewFile"},
	build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
	config = function ()
		local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "cpp" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        autotag  = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
	end
	},
}

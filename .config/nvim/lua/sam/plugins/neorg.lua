return {
  "nvim-neorg/neorg",
  version = "*",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.keybinds"] = {
        config = {
          default_keybinds = true,
        },
      },
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/notes",
          },
          default_workspace = "notes";
        },
      },
    },
    config = true,
  }
}

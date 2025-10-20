return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          "node_modules",
          "bin",
          ".next",
          "obj",
          ".DS_Store",
        },
        never_show = {
          ".git",
        },
        always_show = {},
      },
    },
    window = {
      mappings = {
        ["."] = "toggle_hidden",
        ["zM"] = "close_all_nodes",
        ["-"] = "open_split",
        ["\\"] = "open_vsplit",
      },
    },
  },
}

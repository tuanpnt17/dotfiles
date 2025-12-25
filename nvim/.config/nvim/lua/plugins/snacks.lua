return {
  "folke/snacks.nvim",
  opts = {
    scroll = {
      enabled = false, -- Disable scrolling animations
    },
    explorer = {
      show_hidden = true,
      exclude = {
        "**/.git/*",
        "**/bin/*",
        "**/obj/*",
      }
    },
    picker = {
      show_hidden = true, -- đảm bảo picker cũng hiện .env
    },
  },
}

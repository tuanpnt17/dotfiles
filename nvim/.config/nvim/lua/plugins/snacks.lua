return {
  "folke/snacks.nvim",
  opts = {
    scroll = {
      enabled = false, -- Disable scrolling animations
    },
    explorer = {
      show_hidden = true,
      filter = function(entry)
        local name = vim.fn.fnamemodify(entry.path, ":t")

        -- Nếu là file ẩn như `.env`, `.env.local` → luôn cho phép
        if name:match("^%.env") then
          return true
        end

        -- Ẩn các thư mục rác
        local exclude = {
          ".git",
          "node_modules",
          "bin",
          "obj",
          "target",
          ".DS_Store",
        }

        return not vim.tbl_contains(exclude, name)
      end,
    },
    picker = {
      show_hidden = true, -- đảm bảo picker cũng hiện .env
    },
  },
}

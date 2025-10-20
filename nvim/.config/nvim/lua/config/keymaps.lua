-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Keymap save all files with Ctrl + s
vim.keymap.set({ "n", "i" }, "<C-s>", function()
  vim.cmd("wa")
end, { desc = "Save all files" })

-- vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)

-- Do things without affecting the registers
-- keymap.set("n", "x", '"_x')
-- keymap.set("n", "<Leader>p", '"0p')
-- keymap.set("n", "<Leader>P", '"0P')
-- keymap.set("v", "<Leader>p", '"0p')
-- keymap.set("n", "<Leader>c", '"_c')
-- keymap.set("n", "<Leader>C", '"_C')
-- keymap.set("v", "<Leader>c", '"_c')
-- keymap.set("v", "<Leader>C", '"_C')
-- keymap.set("n", "<Leader>d", '"_d')
-- keymap.set("n", "<Leader>D", '"_D')
-- keymap.set("v", "<Leader>d", '"_d')
-- keymap.set("v", "<Leader>D", '"_D')

-- Delete backward
keymap.set("n", "db", "vbd", opts)

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Split window
keymap.set("n", "sh", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Redo
keymap.set("n", "U", "<C-r>", opts) -- Redo

-- Source file
keymap.set("n", "<Leader>so", ":so %<CR>", opts) -- Source current file

-- Diagnostics
keymap.set("n", "<Leader>ac", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
  if #diagnostics > 0 then
    local message = diagnostics[1].message
    vim.fn.setreg("+", message)
    print("Copied diagnostic: " .. message)
  else
    print("No diagnostic at cursor")
  end
end, { noremap = true, silent = true, desc = "Copy diagnostic message to clipboard" }) -- Copy diagnostic message to clipboard

-- Show diagnostics in a floating window
keymap.set(
  "n",
  "<Leader>af",
  vim.diagnostic.open_float,
  { noremap = true, silent = true, desc = "Show diagnostics in a floating window" }
)

-- Go to next diagnostic
keymap.set("n", "<Leader>an", vim.diagnostic.goto_next, {
  noremap = true,
  silent = true,
  desc = "Go to next error",
})

-- Go to previous diagnostic
keymap.set("n", "<Leader>ap", vim.diagnostic.goto_prev, { desc = "Go to next error" })

-- Toggle autoformat
vim.api.nvim_create_user_command("ToggleAutoformat", function()
  require("custom.lsp").toggleAutoformat()
end, {})

-- dotnet
keymap.set("n", "<leader>qf", "<cmd>cclose<CR>", opts) -- Close quickfix window
keymap.set("n", "<leader>qo", "<cmd>copen<CR>", opts) -- Open quickfix window

-- Load C# utilities
local csharp = require("custom.dotnet")

-- C# Keymaps (chỉ active khi ở file .cs)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    local opts = { buffer = true, desc = "C# " }

    -- Namespace
    vim.keymap.set(
      "n",
      "<leader>c#n",
      csharp.generate_namespace,
      vim.tbl_extend("force", opts, { desc = "C# Generate Namespace" })
    )

    -- Class
    vim.keymap.set(
      "n",
      "<leader>c#c",
      csharp.generate_class,
      vim.tbl_extend("force", opts, { desc = "C# Generate Class" })
    )

    -- Interface
    vim.keymap.set(
      "n",
      "<leader>c#i",
      csharp.generate_interface,
      vim.tbl_extend("force", opts, { desc = "C# Generate Interface" })
    )

    -- Record (C# 9+)
    vim.keymap.set(
      "n",
      "<leader>c#r",
      csharp.generate_record,
      vim.tbl_extend("force", opts, { desc = "C# Generate Record" })
    )

    -- Enum
    vim.keymap.set(
      "n",
      "<leader>c#e",
      csharp.generate_enum,
      vim.tbl_extend("force", opts, { desc = "C# Generate Enum" })
    )

    -- === Which Key ===
    local wk = require("which-key")
    local buffer = vim.api.nvim_get_current_buf()

    wk.add({
      { "<leader>c#", buffer = buffer, group = "󰌛 C#" },
      { "<leader>c#n", buffer = buffer, desc = "Generate Namespace" },
      { "<leader>c#c", buffer = buffer, desc = "Generate Class" },
      { "<leader>c#i", buffer = buffer, desc = "Generate Interface" },
      { "<leader>c#r", buffer = buffer, desc = "Generate Record" },
      { "<leader>c#e", buffer = buffer, desc = "Generate Enum" },
    })
  end,
})

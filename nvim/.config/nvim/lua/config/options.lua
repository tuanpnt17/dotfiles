-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- Disable some default options
vim.opt.showtabline = 0
vim.opt.spell = false
vim.opt.spelllang = {}
vim.g.lazyvim_picker = "telescope"

-- eslint
vim.g.lazyvim_eslint_auto_format = true

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--   virtual_text = false,
-- })

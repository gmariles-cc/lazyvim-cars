-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use intelephense instead of phpactor for the lang.php extra
vim.g.lazyvim_php_lsp = "intelephense"

-- Plain line numbers instead of LazyVim's default relative numbering
vim.opt.relativenumber = false

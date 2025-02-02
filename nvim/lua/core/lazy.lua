-- core/lazy.lua

-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Safely load lazy.nvim
local installed, lazy = pcall(require, "lazy")
if not installed then
  return
end

-- Setup lazy.nvim with plugin directories
lazy.setup({
  -- Import plugin directories
  spec = {
    { import = "plugins" },              -- Import general plugins directory
    { import = "plugins.lsp.init" },   -- Import LSP plugin setup
    { import = 'plugins.colorschemes' },  -- Import color scheme plugins
  },
})


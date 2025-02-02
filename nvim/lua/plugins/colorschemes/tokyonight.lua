return {
  {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup({
        style = 'night', -- Options: night, storm, day, moon
        transparent = false,
      })
      --vim.cmd.colorscheme('tokyonight')
    end,
  },
}

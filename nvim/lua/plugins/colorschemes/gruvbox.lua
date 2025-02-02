return {
  {
    'ellisonleao/gruvbox.nvim',
    config = function()
      require('gruvbox').setup({
        contrast = 'hard',
        palette_overrides = {
          bright_green = "#a9b665",
          neutral_green = "#89b482",
        },
        transparent_mode = false,
      })
      --vim.cmd.colorscheme('gruvbox')
    end,
  },
}

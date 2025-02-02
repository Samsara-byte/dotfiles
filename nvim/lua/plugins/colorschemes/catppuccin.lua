return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        transparent_background = false,
      })
      vim.cmd.colorscheme('catppuccin')
    end,
  },
}

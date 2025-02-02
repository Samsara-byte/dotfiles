return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/tokyonight.nvim' },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'tokyonight', -- Use Tokyonight theme
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = { "NvimTree" },
            winbar = { "NvimTree" },
          },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {}, -- No Git components
          lualine_c = {
            {
              'filename',
              path = 1, -- Show relative path
              symbols = { modified = '[+]', readonly = '[-]', unnamed = '[No Name]' },
            },
          },
          lualine_x = {
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' }, -- Uses Neovim's built-in LSP diagnostics
              sections = { 'error', 'warn' }, -- Show error and warning counts
              symbols = { error = ' ', warn = ' ' }, -- Icons for errors and warnings
              colored = true,
              update_in_insert = false, -- Update only in normal mode
            },
            'encoding',
            'fileformat',
            {
              'filetype',
              icon_only = true, -- Show only file type icon
            },
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {}, -- No specific extensions
      })
    end,
  },
}


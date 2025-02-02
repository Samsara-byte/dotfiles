return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', 
  },
  config = function()
    -- Telescope setup
    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        prompt_prefix = "> ",
        selection_caret = ">> ",
        layout_strategy = "horizontal",
        layout_config = {
          preview_width = 0.6, 
       },
      },
    })
  end
}


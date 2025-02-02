return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      size = 20,
      open_mapping = [[<C-t>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      direction = "float", -- Options: "horizontal", "vertical", "tab", "float"
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    -- Import Terminal class from toggleterm
    local Terminal = require("toggleterm.terminal").Terminal

    -- Htop terminal
    local htop = Terminal:new({
      cmd = "htop",
      hidden = true,
      direction = "float",
    })

    function _HTOP_TOGGLE()
      htop:toggle()
    end

    vim.keymap.set("n", "<leader>ht", "<cmd>lua _HTOP_TOGGLE()<CR>", { desc = "Toggle Htop" })
  end,
}


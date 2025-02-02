-- Set leader key
vim.g.mapleader = " "
local opt = vim.opt

-- General settings
opt.wrap = false                 -- Disable line wrapping
opt.number = true                -- Show line numbers
opt.relativenumber = true        -- Enable relative line numbers
opt.cursorline = true            -- Highlight the current line
opt.cursorcolumn = false         -- Disable highlighting the current column
opt.signcolumn = "yes"           -- Always show the sign column
opt.fillchars = { eob = " " }    -- Use space for end-of-buffer
opt.clipboard = "unnamedplus"    -- Use system clipboard
opt.backspace = "indent,eol,start"  -- Enable backspace over indentation, EOL, and start of line
opt.hlsearch = true              -- Highlight search results
opt.ignorecase = true            -- Ignore case in search patterns
opt.smartcase = true             -- Override ignorecase if uppercase is used in search
opt.shortmess:append("c")        -- Avoid showing extra messages

-- Indentation settings
opt.tabstop = 4                  -- Number of spaces a tab counts for
opt.softtabstop = 4              -- Number of spaces for a tab in insert mode
opt.shiftwidth = 4               -- Number of spaces for auto-indentation
opt.smartindent = true           -- Enable smart indentation
opt.autoindent = true            -- Automatically indent new lines
opt.expandtab = true             -- Use spaces instead of tabs

-- Line wrapping and scrolling
opt.scrolloff = 8                -- Keep 8 lines of context when scrolling
opt.sidescrolloff = 8            -- Keep 8 columns of context when scrolling horizontally
opt.linebreak = true             -- Wrap lines at word boundaries
opt.showbreak = "↪"              -- Symbol for line continuation

-- Searching settings
opt.ignorecase = true            -- Ignore case in searches
opt.smartcase = true             -- Override ignorecase if uppercase letters are used
opt.incsearch = true             -- Show search results while typing
opt.hlsearch = true              -- Highlight all search results
opt.path:append("**")            -- Include all subdirectories in search path

-- File encoding and backup options
opt.encoding = "utf-8"           -- Set encoding to UTF-8
opt.fileencoding = "utf-8"       -- Set file encoding to UTF-8
opt.backup = false               -- Disable backup file creation
opt.writebackup = false          -- Disable backup file creation while writing
opt.swapfile = false             -- Disable swap files

-- UI settings
opt.termguicolors = true         -- Enable true color support
opt.showmode = false             -- Hide mode information (useful for statusline plugins)
opt.cmdheight = 2                -- Height of the command line
opt.pumheight = 10               -- Number of items to show in the completion popup
opt.showtabline = 2              -- Always show the tabline
opt.scrolloff = 8                -- Number of lines to keep above/below the cursor while scrolling
opt.sidescrolloff = 8            -- Number of columns to keep left/right of the cursor while scrolling
opt.signcolumn = "yes"           -- Always show the sign column

-- Autocompletion and mouse
opt.mouse = "a"                  -- Enable mouse in all modes
opt.completeopt = { "menu", "menuone", "noselect" }  -- Configure completion options


-- Backup, undo and undofile settings
opt.undolevels = 1000            -- Number of undo levels to keep
opt.undoreload = 10000           -- Number of lines to keep in undo history

-- Performance settings
opt.lazyredraw = true            -- Optimize redrawing during macros
opt.history = 1000               -- Number of commands to remember


-- Additional settings for file types
opt.autochdir = true             -- Change working directory to the file's directory

-- Colorized line numbers
vim.cmd [[
  " Set color for normal line numbers
  highlight Number ctermfg=green guifg=#00FF00  " Green for absolute line numbers

  " Set color for the current line number
  highlight CursorLineNr ctermfg=yellow guifg=#FFFF00  " Yellow for the current line number
]]


return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"HiPhish/rainbow-delimiters.nvim",
		"windwp/nvim-autopairs",
	},
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
				"cpp",
				"python",
				"go",
				"regex",
				"ruby",
				"rust",
				"sql",
				"haskell",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			-- Enable folding based on Tree-sitter
			fold = {
				enable = true,
			},
		})

		-- Folding settings
		vim.o.foldmethod = "expr"                      -- Use expression-based folding
		vim.o.foldexpr = "nvim_treesitter#foldexpr()"  -- Tree-sitter fold expression
		vim.o.foldenable = true                        -- Enable folding by default
		vim.o.foldlevel = 99                           -- Start with most folds open
		vim.o.foldlevelstart = 99                      -- Open all folds on startup
		vim.o.foldcolumn = "1"                         -- Show fold column

		-- Autotag setup
		require("nvim-ts-autotag").setup({
			filetypes = {
				"html",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"vue",
				"xml",
			},
		})

		-- Autopairs setup
		local autopairs = require("nvim-autopairs")
		autopairs.setup({
			disable_filetype = { "TelescopePrompt", "vim" },
			check_ts = true,
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
				offset = 0,
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})

		-- Integration with Treesitter for autopairs
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}


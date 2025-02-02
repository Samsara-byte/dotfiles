local cmp = require("cmp")
local luasnip = require("luasnip")

-- Load snippets from LuaSnip
require("luasnip.loaders.from_vscode").lazy_load()

-- Define completion options
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- Use LuaSnip for snippets
        end,
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP completions
        { name = "luasnip" },  -- Snippet completions
    }, {
        { name = "buffer" },   -- Buffer completions
        { name = "path" },     -- File path completions
    }),
})

-- Setup for `/` and `:` in command-line mode
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})


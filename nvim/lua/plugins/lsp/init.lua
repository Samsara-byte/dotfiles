return {
    -- Mason for managing LSP servers
    {
        "williamboman/mason.nvim",
        config = function()
            require("plugins.lsp.mason") -- Load Mason configuration
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
    },
    -- nvim-lspconfig for configuring built-in LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp", -- Completion capabilities
        },
        config = function()
            require("plugins.lsp.lspconfig") -- Load LSP configurations
        end,
    },
    -- Completion framework
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",       -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer",         -- Buffer source for nvim-cmp
            "hrsh7th/cmp-path",           -- Path source for nvim-cmp
            "hrsh7th/cmp-cmdline",        -- Command-line source for nvim-cmp
            "L3MON4D3/LuaSnip",           -- Snippet engine
            "saadparwaiz1/cmp_luasnip",   -- Snippet completion source
        },
        config = function()
            require("plugins.lsp.completion") -- Load the completion configuration
        end,
    },

}


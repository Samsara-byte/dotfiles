local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Initialize Mason
mason.setup()

-- Ensure the desired servers are installed
mason_lspconfig.setup({
    ensure_installed = { "pyright", "clangd", "gopls", "rust_analyzer","html", "cssls", "ts_ls" },
    automatic_installation = true,
})


local lspconfig = require("lspconfig")
local keymaps = require("core.keymaps")  -- Import keymaps module

-- Basic LSP settings
local on_attach = function(client, bufnr)
    keymaps.setup_lsp_keymaps(bufnr)  -- Set up keymaps using the separate keymaps module
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Load individual server configurations
require("plugins.lsp.servers.python").setup(lspconfig, on_attach, capabilities)
require("plugins.lsp.servers.c").setup(lspconfig, on_attach, capabilities)
require("plugins.lsp.servers.go").setup(lspconfig, on_attach, capabilities)
require("plugins.lsp.servers.rust").setup(lspconfig, on_attach, capabilities)

-- Add HTML, CSS, and JavaScript/TypeScript servers
lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

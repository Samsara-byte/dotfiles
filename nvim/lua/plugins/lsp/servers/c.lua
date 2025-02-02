local M = {}

M.setup = function(lspconfig, on_attach, capabilities)
    lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M


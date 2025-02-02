local M = {}

M.setup = function(lspconfig, on_attach, capabilities)
    lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M


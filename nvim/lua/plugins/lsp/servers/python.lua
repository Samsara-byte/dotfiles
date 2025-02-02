local M = {}

M.setup = function(lspconfig, on_attach, capabilities)
    lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M


local M = {}
local keymap = vim.keymap.set

-- LSP Keymaps
M.setup_lsp_keymaps = function(bufnr)
    local buf_map = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }

    buf_map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
end


-- Select all
keymap("n", "<C-a>", "gg<S-v>G", { desc = "Select All" }) 
vim.keymap.set({"n","v"}, "<C-S-c>", '"+y', { desc = "Copy to Clipboard" },{noremap=true,silent=true}) -- copy to Clipboard
vim.keymap.set({"n","v"}, "<C-S-v>", '"+p', { desc = "Paste from Clipboard" },{noremap=true,silent=true}) -- paste from Clipboard



-- NvimTree
keymap("n", "<leader>tt", ":NvimTreeToggle<cr>", { desc = "NvimTree Toggle", noremap = true, silent = true })
keymap("n", "<leader>tr", ":NvimTreeRefresh<cr>", { desc = "NvimTree Refresh", noremap = true, silent = true })

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files", noremap = true, silent = true })  -- find files
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep", noremap = true, silent = true })  -- Live grep (search within files)

-- CMP Completion Keymaps
keymap("i", "<C-b>", function() require("cmp").mapping.scroll_docs(-4) end, { desc = "Scroll docs up" })
keymap("i", "<C-f>", function() require("cmp").mapping.scroll_docs(4) end, { desc = "Scroll docs down" })
keymap("i", "<C-Space>", function() require("cmp").mapping.complete() end, { desc = "Trigger completion" })
keymap("i", "<C-e>", function() require("cmp").mapping.abort() end, { desc = "Close completion menu" })
keymap("i", "<CR>", function() require("cmp").mapping.confirm({ behavior = require("cmp").ConfirmBehavior.Replace, select = true }) end, { desc = "Confirm completion" })

-- Tab key for normal indent or completion/snippet navigation
keymap("i", "<Tab>", function(_, fallback)
    -- If completion is visible, navigate to the next item
    if require("cmp").visible() then
        require("cmp").select_next_item() 
    -- If luasnip can expand or jump, expand or jump the snippet
    elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump() 
    -- If neither completion nor snippet expansion is active, fallback to default behavior (indent)
    else
        if fallback then fallback() end  -- This triggers the normal indentation behavior
    end
end, { desc = "Next completion item, snippet expansion, or normal indent" })

-- Shift + Tab key for navigating previous items or snippet jumps
keymap("i", "<S-Tab>", function(_, fallback)
    -- If completion is visible, navigate to the previous item
    if require("cmp").visible() then
        require("cmp").select_prev_item() 
    -- If luasnip can jump backwards, jump in the snippet
    elseif require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1) 
    -- If neither completion nor snippet jump is active, fallback to default behavior (indent)
    else
        if fallback then fallback() end  -- This triggers the normal indentation behavior
    end
end, { desc = "Previous completion item, snippet jump, or normal indent" })


return M


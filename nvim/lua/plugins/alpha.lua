return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional icons
    config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Header (ASCII Art)
    dashboard.section.header.val = {
        [[ █████╗ ███████╗ ██████╗ ███╗   ██╗██╗ █████╗ ███╗   ██╗]],
        [[██╔══██╗██╔════╝██╔═══██╗████╗  ██║██║██╔══██╗████╗  ██║]],
        [[███████║█████╗  ██║   ██║██╔██╗ ██║██║███████║██╔██╗ ██║]],
        [[██╔══██║██╔══╝  ██║   ██║██║╚██╗██║██║██╔══██║██║╚██╗██║]],
        [[██║  ██║███████╗╚██████╔╝██║ ╚████║██║██║  ██║██║ ╚████║]],
        [[╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝]],
    }

    -- Buttons for actions
    dashboard.section.buttons.val = {
        dashboard.button("e", "📄  New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "🔍  Find File", ":Telescope find_files<CR>"),
        dashboard.button("r", "🕒  Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button("t", "🖥️  Open Terminal", ":ToggleTerm<CR>"),
        dashboard.button("s", "⚙️   Settings", ":e $MYVIMRC<CR>"),
        dashboard.button("q", "❌  Quit", ":qa<CR>"),
    }

    -- Footer
    dashboard.section.footer.val = "Hello, I'm The Doctor. Basically... run."

    -- Center the layout
    dashboard.config.layout = {
        { type = "padding", val = 3 }, -- Top padding
        dashboard.section.header,
        { type = "padding", val = 2 }, -- Space between header and buttons
        dashboard.section.buttons,
        { type = "padding", val = 1 }, -- Space between buttons and footer
        dashboard.section.footer,
    }

    -- Setup Alpha
    alpha.setup(dashboard.config)
    end,
}

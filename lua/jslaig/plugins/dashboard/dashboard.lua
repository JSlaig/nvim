return {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()

        local art = {
            '                                                                                                           ',
            '             .         .                                                                                   ',
            '           .:::        ::.                                                                                 ',
            '         .::::::       ::::.                                               .:::                            ',
            '        : :::::::      :::::                                               ::::                            ',
            '        :: :::::::     :::::                                                                               ',
            '        ::: :::::::    :::::    ::.:::::   .::::::   .:::::: ::::     :::: :::: ::::::::::::::::::         ',
            '        :::: :::::::   :::::    ::     :: .:     :: ::     :: ::::   ::::  :::: :::::  :::::   ::::        ',
            '        ::::: :::::::  :::::    ::     :: ::::::::: ::     ::  :::: ::::   :::: ::::    ::::   ::::        ',
            '        :::::  ::::::: :::::    ::     :: ::        :.     .:   :::.:::    :::: ::::    ::::   ::::        ',
            '        :::::   ::::::: ::::    ::     :: ::      . ::     ::    :::::     :::: ::::    ::::   ::::        ',
            '        :::::    ::::::: :::    ::     ::  :::   :: :::   :::     :::      :::: ::::    ::::   ::::        ',
            '        :::::     ::::::: ::    ::      :    :::::    :::::        :       .:::  :::    :::    :::         ',
            '         ::::      ::::::: :                                                                               ',
            '          :::       ·::::::                                                                                ',
            '           ::        ·::·´                                                                                 ',
            '            `         ´                                                                                    ',
            '                                                                                                            '
        }

        require("dashboard").setup({
            -- config
            theme = "hyper",
            disable_move = true,
            config = {
                -- header = header_art, 
                header = art, 
                shortcut = { 
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "Files",
                        group = "Label",
                        action = ":Telescope find_files",
                        key = "f",
                    },
                    {
                        icon = "󰢱 ",
                        icon_hl = "@variable",
                        desc = "Plugins",
                        group = "Label",
                        action = ":Lazy",
                        key = "p",
                    },
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "Mason",
                        group = "Label",
                        action = ":Mason",
                        key = "m",
                    },
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "Game",
                        group = "Label",
                        action = ":VimBeGood",
                        key = "g",
                    },
                },
            }
        })

        vim.cmd("redraw")
    end,
}

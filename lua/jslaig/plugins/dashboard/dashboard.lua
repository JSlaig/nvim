return {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()

        local art = {
            '                                                                                                           ',
            '                                                                                                           ',
            '                                                                                                           ',
            '                                                                                                           ',
            '                                                                                                           ',
            '                                                                                                           ',
            '                                                                                                           ',
            '                                                                                                           ',
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
            '                                                                                                           ',
            '                                                                                                           ',
            '                                                                                                           ',
            '                                                                                                           ',
            '                                                                                                           ',
            '                                                                                                           ',
            '                                                                                                           ',
            '                                                                                                           ',
            '                                                                                                           '
        }

        require("dashboard").setup({
            -- config
            theme = "doom",
            disable_move = true,
            config = {
                -- header = header_art, 
                header = art, 
                center = {
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "Find Files",
                        desc_hl = "Label",
                        key = "f",
                        key_hl = "Number",
                        action = "Telescope find_files",
                    },
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "Grep Files",
                        desc_hl = "Label",
                        key = "g",
                        key_hl = "Number",
                        action = "Telescope live_grep",
                    },
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "Quickfix List",
                        desc_hl = "Label",
                        key = "q",
                        key_hl = "Number",
                        action = "copen",
                    },
                    {
                        icon = "󰢱 ",
                        icon_hl = "@variable",
                        desc = "Plugins",
                        desc_hl = "Label",
                        key = "p",
                        key_hl = "Number",
                        action = "Lazy",
                    },
                },
            }
        })
    end,
}

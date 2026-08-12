return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        -- Disable scrolling animations for snappiness
        scroll = { enabled = false },

        -- Dashboard (replaces glepnir/dashboard-nvim)
        dashboard = {
            enabled = true,
            preset = {
                header = [[
                                                                                                           
                                                                                                           
                                                                                                           
             .         .                                                                                   
           .:::        ::.                                                                                 
         .::::::       ::::.                                               .:::                            
        : :::::::      :::::                                               ::::                            
        :: :::::::     :::::                                                                               
        ::: :::::::    :::::    ::.:::::   .::::::   .:::::: ::::     :::: :::: ::::::::::::::::::         
        :::: :::::::   :::::    ::     :: .:     :: ::     :: ::::   ::::  :::: :::::  :::::   ::::        
        ::::: :::::::  :::::    ::     :: ::::::::: ::     ::  :::: ::::   :::: ::::    ::::   ::::        
        :::::  ::::::: :::::    ::     :: ::        :.     .:   :::.:::    :::: ::::    ::::   ::::        
        :::::   ::::::: ::::    ::     :: ::      . ::     ::    :::::     :::: ::::    ::::   ::::        
        :::::    ::::::: :::    ::     ::  :::   :: :::   :::     :::      :::: ::::    ::::   ::::        
        :::::     ::::::: ::    ::      :    :::::    :::::        :       .:::  :::    :::    :::         
         ::::      ::::::: :                                                                               
          :::       ·::::::                                                                                
           ::        ·::·´                                                                                 
            `         ´                                                                                    
                                                                                                           
]],
                keys = {
                    { icon = "󰉋 ", key = "f", desc = "Find Files", action = ":lua Snacks.picker.files()" },
                    { icon = "󰍉 ", key = "g", desc = "Grep Files", action = ":lua Snacks.picker.grep()" },
                    { icon = "󰣇 ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
                    { icon = "󰢱 ", key = "p", desc = "Plugins", action = ":Lazy" },
                    { icon = "󰆧 ", key = "m", desc = "Mason", action = ":Mason" },
                    { icon = "󰗼 ", key = "x", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },

        -- Notifications handled by rcarriga/nvim-notify
        notifier = { enabled = false },

        -- Input (replaces stevearc/dressing.nvim)
        input = { enabled = true },

        -- Quickfile for fast file opening
        quickfile = { enabled = true },

        -- Statuscolumn optimization
        statuscolumn = { enabled = false },

        -- Words highlight
        words = { enabled = false },
    },
    keys = {
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep Files" },
        { "<leader>fc", function() Snacks.picker.grep_word() end, desc = "Grep Word" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fo", function() Snacks.picker.recent() end, desc = "Recent Files" },
    },
    init = function()
        -- Set vim.ui.input and vim.ui.select to use snacks
        vim.ui.input = function(opts, on_confirm)
            return Snacks.input(opts, on_confirm)
        end
        vim.ui.select = function(items, opts, on_choice)
            return Snacks.picker.select(items, opts, on_choice)
        end

        -- Preload picker module after UI is ready to avoid first-use delay
        vim.api.nvim_create_autocmd("UIEnter", {
            once = true,
            callback = function()
                vim.defer_fn(function()
                    require("snacks.picker")
                end, 50)
            end,
        })
    end,
}

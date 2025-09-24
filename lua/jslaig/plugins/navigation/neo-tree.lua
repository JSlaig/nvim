
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- optional
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker", -- the window picker
    },
    config = function()
        local window_picker = require("window-picker")
        window_picker.setup({
            autoselect_one = true,
            include_current_win = false,
            filter_rules = {
                -- ignore Neo-tree, terminals, etc
                bo = {
                    filetype = { "neo-tree", "terminal" },
                },
            },
            hint = 'floating-big-letter',
            fg_color = "#eeeeee",
            picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        })
        require("neo-tree").setup({
            filesystem = {
                follow_current_file = true,
                use_libuv_file_watcher = true,
            },
            window = {
                width = 50,
                mappings = {
                    ["<CR>"] = "open_with_window_picker", -- opens using picker
                },
            },
        })

        -- Map <leader>n to toggle Neo-tree
        vim.keymap.set("n", "<leader>n", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
    end,
}


--TODO: see if I can tweak it to integrate better
return {
    "jslaig/vs-tasks.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "folke/snacks.nvim"
    },
    keys = {
        {"<leader>bt", ":lua require('vstask').tasks()<CR>"}
    },
    opts = {
        picker = "snacks"
    },
    config = function()
        require("vstask").setup({
            picker = "snacks", -- Use snacks.nvim picker
            cache_json_conf = true,
            cache_strategy = "last",
            config_dir = ".vscode",
            support_code_workspace = true,
            terminal = 'floaterm',
            term_opts = {
                vertical = {
                    direction = "vertical",
                    size = "80"
                },
                horizontal = {
                    direction = "horizontal",
                    size = "10"
                },
                current = {
                    direction = "float",
                },
                tab = {
                    direction = 'tab',
                }
            },
            -- Note: telescope_keys still work for key mappings even with snacks picker
            telescope_keys = {
                vertical = '<C-v>',
                split = '<C-p>',
                tab = '<C-t>',
                current = '<CR>',
                background = '<C-b>',
                watch_job = '<C-w>',
                kill_job = '<C-d>',
                run = '<C-r>',
            },
            -- ... other configuration options work the same
        })    end
}


return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional
    config = function()
        local fzf = require("fzf-lua")

        -- Find files
        vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })

        -- Live grep
        -- vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live grep" })

        -- Grep word under cursor
        vim.keymap.set("n", "<leader>fc", fzf.grep_cword, { desc = "Grep word under cursor" })
    end,
}


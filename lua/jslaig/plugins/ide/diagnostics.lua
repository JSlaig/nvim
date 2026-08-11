return {
    "neovim/nvim-lspconfig",

    event = { "BufReadPre", "BufNewFile" },

    config = function()
        vim.opt.updatetime = 300

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            severity_sort = true,

            float = {
                border = "rounded",
                source = "always",
            },
        })

        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {
            desc = "Show diagnostic",
        })

        vim.api.nvim_create_autocmd("CursorHold", {
            callback = function()
                vim.diagnostic.open_float(nil, {
                    focus = false,
                    scope = "cursor",
                })
            end,
        })
    end,
}

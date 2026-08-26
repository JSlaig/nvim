return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },

    event = { "BufReadPre", "BufNewFile" },

    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "vue_ls",
                "ts_ls",
                "html",
                "cssls",
            },
        })

        -- TypeScript + Vue
        vim.lsp.config("ts_ls", {
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
            },

            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = vim.fn.stdpath("data")
                            .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                        languages = { "vue" },
                    },
                },
            },
        })

        -- Vue language server
        vim.lsp.config("vue_ls", {})

        -- HTML / CSS
        vim.lsp.config("html", {})
        vim.lsp.config("cssls", {})

        vim.lsp.enable({
            "ts_ls",
            "vue_ls",
            "html",
            "cssls",
        })
    end,
}

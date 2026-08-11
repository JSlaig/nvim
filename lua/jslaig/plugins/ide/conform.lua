return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },

    opts = {
        formatters_by_ft = {
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            vue = { "prettier" },
            json = { "prettier" },
            jsonc = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            html = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
        },

        format_on_save = {
            timeout_ms = 5000,
            lsp_fallback = true,
        },
    },

    -- config = function(_, opts)
    --     local conform = require("conform")
    --     conform.setup(opts)

    --     conform.formatters.prettier = {
    --         command = "yarn",
    --         args = { "exec", "prettier", "--write", "$FILENAME" },
    --         stdin = false,
    --     }
    -- end,
}

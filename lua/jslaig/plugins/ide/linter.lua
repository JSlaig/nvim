return {
    "mfussenegger/nvim-lint",

    dependencies = {
        "rshkarin/mason-nvim-lint",
    },

    event = { "BufReadPre", "BufNewFile", "BufWritePost" },

    config = function()
        local lint = require("lint")

        require("mason-nvim-lint").setup({
            ensure_installed = {
                "selene",
                "jsonlint",
            },
        })

        lint.linters_by_ft = {
            javascript = { "eslint_project" },
            javascriptreact = { "eslint_project" },
            typescript = { "eslint_project" },
            typescriptreact = { "eslint_project" },
            vue = { "eslint_project" },

            scss = { "stylelint" },
            css = { "eslint_project" },
            html = { "eslint_project" },
            json = { "jsonlint" },

            lua = { "selene" },
        }

        lint.linters.eslint_project = {
            cmd = "yarn",
            stdin = false,

            args = {
                "eslint",
                "--format",
                "json",
                function()
                    return vim.api.nvim_buf_get_name(0)
                end,
            },

            stream = "stdout",
            ignore_exitcode = true,

            parser = function(output, bufnr)
                local ok, decoded = pcall(vim.json.decode, output)

                if not ok then
                    return {
                        {
                            lnum = 0,
                            col = 0,
                            message = "ESLint JSON parse error: " .. output,
                            severity = vim.diagnostic.severity.ERROR,
                        },
                    }
                end

                local diagnostics = {}

                for _, file in ipairs(decoded) do
                    for _, message in ipairs(file.messages or {}) do
                        table.insert(diagnostics, {
                            lnum = (message.line or 1) - 1,
                            col = (message.column or 1) - 1,
                            end_lnum = (message.endLine or message.line or 1) - 1,
                            end_col = (message.endColumn or message.column or 1) - 1,
                            message = message.message,
                            severity = message.severity == 2
                                and vim.diagnostic.severity.ERROR
                                or vim.diagnostic.severity.WARN,
                            code = message.ruleId,
                        })
                    end
                end

                return diagnostics
            end,
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", {
            clear = true,
        })

        vim.api.nvim_create_autocmd({
            "BufEnter",
            "BufWritePost",
            "InsertLeave",
        }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })
    end,
}

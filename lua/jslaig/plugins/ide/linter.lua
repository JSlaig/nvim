--TODO: tweak this for better support on more langs and better error/warning display
return {
    "mfussenegger/nvim-lint",
    dependencies = {
        "rshkarin/mason-nvim-lint"
    },
    event = { "BufReadPre", "BufNewFile", "BufWritePost" },
    config = function()
        local lint = require("lint")

        require ('mason-nvim-lint').setup({
            ensure_installed = {'eslint_d', 'selene'},
        })

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            -- java = { "" },
            scss = { "stylelint" },
            css = { "eslint_d" },
            html = { "eslint_d" },
            json = { "eslint_d" },
            lua = { "selene" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })       
    end
}

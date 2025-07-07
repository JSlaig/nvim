return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "antosha417/nvim-lsp-file-operations"
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            opts.desc = "Show LSP references"

            -- This one is not working
            keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)

            -- Works only on current buffer
            keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, opts)
        end
    end
}

return {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        -- Diagnostics display config
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

        -- Java LSP (jdtls) setup
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Root detection
        local root_pattern = vim.fs.root(
            vim.fn.expand("%:p"),
            { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
        )

        local workspace_folder = vim.fn.stdpath("data") ..
            "/jdtls-workspace/" ..
            vim.fn.fnamemodify(root_pattern or vim.fn.getcwd(), ":p:h:t")

        local jdtls_cmd = {
            vim.fn.stdpath("data") .. "/mason/packages/jdtls/bin/jdtls",
            "-data", workspace_folder,
        }

        vim.lsp.config("jdtls", {
            cmd = jdtls_cmd,
            root_dir = root_pattern,
            capabilities = capabilities,
            settings = {
                java = {
                    signatureHelp = { enabled = true },
                    contentProvider = { preferred = "fernflower" },
                    completion = { favoriteStaticMembers = {} },
                },
            },
            on_attach = function(_, bufnr)
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                end

                map("n", "gd", vim.lsp.buf.definition, "Go to definition")
            end,
        })

        vim.lsp.enable("jdtls")
    end,
}

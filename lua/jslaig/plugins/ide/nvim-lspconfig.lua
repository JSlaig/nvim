return {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    config = function()
        -- Mason jdtls path
        local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
        local jdtls_cmd = {
            mason_path .. "/bin/jdtls",
        }

        -- Root detection (lspconfig.util replacement)
        local root_pattern = vim.fs.root(
            vim.fn.expand("%:p"),
            { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
        )

        local workspace_folder = vim.fn.stdpath("data") ..
        "/jdtls-workspace/" ..
        vim.fn.fnamemodify(root_dir, ":p:h:t")

        local jdtls_cmd = {
            mason_path .. "/bin/jdtls",
            "-data", workspace_folder,
        }

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
                -- map("n", "K", vim.lsp.buf.hover, "Hover documentation")
                -- map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
            end,
        })

        vim.lsp.enable("jdtls")
    end,
}


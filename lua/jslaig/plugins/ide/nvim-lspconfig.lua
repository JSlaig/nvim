return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Mason jdtls path
    local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
    local jdtls_cmd = {
      mason_path .. "/bin/jdtls",
    }

    -- Root detection (lspconfig.util replacement)
    local root_pattern = vim.fs.root(0, {
      ".git",
      "mvnw",
      "gradlew",
      "pom.xml",
      "build.gradle",
    })

    vim.lsp.config("jdtls", {
      cmd = jdtls_cmd,
      root_dir = root_pattern,
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
        map("n", "K", vim.lsp.buf.hover, "Hover documentation")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
      end,
    })

    vim.lsp.enable("jdtls")
  end,
}


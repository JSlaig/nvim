return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require("lspconfig")

    -- Get the path where Mason installed jdtls
    local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
    local jdtls_cmd = {
      mason_path .. "/bin/jdtls",  -- path to jdtls executable
    }

    -- Configure jdtls
    lspconfig.jdtls.setup({
      cmd = jdtls_cmd,
      root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
      settings = {
        java = {
          signatureHelp = { enabled = true },
          contentProvider = { preferred = "fernflower" },
          completion = { favoriteStaticMembers = {} },
        },
      },
      on_attach = function(client, bufnr)
        -- Optional: setup buffer-local keymaps
        local buf_map = function(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        buf_map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
        buf_map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
        buf_map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
      end,
    })
  end,
}

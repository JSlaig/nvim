return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true,
                disable = { "vimdoc" },
            },
            indent = {
                enable = true,
            },
            ensure_installed = {
                "json",
                "javascript",
                "java",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash", 
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "python",
                "regex",
                "vimdoc",
                "c"
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-s>",
                    node_incremental = "<C-s>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                }
            }
        })
    end,
}

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "InsertEnter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "InsertEnter"
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
                "typescript",
                "java",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash", 
                "vue",
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

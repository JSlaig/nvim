--TODO: review useful keymaps and functions from plugin, remove unnecessary
return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = true,

                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim

                    keymaps = {
                        -- Select sides of variable assignments
                        -- ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                        -- ["r="] = { query = "@assignment.rhs", desc = "Select right hand of an assignment" },

                        -- params/arguments
                        -- ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/arg" },

                        -- conditionals
                        -- ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a loop" },
                        -- ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a loop" },

                        -- loops
                        -- ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
                        -- ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
                        
                        -- function
                        -- ["af"] = { query = "@function.outer", desc = "Select outer part of a function def" },
                        -- ["if"] = { query = "@function.inner", desc = "Select inner part of a function def" },
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]f"] = { query = "@function.outer", desc = "Next function def start" },
                        -- ["]c"] = { query = "@class.outer", desc = "Next class def start" },
                        -- ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
                        -- ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
                    },
                    goto_next_end = {
                        ["]F"] = { query = "@function.outer", desc = "Next function def start" },
                        -- ["]C"] = { query = "@class.outer", desc = "Next class def start" },
                        -- ["]I"] = { query = "@conditional.outer", desc = "Next conditional start" },
                        -- ["]L"] = { query = "@loop.outer", desc = "Next loop start" },
                    },
                    goto_previous_start = {
                        ["[f"] = { query = "@function.outer", desc = "Next function def start" },
                        -- ["[c"] = { query = "@class.outer", desc = "Next class def start" },
                        -- ["[i"] = { query = "@conditional.outer", desc = "Next conditional start" },
                        -- ["[l"] = { query = "@loop.outer", desc = "Next loop start" },
                    },
                },
            },
        })


        -- local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

        -- vim.keymap.set({"n", "x", "o"}, ";", ts_repeat_move.repeat_last_move)
        -- vim.keymap.set({"n", "x", "o"}, ",", ts_repeat_move.repeat_last_move_opposite)
    end,
}

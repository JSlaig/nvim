return {
    "folke/todo-comments.nvim",
    event = "BufEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()

        require('todo-comments').setup()

        vim.keymap.set("n", "<leader>fl", function()
            vim.ui.select({'1: Trouble', '2: Telescope'},{
                prompt = "UI: ",
                telescope = require("telescope.themes").get_cursor(),
            },function (selected) 
                    if selected == '1: Trouble' then
                        vim.cmd('TodoTrouble')
                    elseif selected == '2: Telescope' then
                        vim.cmd('TodoTelescope')
                    else
                        vim.cmd('TodoQuickFix')
                    end 
                end
            )
        end
        )
    end 
}

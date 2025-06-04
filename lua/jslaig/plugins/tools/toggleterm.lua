--TODO: Need to make it work with the terminal I want and manage multiple instances

return {
    "rebelot/terminal.nvim",
    lazy = true,
    config = function()
        require("terminal").setup({
            layout = {
                open_cmd = 'float',
                width = 80,
                height = 80,
            }
        })


        -- Function to open terminal vertically on the right side
        function _G.open_terminal_vertically()
            vim.cmd('vsplit | terminal')  -- Open terminal in a vertical split
            vim.cmd('wincmd L')           -- Move terminal to the far right
        end

        -- Map a key to open the terminal vertically on the right
        vim.api.nvim_set_keymap('n', '<C-\\>', '<cmd>lua require("terminal.mappings").toggle()<CR>', { noremap = true, silent = true })
    end
}




return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        local MiniFiles = require("mini.files")
        MiniFiles.setup({
            mappings = {
                go_in = "l",      -- enter folder / open file
                go_out = "h",     -- go up one folder
                create = "a",     -- create file/folder
                remove = "d",     -- delete file/folder
                rename = "r",     -- rename
                copy = "y",       -- copy
                paste = "p",      -- paste
                synchronize = "w",
                toggle_help = "?",-- help
            },
        })

        local function toggle_mini_files()
            local buf_dir = vim.fn.expand("%:p:h")
            local current_file = vim.fn.expand("%:t")
            local open_win = nil

            -- find any window showing mini.files buffer
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local buf = vim.api.nvim_win_get_buf(win)
                if vim.api.nvim_buf_get_name(buf):match("minifiles://") then
                    open_win = win
                    break
                end
            end

            if open_win and vim.api.nvim_win_is_valid(open_win) then
                vim.api.nvim_win_close(open_win, true)
                return
            end

            -- open mini.files
            MiniFiles.open(buf_dir)

            -- jump to current file
            vim.schedule(function()
                local mf_win = vim.api.nvim_get_current_win()
                local buf = vim.api.nvim_win_get_buf(mf_win)
                local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

                for i, line in ipairs(lines) do
                    if line:match(current_file) then
                        vim.api.nvim_win_set_cursor(mf_win, {i, 0})
                        break
                    end
                end
            end)
        end

        vim.keymap.set("n", "<leader>n", toggle_mini_files, { desc = "Toggle mini.files" })
    end
}


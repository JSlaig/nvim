return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local Extensions = require("harpoon.extensions")

    -- absolute, slash-normalized buffer path (stable regardless of cwd)
    local function abs(bufnr)
        return vim.fs.normalize(
            vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr or 0), ":p")
        )
    end

    require("harpoon").setup({
        settings = {
            -- persist edits/deletions made in the Harpoon menu when you close it,
            -- so you don't have to :w the menu buffer every time
            save_on_toggle = true,
            sync_on_ui_close = true,
        },
        default = {
            -- store absolute paths instead of harpoon's default make_relative(),
            -- which mixes relative + absolute and breaks jumps across cwds
            create_list_item = function(config, name)
                local bufname = vim.api.nvim_buf_get_name(
                    vim.api.nvim_get_current_buf()
                )
                name = name
                    or (bufname ~= "" and abs(0) or "")

                local bufnr = vim.fn.bufnr(name, false)
                local pos = { 1, 0 }
                if bufnr ~= -1 then
                    pos = vim.api.nvim_win_get_cursor(0)
                end

                return {
                    value = name,
                    context = { row = pos[1], col = pos[2] },
                }
            end,
            BufLeave = function(arg, list)
                local item = list:get_by_value(abs(arg.buf))
                if item then
                    local pos = vim.api.nvim_win_get_cursor(0)
                    item.context.row = pos[1]
                    item.context.col = pos[2]
                    Extensions.extensions:emit(
                        Extensions.event_names.POSITION_UPDATED,
                        item
                    )
                end
            end,
        },
    })

    local harpoon = require("harpoon")

    -- index of the current buffer in the list, so j/k move relative to it
    local function current_index(list)
        local cur = abs(0)
        for i = 1, list:length() do
            local item = list:get(i)
            if item and item.value == cur then
                return i
            end
        end
        return nil
    end

    -- delta = 1 for next, -1 for prev, wrapping around
    local function nav(delta)
        local list = harpoon:list()
        local n = list:length()
        if n == 0 then
            return
        end
        local idx = current_index(list) or 1
        list:select(((idx - 1 + delta) % n) + 1)
    end

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
    vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

    for i = 1, 9 do
        vim.keymap.set("n", "<leader>" .. i, function() harpoon:list():select(i) end, { desc = "Harpoon " .. i })
    end

    vim.keymap.set("n", "<leader>j", function() nav(1) end, { desc = "Harpoon next" })
    vim.keymap.set("n", "<leader>k", function() nav(-1) end, { desc = "Harpoon prev" })
  end,
}

return {
  "echasnovski/mini.files",
  version = false,
  dependencies = { "s1n7ax/nvim-window-picker" },
  opts = {
    options = {
      use_as_default_explorer = false,
    },
    mappings = {
      go_in = "l",
      go_out = "h",
      create = "a",
      remove = "d",
      rename = "r",
      copy = "y",
      paste = "p",
      synchronize = "w",  -- changed from default S
      toggle_help = "?",
    },
  },
  keys = {
    {
      "<leader>n",
      function()
        local mf = require("mini.files")
        local window_picker = require("window-picker")

        -- detect if mini.files window is open
        local open_win
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

        -- open mini.files at current file's directory
        local dir = vim.fn.expand("%:p:h")
        mf.open(dir)

        -- jump to current file in the tree
        local current_file = vim.fn.expand("%:t")
        vim.schedule(function()
          local win = vim.api.nvim_get_current_win()
          local buf = vim.api.nvim_win_get_buf(win)
          local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
          for i, line in ipairs(lines) do
            if line:match(current_file) then
              vim.api.nvim_win_set_cursor(win, { i, 0 })
              break
            end
          end
        end)

        -- close tree automatically when opening a file
        vim.api.nvim_create_autocmd("BufEnter", {
          callback = function()
            local bufname = vim.api.nvim_buf_get_name(0)
            if bufname ~= "" and not bufname:match("minifiles://") then
              if open_win and vim.api.nvim_win_is_valid(open_win) then
                vim.api.nvim_win_close(open_win, true)
              end
            end
          end,
          once = true,
        })

        -- override default <CR> to use window picker
        vim.api.nvim_buf_set_keymap(
          vim.api.nvim_get_current_buf(),
          "n",
          "<CR>",
          "<cmd>lua require('window-picker').pick_window({autoselect_one=true}) end<CR>",
          { noremap = true, silent = true }
        )
      end,
      desc = "Toggle mini.files at current file",
    },
  },
}


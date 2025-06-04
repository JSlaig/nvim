return {
  "nvim-telescope/telescope.nvim", -- Fuzzy finder
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope") 
    local actions = require("telescope.actions") 

    telescope.setup({
      defaults = {
        winblend = 10,
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to prev result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,           }
          }
        }
      })

    telescope.load_extension("fzf");

    local keymap = vim.keymap

    --set keymaps
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {desc = "Fuzzy find files in cwd"})
    keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {desc = "Find string in cwd"})
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", {desc = "Find string under cursor"})
  end
}

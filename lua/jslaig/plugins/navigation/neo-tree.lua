return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    {
      "<leader>n",
      function()
        require("neo-tree.command").execute({ action = "focus", source = "filesystem", toggle = true })
      end,
      desc = "Toggle Neo-tree (filesystem)",
    },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      filesystem = {
        follow_current_file = { enabled = false },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = false,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        window = {
          position = "left",
          width = 32,
          mappings = {
            -- mini.files-style navigation
            l = "open", -- open file or expand folder
            h = "close_node", -- collapse folder / go up
          },
        },
      },
      git = {
        enable = true,
        status = true,
        async = true,
      },
      default_component_configs = {
        git_status = {
          symbols = { added = "", modified = "", deleted = "", renamed = "" },
        },
      },
    })
  end,
}

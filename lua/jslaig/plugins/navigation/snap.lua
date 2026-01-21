return {
  {
    "camspiers/snap",
    lazy = false, -- load at startup so mappings always work
    config = function()
      local snap = require("snap")

      -- some convenient configs
      local vimgrep = snap.config.vimgrep {
        -- using ripgrep grep engine
        producer = "ripgrep.vimgrep",
        -- optional: limit to reasonable number of results
        -- limit = 20000,
      }
      local files = snap.config.file { producer = "ripgrep.file" }

      snap.maps({
        -- find files: <leader>ff
        { "<leader>ff", files },
        -- live grep: <leader>fg
        { "<leader>fg", vimgrep },

        -- buffer search, oldfiles, etc:
        { "<leader>fb", snap.config.file { producer = "vim.buffer" } },
        { "<leader>fo", snap.config.file { producer = "vim.oldfile" } },
      })
    end,
  },
}


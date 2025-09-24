
return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>p",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      desc = "Spectre: search word under cursor",
      mode = { "n", "v" }, -- works in normal & visual mode
    },
  },
}


return {
    "jslaig/floaterm",
    dependencies = "nvzone/volt",
    event = "VeryLazy",
    opts = {
        border = true
    },
    cmd = "FloatermToggle",
    keys = {
        -- Toggle floating terminal with <leader>`
        { "<C-\\>", "<cmd>FloatermToggle<CR>", mode = { "n", "i", "v", "t" }, desc = "Toggle floating terminal" }
    }
}          

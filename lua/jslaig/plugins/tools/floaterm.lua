return {
    "jslaig/floaterm",
    dependencies = "nvzone/volt",
    opts = {
        border = true
    },
    cmd = "FloatermToggle",
    keys = {
        -- Toggle floating terminal with <leader>`
        { "<C-\\>", "<cmd>FloatermToggle<CR>", mode = { "n", "i", "t" }, desc = "Toggle floating terminal" }
    }
}          

return {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = {
        border = true
    },
    cmd = "FloatermToggle",
    keys = {
        -- Toggle floating terminal with <leader>`
        { "<leader>`", "<cmd>FloatermToggle<CR>", desc = "Toggle floating terminal" }
    }
}          

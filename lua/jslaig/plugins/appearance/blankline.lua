
return {
    "lukas-reineke/indent-blankline.nvim",
    version = "2.20.7",  -- make sure it's v2
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        char = "│",
        show_trailing_blankline_indent = false,
        show_current_context = true,
        show_current_context_start = false,
    }
}


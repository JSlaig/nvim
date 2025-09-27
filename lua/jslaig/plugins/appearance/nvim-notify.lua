return {
    "rcarriga/nvim-notify", -- Better notifications
    event = "UIEnter",
    config = function()
        vim.defer_fn(
            function()
                require("notify").setup({
                    background_colour = "#000000",
                })
            end,
            100
        )
    end,
}

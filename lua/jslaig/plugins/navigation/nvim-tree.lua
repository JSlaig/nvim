return {
	"nvim-tree/nvim-tree.lua", -- File tree
	event = "UIEnter",
	-- event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>n", ":NvimTreeFindFileToggle<CR>", desc = "NvimTree" },
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
        config = function()
            vim.g.leaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

        vim.defer_fn(function()
            require("nvim-tree").setup({
                update_cwd = true,
                view = {
                    adaptive_size = true,
                    centralize_selection = true,
                },
            })
        end, 100)
    end,
}

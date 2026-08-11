return {
	"ribru17/bamboo.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("bamboo").setup({})
		require("bamboo").load()

		local apply_dashboard_links = function()
			local links = {
				SnacksDashboardHeader = "DashboardHeader",
				SnacksDashboardKey = "DashboardKey",
				SnacksDashboardDesc = "DashboardDesc",
				SnacksDashboardIcon = "DashboardIcon",
				SnacksDashboardFooter = "DashboardFooter",
				SnacksDashboardShortCut = "DashboardShortCut",
				SnacksDashboardNormal = "Normal",
				SnacksDashboardTitle = "Title",
			}
			for hl, link in pairs(links) do
				vim.api.nvim_set_hl(0, hl, { link = link })
			end
		end

		apply_dashboard_links()
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = apply_dashboard_links,
		})
	end
}

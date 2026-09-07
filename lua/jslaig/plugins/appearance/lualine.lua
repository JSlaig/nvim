return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
            local modified = {
                function()
                    return vim.bo.modified and "  UNSAVED  " or ""
                end,

                color = {
                    fg = "#FFFFFF",
                    bg = "#E06C75",
                    gui = "bold",
                },
            }
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "auto",

                    globalstatus = false,

                    component_separators = "❖",
                    section_separators = { left = "", right = "" },
                },

                sections = {
                    lualine_a = { "mode" },

                    lualine_b = {
                        { "filename", path = 1 },
                        modified,
                    },

                    lualine_c = {},

                    lualine_x = {
                        "encoding",
                        "fileformat",
                        "filetype",
                    "showcmd"
                    },

                    lualine_y = { "progress" },
                    lualine_z = {
                        function()
                            return os.date()
                        end,
                    },
                },

                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {
                        { "filename", path = 1 },
                        modified,
                    },
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
            })
    end,
}

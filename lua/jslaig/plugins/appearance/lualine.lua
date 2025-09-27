return {
    'nvim-lualine/lualine.nvim', -- Status line
    event = "UIEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    setup = function()
        -- Any setup code can go here if needed
    end,
    config = function()
        vim.defer_fn(
            function()
                require('lualine').setup {
                    options = {
                        icons_enabled = true,
                        theme = 'auto',
                        component_separators = '❖',
                        section_separators = { left = '', right = '' },            
                    },
                    sections = {
                        lualine_a = {
                            'mode'
                        },
                        lualine_b = {
                            {
                                'filename',
                                path = 1,
                            },
                        },
                        lualine_c = {
                            'filename',
                        },
                        lualine_x = {
                            'encoding', 'fileformat', 'filetype', 
                        },
                        lualine_y = { 
                            'progress'
                        },
                        lualine_z = { "os.date()" }
                    }
                }
            end,
            100
        )
    end
}


require('leap').create_default_mappings()

-- Modify binding for backward search (forward search still being 's')
vim.keymap.set({'n', 'x', 'o'}, 'm', '<Plug>(leap-backward)')

return {
    '2kabhishek/seeker.nvim',
    dependencies = { 'folke/snacks.nvim' },
    cmd = { 'Seeker' },
    keys = {
        { '<leader>ff', ':Seeker files<CR>', desc = 'Seek Files' },
        { '<leader>fg', ':Seeker grep<CR>', desc = 'Seek Grep' },
        { '<leader>fw', ':Seeker grep_word<CR>', desc = 'Seek Grep Word' },
    },
    opts = {
        picker_opts = {
            smartcase = true,
        }
    }, -- Required unless you call seeker.setup() manually, add your configs here
}


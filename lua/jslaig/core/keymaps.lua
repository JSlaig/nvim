local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

-- Set up the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2

vim.opt.autowrite = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true


-- ############################################################################
-- Mappings for quick editing the file
-- ############################################################################

-- Remove F1 mapping for help
mapper("", "<F1>", "<Nop>")

-- "r" to re-do
mapper("n", "r", "<C-r>")

-- "tt" To duplicate line
mapper("n", "tt", ":t.<CR>")

-- Make d actually delete
mapper("n", "dd", '"_dd')
mapper("n", "d", '"_d')
mapper("v", "d", '"_d')

-- Command to move highlighted lines
mapper("x", "<c-j>", ":m '>+1<cr>gv=gv")
mapper("x", "<c-k>", ":m '<-2<cr>gv=gv")

-- Command to quickly enter replace mode
-- SIDENOTE: Use "I" after the replace in order to be case-sensitive
mapper("n", "<leader>c/r", ":%s/\\<<C-r><C-w>\\>//Ig<left><left><left>")
mapper("n", "<Leader>/r", ":%s//Ig<left><left><left>")

-- Command to auto-indent whole file
mapper("n", "<leader>fw", ":<C-u>normal gg=G``<CR>")

-- ############################################################################
-- Mappings for fast moving across the file
-- ############################################################################

-- just like the primeagen would say, just ZZ like a real man

-- "<leader>w" to save
mapper("n", "<leader>w", ":w<CR>")

-- Create split
mapper("n", "<leader>s", ":vsplit<CR>")
mapper("n", "<leader>vs", ":split<CR>")

-- Move across splits
mapper("n", "<leader>y", "<C-w>l")
mapper("n", "<leader>t", "<C-w>h")
mapper("n", "<leader>vk", "<C-w>k")
mapper("n", "<leader>vj", "<C-w>j")

mapper("n", "[[", "gg^")
mapper("v", "[[", "gg^")

mapper("n", "]]", "G$")
mapper("v", "]]", "G$")

mapper("n", "gg", "gg^")
mapper("v", "gg", "gg^")

mapper("n", "G", "G^")
mapper("v", "G", "G^")



-- ############################################################################
-- Mappings for terminal mode
-- ############################################################################
 
-- Esc to escape terminal
mapper('t', '<Esc>', '<C-\\><C-n>')

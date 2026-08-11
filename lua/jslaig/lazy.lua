local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop

if not uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "jslaig.plugins.appearance" }, -- Plugins that manage dialogs, colors, dashboard, etc
    { import = "jslaig.plugins.navigation" }, -- Plugins to ease navigation in and between files
    { import = "jslaig.plugins.tools" }, -- Additional tools
    { import = "jslaig.plugins.ide" }, -- Syntax and workspace aware plugins for references, linting, syntax highlighting, etc

    -- { import = "jslaig.plugins" }, -- Uncategorized plugins
},{
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    }
}) 


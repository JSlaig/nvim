local o = vim.o
local wo = vim.wo
local opt = vim.opt

-- Line numbers and relative numbers
wo.number = true
wo.relativenumber = true

o.clipboard = "unnamedplus"

o.splitright = true
o.hidden = true
o.lazyredraw = false
o.expandtab = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

o.shell = "pwsh"
o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false

--opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.cursorcolumn = true
opt.cursorline = true

opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"

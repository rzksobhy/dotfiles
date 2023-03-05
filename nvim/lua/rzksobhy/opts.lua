vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.colorcolumn = "99"

vim.opt.wrap = false

vim.opt.isfname:append("@-@")
-- vim.opt.iskeyword:remove("_")

local indent_width = 4
vim.opt.tabstop = indent_width
vim.opt.softtabstop = indent_width
vim.opt.shiftwidth = indent_width
vim.opt.expandtab = true

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.confirm = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.showmode = false

vim.opt.mouse = "a"
vim.opt.guicursor = ""

vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3
vim.opt.clipboard = "unnamedplus"
vim.opt.autowrite = true

vim.opt.termguicolors = true
vim.opt.updatetime = 49

vim.opt.scrolloff = 7
vim.opt.sidescrolloff = 9

vim.g.netrw_banner = 0

vim.g.mapleader = " "

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.wildmode = ""
-- vim.opt.wildmode = "longest:full,full"

vim.opt.grepprg = "rg --vimgrep"

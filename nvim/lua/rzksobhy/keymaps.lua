local Remap = require("map")
local inoremap = Remap.inoremap
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local tnoremap = Remap.tnoremap

nnoremap("<leader>e", ":Ex<CR>")

nnoremap("gq", ":tabclose<CR>")
nnoremap("g]", ":tabnext<CR>")
nnoremap("g[", ":tabprev<CR>")
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

nnoremap("<", "<<")
nnoremap(">", ">>")
vnoremap("<", "<gv")
vnoremap(">", ">gv")

nnoremap("<M-j>", ":m +1<CR>==")
nnoremap("<M-k>", ":m -2<CR>==")
vnoremap("<M-j>", ":m '>+1<CR>gv=gv")
vnoremap("<M-k>", ":m '<-2<CR>gv=gv")

-- better escape
inoremap("<C-c>", "<ESC>")
vnoremap("<C-c>", "<ESC>")
nnoremap("<C-c>", "<ESC>")
xnoremap("<C-c>", "<ESC>")
tnoremap("<C-c>", "<C-\\><C-n>")

-- stay at the center
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

nnoremap("<leader>p", '"_dP')

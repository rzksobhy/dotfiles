require("rzksobhy.disable_builtin")
require("rzksobhy.opts")
require("rzksobhy.keymaps")
require("rzksobhy.packer")
require("rzksobhy.telescope")
require("rzksobhy.nvim-tree")
require("rzksobhy.treesitter")
require("rzksobhy.cmp")

require("lualine").setup()

require("onedark").setup({
    style = 'dark',
    diagnostics = {
        darker = false,
        undercurl = true,
        background = true,
    },
})
vim.cmd("colorscheme onedark")

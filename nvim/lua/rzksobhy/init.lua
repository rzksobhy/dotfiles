require("rzksobhy.disable_builtin")
require("rzksobhy.opts")
require("rzksobhy.keymaps")
require("rzksobhy.packer")
require("rzksobhy.visual-multi")
require("rzksobhy.telescope")
require("rzksobhy.treesitter")
require("rzksobhy.cmp")
require("rzksobhy.lsp")
require("rzksobhy.null-ls")

require("mason").setup()
require("fidget").setup()
require("nvim-autopairs").setup()
require("Comment").setup()

require("onedark").setup({
    style = "dark",
    code_style = {
        comments = "none",
    },
    diagnostics = {
        darker = false,
        undercurl = true,
        background = true,
    },
})
vim.cmd("colorscheme onedark")

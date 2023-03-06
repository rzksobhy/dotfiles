local nnoremap = require("map").nnoremap

require("nvim-tree").setup({
    disable_netrw = true,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = true,
    view = {
        width = {
            min = 30,
            padding = 2,
        },
        float = {
            enable = true,
        },
    },
})

nnoremap("<leader>e", ":NvimTreeToggle<CR>")

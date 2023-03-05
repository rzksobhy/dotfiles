local telescope = require("telescope")
local themes = require("telescope.themes")
local fb_actions = require "telescope".extensions.file_browser.actions

local nnoremap = require("map").nnoremap

telescope.setup({
    extensions = {
        ["fzf"] = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        ["ui-select"] = {
            themes.get_dropdown(),
        },
    },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

local nnoremap = require("map").nnoremap
local builtin = require("telescope.builtin")

nnoremap("<C-p>", builtin.git_files)
nnoremap("<leader>pf", function ()
    builtin.find_files()
end)

nnoremap("<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
nnoremap("<leader>pw", function()
    builtin.grep_string({ search = vim.fn.expand("<cword>") })
end)
nnoremap("<leader>pW", function()
    builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
end)

nnoremap("<leader>ph", function ()
    builtin.help_tags(themes.get_dropdown({
        previewer = false
    }))
end)

nnoremap("<leader>pk", builtin.keymaps)

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

vim.cmd([[packadd packer.nvim]])

local packer = require("packer")

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use("lewis6991/impatient.nvim")
    use("nvim-lua/plenary.nvim")
    use("numToStr/Comment.nvim")
    use("windwp/nvim-autopairs")
    use("mg979/vim-visual-multi")
    use("tpope/vim-fugitive")
    use("navarasu/onedark.nvim")
    use("nvim-tree/nvim-web-devicons")
    use("williamboman/mason.nvim")
    use({
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects",
    })
    use({
        "nvim-telescope/telescope.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    })
    use({
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lua",
    })
    use({
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    })
    use({
        "neovim/nvim-lspconfig",
        "onsails/lspkind-nvim",
        "j-hui/fidget.nvim",
        "jose-elias-alvarez/null-ls.nvim",
    })
    use("b0o/SchemaStore.nvim")
end)

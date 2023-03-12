local lsp = require("lspconfig")
local nnoremap = require("map").nnoremap

local defaults = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

---@param server string
---@param opts table|nil
local function setup(server, opts)
    opts = opts or {}
    opts = vim.tbl_deep_extend("force", defaults, opts)

    lsp[server].setup(opts)
end

vim.diagnostic.config({
    virtual_text = true, -- disable virtual text
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "single",
        source = "always",
        header = "",
        prefix = "",
    },
})

local group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end

        local bufnr = args.buf
        local buf_opts = { buffer = bufnr }

        nnoremap("gd", vim.lsp.buf.definition, buf_opts)
        nnoremap("K", vim.lsp.buf.hover, buf_opts)
        nnoremap("gr", vim.lsp.buf.references, buf_opts)
        nnoremap("<leader>la", vim.lsp.buf.code_action, buf_opts)
        nnoremap("<leader>ld", vim.diagnostic.open_float, buf_opts)
        nnoremap("<leader>ls", vim.lsp.buf.signature_help, buf_opts)
        nnoremap("<leader>lr", vim.lsp.buf.rename, buf_opts)
        nnoremap("<leader>lf", vim.lsp.buf.format, buf_opts)
    end,
})

setup("rust_analyzer", {
    cmd = { "rustup", "run", "stable", "rust-analuzer" },
})

setup("cmake")
setup("clangd", {
    cmd = {
        "clangd",
        "--index",
        "--background-index",
        "--pch-storage=memory",
        "--clang-tidy",
        "--suggest-missing-includes",
        "--all-scopes-completion",
        "--pretty",
        "--header-insertion=never",
        "-j=4",
        "--inlay-hints",
        "--header-insertion-decorators",
    },
})

setup("pyright")
setup("bashls")
setup("html")
setup("cssls")
setup("tsserver")
setup("jsonls", {
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
})

setup("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

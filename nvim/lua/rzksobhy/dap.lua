local dap = require("dap")
local dap_ui = require("dapui")
local dap_vtext = require("nvim-dap-virtual-text")

local nnoremap = require("map").nnoremap

nnoremap("<F9>", dap.toggle_breakpoint)
nnoremap("<F5>", dap.continue)

dap.listeners.after.event_initialized["rzksobhy"] = function()
    nnoremap("<F1>", dap.close)
    nnoremap("<F4>", dap_ui.toggle)
    nnoremap("<F10>", dap.step_over)
    nnoremap("<F11>", dap.step_into)
    nnoremap("<F11>", dap.step_out)

    dap_vtext.enable()
end

local function close()
    pcall(vim.keymap.del, "n", "<F1>")
    pcall(vim.keymap.del, "n", "<F4>")
    pcall(vim.keymap.del, "n", "<F10>")
    pcall(vim.keymap.del, "n", "<F11>")
    pcall(vim.keymap.del, "n", "<F11>")

    dap_ui.close()
    dap_vtext.disable()
end

dap.listeners.before.event_terminated["rzksobhy"] = close
dap.listeners.before.event_exited["rzksobhy"] = close

dap_ui.setup()
dap_vtext.setup({})

-- TODO: fix lldb setup
dap.adapters.lldb = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
    name = "lldb",
}

dap.configurations.c = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.cpp = dap.configurations.c

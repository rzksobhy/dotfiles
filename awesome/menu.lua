local hotkeys_popup = require("awful.hotkeys_popup")
local awful = require("awful")
local menubar = require("menubar")
local beautiful = require("beautiful")

local vars = require("variables")

local M = {}

local awesome_menu = {
    {
        "hotkeys",
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end,
    },
    { "manual", vars.terminal .. " -e man awesome" },
    { "restart", awesome.restart },
    {
        "quit",
        function()
            awesome.quit()
        end,
    },
}

M.menu = awful.menu({
    items = {
        { "awesome", awesome_menu, beautiful.awesome_icon },
        { "open terminal", vars.terminal },
    },
})

M.launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = M.menu,
})

menubar.utils.terminal = vars.terminal

return M

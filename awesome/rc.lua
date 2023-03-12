-- If LuaRocks is installed, make sure that packages installed through it are
pcall(require, "luarocks.loader")

local gears = require("gears")
local beautiful = require("beautiful")
local awful = require("awful")

-- awesome builtin
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

require("error-handling")
require("variables")
require("keymaps")
require("tags")
require("wibar")
require("rules")
require("signals")
require("wallpaper")

local keymaps = require("keymaps")
local buttons = require("buttons")
root.keys(keymaps.global)
root.buttons(buttons.global)

awful.spawn.with_shell("setxkbmap -layout us,ara -option grp:alt_shift_toggle")

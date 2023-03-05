local gears = require("gears")
local beautiful = require("beautiful")
local awful = require("awful")

local function set_wallpaper(s)
    local wallpaper = require("variables").wallpaper
    gears.wallpaper.maximized(wallpaper, s, true)
end

screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)
end)

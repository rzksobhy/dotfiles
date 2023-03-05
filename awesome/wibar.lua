local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

local buttons = require("buttons")
local menu = require("menu")

local keyboard_layout = awful.widget.keyboardlayout()
local text_clock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
    s.layoutbox = awful.widget.layoutbox(s)
    s.layoutbox:buttons(gears.table.join(
        awful.button({}, 1, function()
            awful.layout.inc(1)
        end),
        awful.button({}, 3, function()
            awful.layout.inc(-1)
        end),
        awful.button({}, 4, function()
            awful.layout.inc(1)
        end),
        awful.button({}, 5, function()
            awful.layout.inc(-1)
        end)
    ))

    s.taglist = awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = buttons.taglist,
    })

    s.tasklist = awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = buttons.tasklist,
    })

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })
    s.mywibox:setup({
        layout = wibox.layout.align.horizontal,
        {
            -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            menu.launcher,
            s.taglist,
        },
        s.tasklist, -- Middle widget
        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            keyboard_layout,
            wibox.widget.systray(),
            text_clock,
            s.layoutbox,
        },
    })
end)

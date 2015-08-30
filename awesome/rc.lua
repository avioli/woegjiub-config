-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local configdir = awful.util.getdir("config")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init(configdir .. "/theme.lua")

-- Widgets are pulled in after the theme to keep theme settings
require("volume")

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
modkey = "Mod4"

-- Get XDG directories
XDG_CACHE_HOME = os.getenv("XDG_CACHE_HOME")
XDG_CONFIG_HOME = os.getenv("XDG_CONFIG_HOME")
XDG_DATA_HOME = os.getenv("XDG_DATA_HOME")

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts = { awful.layout.suit.tile }
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "端末第一", "端末第二", "電網第一",  "電網第二", "雑多" }, s, layouts[1])
end
-- }}}

-- Create a textclock widget
mytextclock = awful.widget.textclock("%F %H:%M")

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end)
                    )

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()

    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(volume_widget)
    right_layout:add(mytextclock)

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    awful.key({ modkey,           }, "b",
        function ()
            mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible
        end),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey, "Shift"   }, "Tab",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),

    -- Standard program
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),
    awful.key({ "Control", "Mod1" }, "Delete", function () awful.util.spawn( terminal .. " -e sudo poweroff") end),
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "+",     function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),
    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey            }, "space",     function () mypromptbox[mouse.screen]:run() end),

    -- Launchers
    awful.key({ modkey,           }, "Return", function ()
        awful.util.spawn(terminal) end),
    awful.key({ modkey,           }, "f", function ()
        awful.util.spawn("firefox-developer -profile " .. XDG_CONFIG_HOME .. "/firefox") end),
    awful.key({                   }, "XF86AudioPlay", function()
        awful.util.spawn("mpc toggle") end),
    awful.key({                   }, "Pause", function()
        awful.util.spawn("mpc toggle") end),
    awful.key({ modkey,           }, "XF86AudioPlay", function()
        awful.util.spawn( terminal .. " -e ncmpcpp -c '" .. XDG_CONFIG_HOME .. "/ncmpcpp/config'") end),
    awful.key({ modkey,           }, "Pause", function()
        awful.util.spawn( terminal .. " -e ncmpcpp -c '" .. XDG_CONFIG_HOME .. "/ncmpcpp/config'") end),
    awful.key({ "Control",        }, "XF86AudioPlay", function()
        awful.util.spawn('mpc-random') end),
    awful.key({ "Control",        }, "Pause", function()
        awful.util.spawn('mpc-random') end),
    awful.key({ }, "XF86AudioRaiseVolume", function ()
       awful.util.spawn("amixer set Master 3%+", false) end),
    awful.key({ }, "XF86AudioLowerVolume", function ()
       awful.util.spawn("amixer set Master 3%-", false) end),
    awful.key({ modkey, "Control" }, "Up", function ()
       awful.util.spawn("amixer set Master 3%+", false) end),
    awful.key({ modkey, "Control" }, "Down", function ()
       awful.util.spawn("amixer set Master 3%-", false) end),
    awful.key({ }, "XF86AudioMute", function ()
       awful.util.spawn("amixer sset Master toggle", false) end),
    awful.key({ modkey            }, "c", function()
        awful.util.spawn( "localc" ) end),
    awful.key({ modkey            }, "a", function()
        awful.util.spawn( "anki -b " .. XDG_DATA_HOME .. "/anki" ) end),
    awful.key({ modkey            }, "p", function()
        awful.util.spawn( terminal .. " -e bpython" ) end),
    awful.key({ modkey            }, "m", function()
        awful.util.spawn( terminal .. " -e mutt -F " .. XDG_CONFIG_HOME .. "/mutt/muttrc" ) end),
    awful.key({                   }, "XF86KbdBrightnessDown", function()
        awful.util.spawn("kbdlight down") end),
    awful.key({                   }, "XF86KbdBrightnessUp", function()
        awful.util.spawn("kbdlight up") end),
    awful.key({                   }, "XF86PowerOff", function()
        awful.util.spawn("xset dpms force off") end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "q",      function (c) c:kill()                         end),
    awful.key({ "Mod1",           }, "F4",     function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "Up",
        function (c)
            c.fullscreen = not c.fullscreen
        end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.movetotag(tag)
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.toggletag(tag)
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     -- fixed LibreOffice opening floated
                     --maximised_vertical=false,
                     --maximised_horizontal=false,
                     buttons = clientbuttons } },
    -- Floating Desktop Calculator
    { rule = { name = "bc$" },
        properties = {  floating = true,
                        width = 580,
                        height = 320,
                        x = 700,
                        y = 350 } },
    -- Mplayer should never float
    { rule = { name = "mpv" },
        properties = { floating = false } },
    -- Fix Fullscreen Firefox Video
    { rule = { instance = "plugin-container" },
        properties = { floating = true } },
    -- Fix dialogs
    { rule_any = { class = {"pinentry"}, type = {"dialog"} },
      properties = { floating = true } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

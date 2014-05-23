-------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "Liberation Sans 12"

theme.bg_normal     = "#111111"
theme.bg_focus      = "#550099"
theme.bg_urgent     = "#770000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#aaaaaa"
theme.fg_urgent     = "#770000"
theme.fg_minimize   = theme.fg_normal

theme.border_width  = 3
theme.border_normal = "#000000"
theme.border_focus  = "#550099"
theme.border_marked = "#91231c"

-- Display the taglist squares
theme.taglist_squares_sel   = "/usr/share/awesome/themes/default/taglist/squarefw.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/default/taglist/squarew.png"

-- Set the Background
theme.wallpaper_cmd = { "xsetroot -solid '#000000'" }

theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80


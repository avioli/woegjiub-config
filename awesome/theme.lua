-------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "Liberation Sans 9"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = 0
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- Display the taglist squares
theme.taglist_squares_sel   =
"/usr/share/awesome/themes/default/taglist/squarefw.png"
theme.taglist_squares_unsel =
"/usr/share/awesome/themes/default/taglist/squarew.png"

-- Set the Background
theme.wallpaper_cmd = { "xsetroot -solid '#000000'" }

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80


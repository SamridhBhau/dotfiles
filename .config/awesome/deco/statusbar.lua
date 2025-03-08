local gears = require("gears")
local awful     = require("awful")
local dpi = require("beautiful.xresources").apply_dpi

-- Wibox handling library
local wibox = require("wibox")

-- Custom Local Library: Common Functional Decoration
local deco = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.taglist"),
  tasklist  = require("deco.tasklist")
}

--> Widgets
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")

local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
  set_wallpaper(s)

  local bar = awful.wibar {
    position = "top",
    screen = s
  }

  -- Create a taglist widget
  local btn_tag = awful.button({}, 1, function(t) t:view_only() end)

  local mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
    widget_template = {
         {
            {
               {
                  id = "icon_role",
                  widget = wibox.widget.imagebox
               },
               left = 5,
               right = 5,
               widget = wibox.container.margin
            },
            id = "background_role",
            widget = wibox.container.background
         },
         right = 0,
         widget = wibox.container.margin,
      }
  }

  local left = {
    mytaglist,
    spacing = dpi(10),
    layout = wibox.layout.fixed.horizontal
  }


  -- Create a tasklist widget
  local tasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons
  }

  local middle = {
    tasklist,
    layout = wibox.layout.fixed.horizontal
  }

  local right = {
      mykeyboardlayout,
      brightness_widget{
            type = 'icon_and_text',
            program = 'brightnessctl',
            step = 2,        
      },
      mytextclock,
      wibox.widget.systray(),
      spacing = dpi(10),
      layout = wibox.layout.fixed.horizontal
  }

  bar : setup {
    {
      left,
      middle,
      right,
      layout = wibox.layout.align.horizontal
    },
    left = 0,
    right = 10,
    widget = wibox.container.margin
  }

end)



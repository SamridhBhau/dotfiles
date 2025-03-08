-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

RC = {} -- global namespace, on top before require any modules
RC.vars = require("main.user-variables")


-- {{{ Error handling -- }}}
require("main.error-handling")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- }}}

modkey = RC.vars.modkey
beautiful.init(gears.filesystem.get_configuration_dir() .. "mytheme.lua")

--> Custom Local Library
local main = {
  layouts = require("main.layouts"),
  menu    = require("main.menu"),
  rules   = require("main.rules"),
}

--> Custom Local Library: Keys and Mouse Binding
local binding = {
  globalbuttons = require("binding.globalbuttons"),
  clientbuttons = require("binding.clientbuttons"),
  globalkeys    = require("binding.globalkeys"),
  bindtotags    = require("binding.bindtotags"),
  clientkeys    = require("binding.clientkeys")
}

--> Layouts
RC.layouts = main.layouts()

--> Tags
require("main.tags");

--> {{{ Menu
RC.mainmenu = awful.menu({ items = main.menu() }) -- in globalkeys

--> a variable needed in statusbar (helper)
RC.launcher = awful.widget.launcher(
  { image = beautiful.awesome_icon, menu = RC.mainmenu }
)

--> Menubar configuration
--> Set the terminal for applications that require it
menubar.utils.terminal = RC.vars.terminal

--> }}}

--> {{{ Mouse and Key bindings
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)
--> }}}

--> Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-->  Statusbar: Wibar
require("deco.statusbar")

--> {{{ Rules
awful.rules.rules = main.rules(
  binding.clientkeys(),
  binding.clientbuttons()
)
--> }}}

--> Signals
require("main.signals")

awful.spawn.once("/usr/lib/polkit-kde-authentication-agent-1")
awful.spawn.once("/bin/nm-applet")

from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.config import EzKey
from libqtile import hook
import os
import subprocess


# Autostart
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call(home)


mod = "mod4"
terminal = "terminator"

keymap = {
    'M-h': lazy.layout.left(),
    'M-j': lazy.layout.down(),
    'M-k': lazy.layout.up(),
    'M-l': lazy.layout.right(),
    'M-S-h': lazy.layout.move_left(),
    'M-S-j': lazy.layout.move_down(),
    'M-S-k': lazy.layout.move_up(),
    'M-S-l': lazy.layout.move_right(),
    'M-A-h': lazy.layout.integrate_left(),
    'M-A-j': lazy.layout.integrate_down(),
    'M-A-k': lazy.layout.integrate_up(),
    'M-A-l': lazy.layout.integrate_right(),
    'M-d': lazy.layout.mode_horizontal(),
    'M-v': lazy.layout.mode_vertical(),
    'M-S-d': lazy.layout.mode_horizontal_split(),
    'M-S-v': lazy.layout.mode_vertical_split(),
    'M-a': lazy.layout.grow_width(30),
    'M-x': lazy.layout.grow_width(-30),
    'M-S-a': lazy.layout.grow_height(30),
    'M-S-x': lazy.layout.grow_height(-30),
    'M-C-5': lazy.layout.size(500),
    'M-C-8': lazy.layout.size(800),
    'M-n': lazy.layout.reset_size(),
    'M-m': lazy.window.toggle_maximize(),

    'M-<Return>': lazy.spawn(terminal),
    'M-<space>' : lazy.next_layout(),
    'M-w': lazy.window.kill(),
    'M-f': lazy.window.toggle_fullscreen(),
    'M-t': lazy.window.toggle_floating(),
    'M-C-r': lazy.reload_config(),
    'M-C-q': lazy.shutdown(),
    'M-S-m': lazy.spawn("i3lock-fancy -g"),
    'M-o':   lazy.spawn("/home/sam/.config/rofi/launcher.sh"),
    'M-C-o': lazy.spawn("flameshot gui"),
    'M-u': lazy.spawn("floorp"),

    # Sound
    '<XF86AudioLowerVolume>' : lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -2%"),
    '<XF86AudioRaiseVolume>' : lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +2%"),
    '<XF86AudioMute>' : lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
    '<XF86MonBrightnessUp>': lazy.spawn("brightnessctl set +1%"),
    '<XF86MonBrightnessDown>': lazy.spawn("brightnessctl set 1%-"),


    # Group
    'M-<period>' : lazy.screen.next_group(),
    'M-<comma>' : lazy.screen.prev_group(),
}
keys = [EzKey(k, v) for k, v in keymap.items()]

"""
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

"""


groups = [Group(i) for i in "12345"]

for i in groups:
    keys.extend(
        [
            EzKey(f"M-{i.name}", lazy.group[i.name].toscreen()),
            EzKey(f"M-S-{i.name}", lazy.window.togroup(i.name, switch_group=True)),
        ]
    )

layouts = [
    layout.Plasma(),
    #layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    #layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="sans-serif",
    fontsize=16,
    padding=4,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                #widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead widget.StatusNotifier(),
                widget.Volume(
                    update_interval=0,
                    padding=4,
                ),
                widget.Clock(format="%d-%m-%Y %a %I:%M %p"),
                widget.Systray(),
            ],
            26,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

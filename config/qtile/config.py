import os
# import re
import subprocess
import time
from typing import Callable, List

from libqtile import bar, hook, qtile
from libqtile.backend.wayland.inputs import InputConfig
from libqtile.config import (Click, Drag, DropDown, Group, Key, Match, Rule,
                             ScratchPad, Screen)
from libqtile.core.manager import Qtile
from libqtile.layout.floating import Floating
from libqtile.layout.max import Max
from libqtile.layout.tile import Tile
from libqtile.layout.xmonad import MonadThreeCol
from libqtile.lazy import lazy
from libqtile.log_utils import logger

is_main_desktop = os.getenv("COMPUTER_IDENTIFIER") == "main-desktop"
number_of_connected_outputs = int(os.getenv("NO_OF_OUTPUTS", 1))

emacs_group = "4"
current_scale = "1.4"


def scale(new_scale):
    logger.info("New scale " + new_scale)
    subprocess.Popen(["wlr-randr", "--output=DP-1", "--scale=" + new_scale])
    time.sleep(0.2)
    subprocess.Popen(["eww", "close", "bar-ultrawide"])
    time.sleep(0.2)
    subprocess.Popen(["eww", "open", "bar-ultrawide"])


def go_to_group(name: str) -> Callable:
    def _inner(qtile: Qtile) -> None:
        if len(qtile.screens) == 1:
            qtile.groups_map[name].cmd_toscreen()
            return

        if len(qtile.screens) == 2 and not is_main_desktop:
            if name in "12":
                qtile.focus_screen(0)
                qtile.groups_map[name].cmd_toscreen()
            else:
                qtile.focus_screen(1)
                qtile.groups_map[name].cmd_toscreen()
            return

        if is_main_desktop:
            global current_scale
            if name in "789":
                if current_scale == "1":
                    current_scale = "1.4"
                    scale("1.4")
                qtile.focus_screen(1)
                qtile.groups_map[name].cmd_toscreen()
            elif name in "0":
                # Special group for looking glass client
                # Since looking glass doesn't work very well with scaling, set it to 1 when
                # in this group

                if current_scale == "1.4":
                    current_scale = "1"
                    scale("1")
                qtile.focus_screen(0)
                qtile.groups_map[name].cmd_toscreen()
            else:
                if current_scale == "1":
                    current_scale = "1.4"
                    scale("1.4")
                qtile.focus_screen(0)
                qtile.groups_map[name].cmd_toscreen()
        else:
            if name in "12":
                qtile.focus_screen(0)
                qtile.groups_map[name].cmd_toscreen()
            elif name in "3456":
                qtile.focus_screen(1)
                qtile.groups_map[name].cmd_toscreen()
            else:
                qtile.focus_screen(2)
                qtile.groups_map[name].cmd_toscreen()

    return _inner


mod = "mod4"
catppuccinPalette = {
    "rosewater": "#F5E0DC",
    "flamingo": "#F2CDCD",
    "mauve": "#DDB6F2",
    "pink": "#F5C2E7",
    "maroon": "#E8A2AF",
    "red": "#F28FAD",
    "peach": "#F8BD96",
    "yellow": "#FAE3B0",
    "green": "#ABE9B3",
    "teal": "#B5E8E0",
    "blue": "#96CDFB",
    "sky": "#89DCEB",
    "lavender": "#C9CBFF",
    "black0": "#161320",
    "black1": "#1A1826",
    "black2": "#1E1E2E",
    "black3": "#302D41",
    "black4": "#575268",
    "gray0": "#6E6C7E",
    "gray1": "#988BA2",
    "gray2": "#C3BAC6",
    "white": "#D9E0EE",
}

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "Tab", lazy.layout.next(), desc="Move window focus to next window"),
    Key(
        [mod, "shift"],
        "Tab",
        lazy.layout.previous(),
        desc="Move window focus to previous window",
    ),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "s", lazy.window.toggle_floating(), desc="Toggle floating"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    Key([mod], "z", lazy.spawn("eww open --toggle bar"), desc="Toggle eww bar"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    # Use swhkd for these
    Key([mod], "Return", lazy.spawn("kitty"), desc="Launch terminal"),
    Key([mod], "e", lazy.function(go_to_group(emacs_group)), desc="Go to emacs group"),
    Key(
        [mod],
        "u",
        lazy.spawn("rofimoji --selector wofi --clipboarder wl-copy --action copy"),
        desc="Choose a unicode",
    ),
    Key(
        [mod],
        "d",
        lazy.spawn("wofi --show drun --allow-images --no-actions"),
        desc="Application launcher",
    ),
    Key(
        [mod],
        "BackSpace",
        lazy.spawn("wlogout --buttons-per-row 2 --row-spacing 20 -p layer-shell"),
        desc="Spawn logout menu",
    ),
    Key([mod], "Escape", lazy.next_layout(), desc="Toggle between layouts"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5"), desc="Raise volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 5"), desc="Lower volume"),
    Key([], "XF86AudioMute", lazy.spawn("pamixer --toggle-mute"), desc="Toggle mute"),
    Key([], "XF86AudioMedia", lazy.spawn("playerctl play-pause"), desc="Toggle play"),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc="Toggle play"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="Skip to previous"),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="Skip to next"),
    Key(
        [], "XF86MonBrightnessUp", lazy.spawn("light -A 5"), desc="Increase brightness"
    ),
    Key(
        [],
        "XF86MonBrightnessDown",
        lazy.spawn("light -U 5"),
        desc="Decrease brightness",
    ),
    # Toggle between different layouts as defined below
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key(
        [mod],
        "t",
        lazy.group["scratchpad"].dropdown_toggle("term"),
        desc="Toggle terminal",
    ),
    Key(
        [mod],
        "r",
        lazy.group["scratchpad"].dropdown_toggle("emacs-org-roam-find"),
        desc="Toggle org-roam-find",
    ),
    Key(
        [mod],
        "o",
        lazy.group["scratchpad"].dropdown_toggle("emacs-org-capture"),
        desc="Toggle org-capture",
    ),
]

if is_main_desktop:
    layout1to6 = "monadthreecol"
else:
    if number_of_connected_outputs > 1:
        layout1to6 = "tile"
    else:
        layout1to6 = "max"

groups: List[Group] = [
    Group("1", layout=layout1to6),
    Group("2", layout=layout1to6),
    Group("3", layout=layout1to6),
    Group("4", layout=layout1to6),
    Group("5", layout=layout1to6),
    Group("6", layout=layout1to6),
    Group("7", layout="tile"),
    Group("8", layout="tile"),
    Group("9", layout="tile"),
    Group("0", layout="tile"),
]


for i in groups:
    keys.append(Key([mod], i.name, lazy.function(go_to_group(i.name))))
    keys.append(
        Key(
            [mod, "shift"],
            i.name,
            lazy.window.togroup(i.name),
            desc="Move to group",
        )
    )

main_desktop_scratchpad_size = {
    "width": 0.4,
    "x": 0.3,
    "y": 0.1,
    "height": 0.7,
    "opacity": 1,
}
work_laptop_scratchpad_size = {
    "width": 0.7,
    "x": 0.15,
    "y": 0.1,
    "height": 0.7,
    "opacity": 1,
}
scratchpad_size = (
    main_desktop_scratchpad_size if is_main_desktop else work_laptop_scratchpad_size
)

groups.append(
    ScratchPad(
        "scratchpad",
        [
            DropDown("term", "kitty fish", **scratchpad_size),
            DropDown(
                "emacs-org-capture",
                "kitty emacsclient -nw -e '(org-capture)'",
                **scratchpad_size
            ),
            DropDown(
                "emacs-org-roam-find",
                "kitty emacsclient -nw -e '(org-roam-node-find)'",
                **scratchpad_size
            ),
        ],
    )
)

three_col = MonadThreeCol(
    single_margin=[15, 800, 15, 800],
    margin=0,
    border_width=1,
    border_focus=catppuccinPalette["black4"],
    border_normal=catppuccinPalette["black1"],
    single_border_width=0,
)
# TODO: Tile should only be used on work laptop if there is more than one screen
tile = Tile(
    ratio=0.5,
    margin=0,
    border_on_single=False,
    border_width=1,
    border_focus=catppuccinPalette["black4"],
    border_normal=catppuccinPalette["black1"],
    single_border_width=0,
)
if is_main_desktop:
    max = Max(
        margin=[15, 800, 15, 800],
    )
else:
    max = Max(
        margin=0,
    )


layouts = [three_col, tile, max]

if number_of_connected_outputs > 1:
    work_laptop_screens = [
        Screen(),
        Screen(left=bar.Gap(48)),
        Screen(),
    ]
else:
    work_laptop_screens = [Screen(left=bar.Gap(47))]

main_desktop_screens = [
    Screen(right=bar.Gap(46)),
    Screen(),
]

screens = main_desktop_screens if is_main_desktop else work_laptop_screens

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = [Rule(Match(wm_class=["emacs"]), group=emacs_group)]  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
floating_layout = Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(wm_class="mpv"),
        Match(wm_class="imv"),
        Match(wm_class="utility"),
        Match(wm_class="notification"),
        Match(wm_class="toolbar"),
        Match(wm_class="splash"),
        Match(wm_class="Pinentry-gtk-2"),
        Match(wm_class="qt5ct"),
        Match(wm_class="download"),
        Match(wm_class="error"),
        Match(wm_type="dialog"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
        Match(title="Open File"),
    ],
    border_width=0,
)


@hook.subscribe.focus_change
def group_change():
    eww_vars = []
    for group in qtile.groups:
        group_info = group.info()
        group_name = group_info["name"]
        # TODO: use `eww state` to check if workspace exists
        if group_name in "1234567890":
            current_variable = "ws" + group_name + "current="
            occupied_variable = "ws" + group_name + "occupied="
            if group_info["screen"] != None:
                eww_vars.append(current_variable + "true")
            else:
                eww_vars.append(current_variable + "false")

            if len(group_info["windows"]) > 0:
                eww_vars.append(occupied_variable + "true")
            else:
                eww_vars.append(occupied_variable + "false")

    subprocess.Popen(["eww", "update", *eww_vars])


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~")
    subprocess.Popen([home + "/.config/qtile/autostart.sh"])


auto_fullscreen = True
focus_on_window_activation = "never"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = {"type:keyboard": InputConfig(kb_repeat_rate=50, kb_repeat_delay=300)}

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

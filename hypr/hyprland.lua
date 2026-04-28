--[[ 
--MY NEW LUA HYPRLAND CONFIG
-- TODO: 
--]]
---@diagnostic disable-next-line: undefined-global
local hl = lh
-----------------------MONITORS--------------------
hl.monitor({
	output = "eDP-1",
	mode = "1366x768@60",
	position = 0x0,
	scale = 1,
})
-- currently the secound monitor is on the left
hl.monitor({
	output = "DP-1",
	mode = "1920x1080@60",
	position = "1366x0",
	scale = 1,
})
---------------------
---- MY PROGRAMS ----
---------------------
local terminal = "kitty"
local browser = "zen-browser"
local menu = "hyprlauncher"
local filemanager = "kitty -e yazi"
local lock = "hyprlock"
local idle = "hypridle"
local nightmode = "hyprsunset"

---------------------EnvironmenVariablen------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

---------------------Autostart----------------------
hl.on("hyprland.start", function()
	hl.exec_cmd(terminal)
	hl.exec_cmd("waybar && nm-applet")
	hl.exec_cmd(idle)
	hl.exec_cmd(nightmode)
	hl.exec_cmd("hyprlauncher -d")
end)
---------------------Permissions--------------------
hl.config({})
---------------------Loook and feel-----------------
hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,

		border_size = 1,

		col = {
			active_border = { colors = { "rgba(ffff00ff)", "rgba(ffff00ff)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = false,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
	opengj = {
		nvidia_anti_flicker = false,
	},
	render = {
		direct_scanout = true,
	},
	animations = {
		enabled = false,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
})
---------------------Input--------------------------
hl.config({
	input = {
		kb_layout = "de",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
			tap_and_drag = true,
		},
	},
})
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.1,
})

---------------------Key Bindings-------------------
---launching apps:
local mainMod = "SUPER"

hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal)({ description = "my favourite terminal" }))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(menu))
hl.bind("SUPER +  Udiaeresis", hl.dsp.exec_cmd(lock))
--maniputating windows:
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.exit())
---move focus:
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + Ssharp", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + Ssharp", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

---function keys:
hl.bind("SUPER + ISO_Level3_Shift", hl.dsp.submap("mediamode"))
hl.define_submap("mediamode", function()
	hl.bind("F1", hl.dsp.exec_cmd("playerctl previous"))
	hl.bind("F2", hl.dsp.exec_cmd("playerctl next"))
	-- TODO: add F3
	hl.bind("F3", hl.dsp.exec_cmd(""))
	hl.bind("F4", hl.dsp.exec_cmd("killall -SIGUSR1 waybar || waybar &"))
	-- TODO: add F5
	hl.bind("F5", hl.dsp.exec_cmd(""))
	hl.bind("F6", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))
	hl.bind("F7", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
	hl.bind("F8", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
	hl.bind("F9", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
	hl.bind("F10", hl.dsp.exec_cmd(" wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
	hl.bind("N", hl.dsp.exec_cmd("pkill hyprsunset || hyprsunset -t 4000"))
	hl.bind("ESCAPE", hl.dsp.submap("reset"))
end)
--------------------Windows and Workspaces----------

-- Ignore maximize requests from all apps
local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

-- Browser popup float (custom rule)
hl.window_rule({
	name = "browser-popup-float",
	match = { class = "^(zen|firefox)$" },
	float = true,
	center = true,
})

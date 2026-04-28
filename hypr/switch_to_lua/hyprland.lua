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
---------------------EnvironmenVariablen------------
hl.env("KEY", "value")
---------------------Autostart----------------------
--hl.on("hyprland.start", function()... end)
---------------------Permissions--------------------
hl.config({})
---------------------Loook and feel-----------------
hl.config({})
--hl.curve() or hl.animation() for animation
---------------------Input--------------------------
---------------------Key Bindings-------------------
---launching apps:
hl.bind("SUPER + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty")({ description = "my favourite terminal" }))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("hyprlauncher"))
hl.bind("SUPER +  Udiaeresis", hl.dsp.exec_cmd("hyprlock"))
--maniputating windows:
hl.bind("SUPER + C", hl.dsp.kill_active())
hl.bind("SUPER + M", hl.dsp.exit())
---move focus:
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
---[[ only activate if it doesn't work in the new lua config
hl.window_rule({
	name = "browser-pop-up float",
	match = {
		class = "zen" | "firefox",
	},
	float = true,
	center = true,
})
---]]

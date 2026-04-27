--[[ 
--MY NEW LUA HYPRLAND CONFIG
-- TODO: 
--]]

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
hl.bind("SUPER + T", hl.dsp.exec_cmd("firefox"))
--maniputating windows:
---move focus:
---function keys:
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

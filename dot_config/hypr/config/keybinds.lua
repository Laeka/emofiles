local defaults = require("config.defaults")
local mod = "SUPER"

local bind = hl.bind
local exec = hl.dsp.exec_cmd

local vol_mute =
	[[bash -c "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && (wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q '[MUTED]' && echo 0 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob || wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int(\$2*100)}' > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob)"]]
local vol_down =
	[[bash -c "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int(\$2*100)}' > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"]]
local vol_up =
	[[bash -c "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+ && wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int(\$2*100)}' > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"]]

-- Estructura: { "teclas", "accion", { opciones_extra } }
local keybinds = {
	-- Generales
	{ mod .. " + Q", hl.dsp.window.close() },
	{ mod .. " + T", hl.dsp.workspace.toggle_special("quake") },
	{ mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }) },
	{
		mod .. " + M",
		exec("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
	},

	-- Scripts
	{
		mod .. " + B",
		exec(defaults.bloom, {
			float = true,
			center = true,
			size = { 800, 600 },
		}),
	},

	-- Focus y Mover (Direcciones)
	{ mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }) },
	{ mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }) },
	{ mod .. " + left", hl.dsp.focus({ direction = "left" }) },
	{ mod .. " + right", hl.dsp.focus({ direction = "right" }) },

	-- Resize
	{ "ALT + Right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }) },
	{ "ALT + Left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }) },
	{ "ALT + Down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }) },
	{ "ALT + Up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }) },

	-- Apps
	{ mod .. " + RETURN", exec(defaults.terminal) },
	{ mod .. " + SPACE", exec(defaults.applauncher) },
	{ mod .. " + E", exec(defaults.filemanager) },
	{ mod .. " + U", exec(defaults.btop) },
	{ mod .. " + O", exec(defaults.logout) },
	{ "Print", exec(defaults.shot_region) },
	{ "CTRL + Print", exec(defaults.shot_screen) },
	{ "ALT + Print", exec(defaults.shot_active) },

	-- Multimedia
	{ "F7", exec("playerctl previous"), { locked = true } },
	{ "F8", exec("playerctl play-pause"), { locked = true } },
	{ "F9", exec("playerctl next"), { locked = true } },

	-- Volumen
	{ "F10", exec(vol_mute), { locked = true, repeating = true } },
	{ "F11", exec(vol_down), { locked = true, repeating = true } },
	{ "F12", exec(vol_up), { locked = true, repeating = true } },
}

for _, k in ipairs(keybinds) do
	bind(k[1], k[2], k[3])
end

for i = 1, 4 do
	local key = tostring(i)
	bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.config({
	binds = {
		allow_workspace_cycles = true,
		workspace_back_and_forth = true,
		workspace_center_on = 1,
		window_direction_monitor_fallback = true,
	},
})

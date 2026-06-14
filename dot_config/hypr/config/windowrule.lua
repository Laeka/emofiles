-- sacado de la docu
local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

if suppressMaximizeRule then
	suppressMaximizeRule:set_enabled(true)
end
-- fin de sacado de la docu

local function floating_window(name, class, size)
	hl.window_rule({
		name = name,
		match = { class = class },
		float = true,
		size = size or "700 700",
	})
end

local function centered_float(name, match, w, h, y, extra_args)
	local rule = {
		name = name,
		match = match,
		float = true,
		size = { "monitor_w * " .. w, "monitor_h * " .. h },
		-- Calcula el centro horizontal automáticamente: (1 - ancho) / 2
		move = { "monitor_w * " .. (1 - w) / 2, y or "50" },
	}

	if extra_args then
		for k, v in pairs(extra_args) do
			rule[k] = v
		end
	end

	hl.window_rule(rule)
end

-- ventanas flotantes estaticas
floating_window("floating-pavu-volumen", "org.pulseaudio.pavucontrol")
floating_window("floating-nm-internet", "nm-connection-editor")

-- ventanas flotantes middle-top
centered_float("float-ghostty", { initial_title = "float-ghostty" }, 0.6, 0.7)
centered_float(
	"terminal-quake",
	{ initial_title = "ghostty-quake" },
	0.6,
	0.4,
	"50",
	{ workspace = "special:quake silent" }
)

local window_rules = {
	{
		name = "fix-xwayland-drags",
		match = { xwayland = true, float = true },
		no_focus = true,
	},
	{
		name = "spotify-on-w3",
		match = { class = "Spotify" },
		workspace = "3 silent",
	},
	-- Estilos globales para ventanas flotantes y no flotantes
	{ match = { float = true }, border_size = 2, rounding = 8 },
	{ match = { float = false }, border_size = 3, rounding = 4 },
}

for _, config in ipairs(window_rules) do
	hl.window_rule(config)
end

local layer_rules = {
	{ match = { namespace = "logout_dialog" }, animation = "slide top" },
	{ match = { namespace = "waybar" }, no_anim = true },
}

for _, config in ipairs(layer_rules) do
	hl.layer_rule(config)
end

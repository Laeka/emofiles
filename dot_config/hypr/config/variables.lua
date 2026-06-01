local colors = require("config.colors")

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 5,
		border_size = 3,
		["col.active_border"] = colors.mauve,
		["col.inactive_border"] = colors.surface1,
		layout = "dwindle",

		snap = {
			enabled = true,
		},
	},

	misc = {
		font_family = "MesloLGS Nerd Font Mono",
		splash_font_family = "MesloLGS Nerd Font Mono",
		disable_hyprland_logo = true,
		["col.splash"] = colors.mauve,
		background_color = colors.base,

		enable_swallow = true,
		swallow_regex = "^(ghostty)$",

		focus_on_activate = true,
		vrr = 2,
	},

	render = {
		direct_scanout = true,
	},

	dwindle = {
		special_scale_factor = 0.8,
		preserve_split = true,
	},

	master = {
		new_status = "master",
		special_scale_factor = 0.8,
	},
})

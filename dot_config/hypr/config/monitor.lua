hl.monitor({
	output = "DP-1",
	mode = "1920x1080@165",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@100",
	position = "1920x0",
	scale = 1,
	transform = 3,
})

hl.workspace_rule({ workspace = 1, monitor = "DP-1", default = true, persistent = true })
hl.workspace_rule({ workspace = 2, monitor = "DP-1", persistent = true })
hl.workspace_rule({ workspace = 3, monitor = "DP-1", persistent = true })
hl.workspace_rule({ workspace = 4, monitor = "HDMI-A-1", default = true, persistent = true })

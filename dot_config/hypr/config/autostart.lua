hl.on("hyprland.start", function()
	hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
	hl.exec_cmd("/usr/bin/gnome-keyring-daemon --start --components=secrets")

	hl.exec_cmd('swaybg -o "*" -i /home/laeka/Pictures/wallpapers/jibril.jpg -m fill')
	hl.exec_cmd("waybar")
	hl.exec_cmd("mako")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("ghostty --title=ghostty-quake")

	hl.exec_cmd(
		[[bash -c "mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob"]]
	)
end)

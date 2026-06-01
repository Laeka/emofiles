local M = {}

-- apps
M.applauncher = "tofi-drun --drun-launch=true"
M.terminal = "ghostty"
M.logout = "wlogout"
M.filemanager = "ghostty --title=float-yazi -e yazi"
M.btop = 'ghostty --title="btop" -e btop'

-- screenshots
M.shot_region = "grimblast copy area"
M.shot_screen = "grimblast copy screen"
M.shot_active = "grimblast copy active"

return M

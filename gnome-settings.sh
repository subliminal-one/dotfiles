#/usr/bin/env sh

KEYS="org.gnome.desktop.wm.keybindings"

gsettings set $KEYS switch-applications "['<Super>Tab','<Alt>Tab','<Super>l']"
gsettings set $KEYS switch-applications-backward "['<Shift><Super>Tab','<Shift><Alt>Tab','<Super>o']"
gsettings set $KEYS switch-group "['<Super>Above_Tab','<Alt>Above_Tab','<Super>k']"

gsettings set $KEYS switch-to-workspace-1 "['<Super>1']"
gsettings set $KEYS switch-to-workspace-2 "['<Super>2']"
gsettings set $KEYS switch-to-workspace-3 "['<Super>3']"
gsettings set $KEYS switch-to-workspace-4 "['<Super>4']"
gsettings set $KEYS switch-to-workspace-5 "['<Super>5']"
gsettings set $KEYS switch-to-workspace-6 "['<Super>6']"
gsettings set $KEYS switch-to-workspace-7 "['<Super>7']"
gsettings set $KEYS switch-to-workspace-8 "['<Super>8']"
gsettings set $KEYS switch-to-workspace-9 "['<Super>9']"
gsettings set $KEYS switch-to-workspace-10 "['<Super>0']"

gsettings set $KEYS move-to-workspace-1 "['<Super><Shift>1']"
gsettings set $KEYS move-to-workspace-2 "['<Super><Shift>2']"
gsettings set $KEYS move-to-workspace-3 "['<Super><Shift>3']"
gsettings set $KEYS move-to-workspace-4 "['<Super><Shift>4']"
gsettings set $KEYS move-to-workspace-5 "['<Super><Shift>5']"
gsettings set $KEYS move-to-workspace-6 "['<Super><Shift>6']"
gsettings set $KEYS move-to-workspace-7 "['<Super><Shift>7']"
gsettings set $KEYS move-to-workspace-8 "['<Super><Shift>8']"
gsettings set $KEYS move-to-workspace-9 "['<Super><Shift>9']"
gsettings set $KEYS move-to-workspace-10 "['<Super><Shift>0']"

gsettings set $KEYS toggle-maximized "['<Alt>F10', '<Super><Shift>k']"
gsettings set "org.gnome.mutter.keybindings" toggle-tiled-left "['<Super><Shift>h']"
gsettings set "org.gnome.mutter.keybindings" toggle-tiled-right "['<Super><Shift>l']"

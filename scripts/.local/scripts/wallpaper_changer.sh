
#!/bin/bash


# Start swww daemon if not already running
pgrep -x swww-daemon > /dev/null || swww-daemon 

sleep 0.5  # wait for swww

# Random wallpaper
WALLPAPER=$(find "$HOME/Wallpaper/wallpapers" -type f | shuf -n 1)

# Set wallpaper
swww img "$WALLPAPER" --transition-type random --transition-duration 2

sleep 0.5

# Generate pywal colors
wal -i "$WALLPAPER" -o waybar 
sleep 1.0
# Restart Waybar
pkill waybar
sleep 0.3
waybar 

# Notify
notify-send "🎨 Theme Updated" "Wallpaper & colors applied"


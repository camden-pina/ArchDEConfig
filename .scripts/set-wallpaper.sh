#!/bin/bash
#                _ _                              
# __      ____ _| | |_ __   __ _ _ __   ___ _ __  
# \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__| 
#  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |    
#   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|    
#                   |_|         |_|               
#  
# ----------------------------------------------------- 

# ----------------------------------------------------- 
# Grab selected wallpaper from Thunar
# ----------------------------------------------------- 
thunar_file="$1"

# Cache files for holding the current wallpaper
cache_file="$HOME/.cache/current_wallpaper"
blurred="$HOME/.cache/blurred_wallpaper.png"
rasi_file="$HOME/.cache/current_wallpaper.rasi"

# Set blur for blurred wallpaper
blur="20x30"

# Create cache file if not exists
if [ ! -f $cache_file ] ;then
    touch $cache_file
    echo "$HOME/Pictures/Wallpapers/default.jpg" > "$cache_file"
fi

# Create rasi file if not exists
if [ ! -f $rasi_file ] ;then
    touch $rasi_file
    echo "* { current-image: url(\"$HOME/Pictures/Wallpapers/default.jpg\", height); }" > "$rasi_file"
fi

# Create cache file from selected wallpaper
touch $cache_file
echo "$thunar_file" > "$cache_file"

# Create rasi file from selected wallpaper
touch $rasi_file
echo "* { current-image: url(\"$thunar_file\", height); }" > "$rasi_file"

# Set current_wallpaper to selected file
current_wallpaper=$(cat "$cache_file")

# Create an load pywal color scheme
wal -q -i $current_wallpaper
source "$HOME/.cache/wal/colors.sh"
echo ":: Wallpaper: $wallpaper"

# Reload waybar with new colors
~/.config/waybar/launch.sh

# Set the new wallpaper
 transition_type="wipe"
# transition_type="outer"
# transition_type="random"

swww img $wallpaper \
    --transition-bezier .43,1.19,1,.4 \
    --transition-fps=60 \
    --transition-type=$transition_type \
    --transition-duration=0.7 \
    --transition-pos "$( hyprctl cursorpos )"

# ----------------------------------------------------- 
# Created blurred wallpaper
# -----------------------------------------------------
magick $wallpaper -resize 50% $blurred
echo ":: Resized to 50%"
magick $blurred -blur $blur $blurred
echo ":: Blurred"

# ----------------------------------------------------- 
# Write selected wallpaper into .cache files
# ----------------------------------------------------- 
echo "$wallpaper" > "$cache_file"
echo "* { current-image: url(\"$blurred\", height); }" > "$rasi_file"

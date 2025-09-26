# GNOME Background Properties

This directory contains GNOME wallpaper XML configuration files that enable day/night transitions for the Project Bluefin wallpapers.

## Structure

- **gnome-background-properties/*.xml** - GNOME wallpaper entries that define how wallpapers appear in the system background settings
- **images/*.xml** - Background transition definitions that create smooth fading between day and night variants

## Installation

These files are designed to be installed to the user's local directory structure:

```bash
# Copy gnome-background-properties files
mkdir -p ~/.local/share/gnome-background-properties/
cp gnome-background-properties/*.xml ~/.local/share/gnome-background-properties/

# Copy background transition files  
mkdir -p ~/.local/share/backgrounds/bluefin/
cp images/*.xml ~/.local/share/backgrounds/bluefin/

# Copy wallpaper assets (if not already present)
mkdir -p ~/.local/share/wallpapers/
cp -r wallpapers/* ~/.local/share/wallpapers/
```

## Wallpapers

The following wallpapers are configured with day/night transitions:

1. **Project Bluefin - Collapse** - SVG-based wallpaper with light/dark variants
2. **Project Bluefin - Framework** - WebP-based wallpaper with light/dark variants  
3. **Project Bluefin - Tenacious Pterosaur** - SVG-based wallpaper with light/dark variants

## Transition Schedule

Each wallpaper follows a 24-hour cycle:

- **Day mode** (06:05 - 18:35): Light variant displayed for 37,200 seconds (~10.3 hours)
- **Evening transition** (18:35 - 19:05): 30-minute fade from light to dark (1,800 seconds)
- **Night mode** (19:05 - 05:35): Dark variant displayed for 45,600 seconds (~12.7 hours)  
- **Morning transition** (05:35 - 06:05): 30-minute fade from dark to light (1,800 seconds)

## Technical Details

The XML files use the GNOME desktop background specification:

- Background properties follow the `gnome-wp-list.dtd` DTD
- Transition files use the GNOME background XML format with `<static>` and `<transition>` elements
- All paths use `~/.local/share` to install in user directories instead of system-wide `/usr/share`
- Smooth overlay transitions provide a fade effect between day and night variants

All XML files have been validated with xmllint for proper formatting and structure.
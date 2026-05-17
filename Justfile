# Create a day-night wallpaper for KDE Plasma
[group('Convert')]
create-daynight-kde $imageday $imagenight $outputname:
    #!/usr/bin/env bash
    scripts/create-daynight-kde.sh $imageday $imagenight $outputname

# Create a day-night wallpaper for Gnome
[group('Convert')]
create-daynight-gnome $imageday $imagenight $outputname $description:
    #!/usr/bin/env bash
    scripts/create-daynight-gnome.sh $imageday $imagenight $outputname "$description"

# Create a day-night wallpaper for macOS
[group('Convert')]
create-daynight-macos $imageday $imagenight $outputname:
    #!/usr/bin/env bash
    scripts/create-daynight-macos.sh $imageday $imagenight $outputname

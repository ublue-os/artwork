# Universal Blue Artwork Repository

This repository contains artwork assets for Universal Blue projects, including wallpapers for Bluefin, Aurora, Bazzite, and Framework editions.

## Repository Structure

```
artwork/
├── wallpapers/          # Wallpaper collections organized by project
│   ├── aurora/          # Aurora wallpapers (KDE Plasma format)
│   ├── bazzite/         # Bazzite wallpapers
│   ├── bluefin/         # Bluefin wallpapers
│   ├── bluefin-wallpapers-extra/  # Additional Bluefin wallpapers
│   ├── collapse/        # Collapse day-night wallpaper
│   ├── dusk/            # Dusk day-night wallpaper
│   ├── framework/       # Framework day-night wallpaper
│   ├── prey/            # Prey day-night wallpaper
│   └── tenacious-pterosaur/  # Tenacious Pterosaur day-night wallpaper
├── scripts/             # Conversion and build scripts
└── .github/workflows/   # GitHub Actions workflows for releases
```

## Wallpaper Categories

### Aurora Wallpapers
Located in `wallpapers/aurora/`, these wallpapers follow the KDE Plasma wallpaper package structure:
- Each wallpaper has its own directory
- `metadata.json` - Wallpaper metadata with author info and license
- `contents/images/` - Image files in various formats (JXL, PNG)
- `gnome-background-properties/` - GNOME background property files

### Bluefin Wallpapers
Located in `wallpapers/bluefin/`:
- `images/` - Day/night JXL wallpapers numbered 01-12 (monthly themes)
- `gnome-background-properties/` - GNOME background property files
- `kde-support/` - AVIF files for KDE Plasma dynamic wallpapers
- XML files define day/night transitions for GNOME

### Bazzite Wallpapers
Located in `wallpapers/bazzite/`:
- `images/` - Static wallpaper images
- `gnome-background-properties/` - GNOME background property files

### Day-Night Wallpapers
Several wallpapers support day/night transitions:
- `collapse/` - Day/night SVG wallpapers
- `dusk/` - Day/night JXL wallpapers
- `framework/` - Day/night SVG wallpapers
- `prey/` - Day/night SVG wallpapers
- `tenacious-pterosaur/` - Day/night SVG wallpapers

Each day-night wallpaper contains:
- Source image files (`*-day.*`, `*-night.*`) in various formats (SVG, JXL)
- `gnome/` - GNOME-specific files (XML manifest and background properties)
- `kde/` - KDE Plasma AVIF dynamic wallpaper files (optional)
- `macos/` - macOS HEIC dynamic wallpaper files (optional)

### Extra Wallpapers
The `wallpapers/bluefin-wallpapers-extra/` directory contains legacy duplicate files. The extra wallpapers (collapse, dusk, prey, tenacious-pterosaur) are now organized in their own directories as listed above.

## Scripts and Tools

### Justfile Commands
The repository uses [Just](https://github.com/casey/just) for task automation:

```bash
# Create a day-night wallpaper for KDE Plasma
just create-daynight-kde <imageday> <imagenight> <outputname>

# Create a day-night wallpaper for GNOME
just create-daynight-gnome <imageday> <imagenight> <outputname> <description>
```

### Scripts

#### `scripts/create-daynight-kde.sh`
Creates day-night dynamic wallpapers for KDE Plasma:
- Takes day and night images as input
- Generates AVIF dynamic wallpaper using `kdynamicwallpaperbuilder`
- Outputs to `output/<outputname>/kde/`

#### `scripts/create-daynight-gnome.sh`
Creates day-night dynamic wallpapers for GNOME:
- Takes day and night images as input
- Generates XML manifest for GNOME background transitions
- Creates GNOME background properties file
- Outputs to `output/<outputname>/gnome/`

## Wallpaper Format Details

### GNOME Format
GNOME wallpapers use XML manifests that define:
- Static periods (day/night)
- Transition periods between day and night
- File paths pointing to `~/.local/share/backgrounds/bluefin/`

### KDE Plasma Format
KDE wallpapers use:
- AVIF format for dynamic wallpapers
- `metadata.json` files with KPlugin structure
- `contents/images/` directory for image assets

## GitHub Actions Workflows

The repository includes automated release workflows:

- `build-and-release-all.yaml` - Triggers all wallpaper release workflows
- `bluefin-wallpapers.yaml` - Releases Bluefin wallpapers with KDE/GNOME support
- `bluefin-wallpapers-extra.yaml` - Releases extra Bluefin wallpapers
- `aurora-wallpapers.yaml` - Releases Aurora wallpapers
- `bazzite-wallpapers.yaml` - Releases Bazzite wallpapers
- `framework-wallpapers.yaml` - Releases Framework wallpapers

### Release Strategy

Each wallpaper pack has its own versioned release tag:
- Bluefin: `bluefin-v{YYYY-MM-DD}` (e.g., `bluefin-v2024-01-15`)
- Bluefin Extra: `bluefin-extra-v{YYYY-MM-DD}`
- Aurora: `aurora-v{YYYY-MM-DD}`
- Bazzite: `bazzite-v{YYYY-MM-DD}`
- Framework: `framework-v{YYYY-MM-DD}`

## Contributing

When adding new wallpapers:

1. Follow the existing directory structure for your target project
2. For day-night wallpapers, provide both day and night variants
3. Include appropriate metadata files (`metadata.json` for Aurora)
4. Add GNOME background properties if targeting GNOME
5. Use the provided scripts to generate platform-specific formats

## License

This repository is licensed under the Apache License 2.0. See [LICENSE](LICENSE) for details.

Individual wallpapers may have different licenses - check the `metadata.json` files for specific licensing information.

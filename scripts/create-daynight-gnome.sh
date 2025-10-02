#!/usr/bin/env bash

imageday="$1"
imagenight="$2"
outputname="$3"
description="$4"

echo "Creating $outputname for Gnome"

filename=$(basename -- "$imageday")
extension="${filename##*.}"

manifest="$outputname.xml"
cat > "$manifest" << EOF
<background>
    <starttime>
            <year>2018</year>
            <month>1</month>
            <day>1</day>
            <hour>6</hour>
            <minute>5</minute>
            <second>0</second>
    </starttime>

    <static>
            <file>~/.local/share/backgrounds/bluefin/$outputname-day.$extension</file>
            <duration>37200.0</duration>
    </static>

    <transition type="overlay">
            <duration>1800.0</duration>
            <from>~/.local/share/backgrounds/bluefin/$outputname-day.$extension</from>
            <to>~/.local/share/backgrounds/bluefin/$outputname-night.$extension</to>
    </transition>

    <static>
            <file>~/.local/share/backgrounds/bluefin/$outputname-night.$extension</file>
            <duration>45600.0</duration>
    </static>

    <transition type="overlay">
            <duration>1800.0</duration>
            <from>~/.local/share/backgrounds/bluefin/$outputname-night.$extension</from>
            <to>~/.local/share/backgrounds/bluefin/$outputname-day.$extension</to>
    </transition>
</background>
EOF

properties="$outputname-properties.xml"
cat > "$properties" << EOF
<?xml version="1.0"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
  <wallpaper deleted="false">
    <name>$description</name>
    <filename>~/.local/share/backgrounds/bluefin/$outputname.xml</filename>
    <options>zoom</options>
    <shade_type>solid</shade_type>
    <pcolor>#464646</pcolor>
    <scolor>#464646</scolor>
  </wallpaper>
</wallpapers>
EOF

mkdir -p output/$outputname/gnome/gnome-background-properties
cp "$imageday" "output/$outputname/gnome/$outputname-day.$extension"
cp "$imagenight" "output/$outputname/gnome/$outputname-night.$extension"
mv "$manifest" "output/$outputname/gnome/$outputname.xml"
mv "$properties" "output/$outputname/gnome/gnome-background-properties/$outputname.xml"
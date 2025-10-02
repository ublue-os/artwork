#!/usr/bin/env bash

imageday="$1"
imagenight="$2"
outputname="$3"

echo "Creating $outputname for KDE"

manifest="$outputname.json"
cat > "$manifest" << EOF
{
  "Type": "day-night",
  "Meta": [
    {
      "TimeOfDay": "day",
      "FileName": "${imageday}"
    },
    {
      "TimeOfDay": "night",
      "FileName": "${imagenight}"
    }
  ]
}
EOF

mkdir -p output/$outputname/kde
kdynamicwallpaperbuilder --speed 8 $manifest --output output/$outputname/kde/$outputname.avif
rm $manifest
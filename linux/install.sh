#!/bin/bash

# Path to Nautilus
NAUTILUS_PATH=$(command -v nautilus)

# Check if Nautilus is installed
if [ -z "$NAUTILUS_PATH" ]; then
  echo "Nautilus is not installed. Aborting."
  exit 1
fi

# Create the desktop file directly in the "~/.local/share/applications/" folder
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=OpenSmbLink
Exec=$NAUTILUS_PATH %u
Icon=network-server
Terminal=false
MimeType=x-scheme-handler/smb;
NoDisplay=true" > ~/.local/share/applications/opensmb-handler.desktop

# Update the MIME database
update-desktop-database ~/.local/share/applications/


#!/bin/bash
STEAM_COMMON="$HOME/Library/Application\ Support/Steam/steamapps/common/Balatro"
BALATRO_MODS="$HOME/Library/Application\ Support/Balatro/Mods"
SHELL_PROFILE=""

if [[ $SHELL == *"zsh"* ]]; then
  SHELL_PROFILE="$HOME/.zshrc"
else
  SHELL_PROFILE="$HOME/.bash_profile"
fi

sed -i.bak "/alias balatro-mod/d" "$SHELL_PROFILE"
echo "Removed alias from $SHELL_PROFILE"

if [ -d "$STEAM_COMMON" ]; then
  rm "$STEAM_COMMON/liblovely.dylib"
  rm "$STEAM_COMMON/run_lovely.sh"
  echo "Removed lovely-injector files from $STEAM_COMMON"
else
  echo "No lovely-injector files found at $STEAM_COMMON"
fi

if [ -d "$BALATRO_MODS/steamodded" ]; then
  rm -rf "$BALATRO_MODS/steamodded"
  echo "Removed steamodded repository from $BALATRO_MODS"
else
  echo "No steamodded repository found at $BALATRO_MODS"
fi

if [ -d "$BALATRO_MODS" ] && [ -z "$(ls -A "$BALATRO_MODS")" ]; then
  rmdir "$BALATRO_MODS"
  echo "Removed empty Mods folder: $BALATRO_MODS"
else
  echo "Mods folder is not empty or does not exist: $BALATRO_MODS"
fi

echo "Uninstallation complete!"

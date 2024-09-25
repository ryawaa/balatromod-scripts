#!/bin/bash
ARCH=$(uname -m)
if [[ "$ARCH" == "arm64" ]]; then
  echo "Running on an ARM Mac"
  INJECTOR_URL="https://github.com/ethangreen-dev/lovely-injector/releases/latest/download/lovely-aarch64-apple-darwin.tar.gz"
else
  echo "Running on an Intel Mac"
  INJECTOR_URL="https://github.com/ethangreen-dev/lovely-injector/releases/latest/download/lovely-x86_64-apple-darwin.tar.gz"
fi

echo "Downloading lovely-injector..."
curl -L "$INJECTOR_URL" -o lovely-injector.tar.gz

STEAM_COMMON="$HOME/Library/Application\ Support/Steam/steamapps/common/Balatro"
mkdir -p "$STEAM_COMMON"
tar -xzf lovely-injector.tar.gz -C "$STEAM_COMMON"

if [[ $SHELL == *"zsh"* ]]; then
  SHELL_PROFILE="$HOME/.zshrc"
else
  SHELL_PROFILE="$HOME/.bash_profile"
fi

echo "alias balatro-mod=\"$STEAM_COMMON/run_lovely.sh\"" >> "$SHELL_PROFILE"
source "$SHELL_PROFILE"

BALATRO_MODS="$HOME/Library/Application\ Support/Balatro/Mods"
mkdir -p "$BALATRO_MODS"

git clone https://github.com/Steamopollys/steamodded "$BALATRO_MODS/steamodded"

echo "Installation complete! You can run the mod using 'balatro-mod'."
echo "Your Mods folder is located at: $BALATRO_MODS"

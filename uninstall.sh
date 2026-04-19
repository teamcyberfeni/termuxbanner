#!/bin/bash
# ─────────────────────────────────────────
#  Termux Banner Tool - Uninstaller
# ─────────────────────────────────────────

RESET="\033[0m"
GREEN="\033[1;32m"
RED="\033[0;31m"

echo -e "${RED}Termux Banner Tool সরানো হচ্ছে...${RESET}"

# .bashrc / .zshrc থেকে সরান
for rcfile in "$HOME/.bashrc" "$HOME/.zshrc"; do
    if [ -f "$rcfile" ]; then
        sed -i '/termux_banner/d' "$rcfile"
        sed -i '/Termux Banner Tool/d' "$rcfile"
        echo -e "${GREEN}✔ $rcfile পরিষ্কার${RESET}"
    fi
done

# ফাইল সরান
rm -f "$HOME/.termux_banner.sh"
rm -f "$HOME/.termux_banner_config"

# MOTD পরিষ্কার
if [ -f "$PREFIX/etc/motd" ]; then
    > "$PREFIX/etc/motd"
    echo -e "${GREEN}✔ MOTD পরিষ্কার${RESET}"
fi

echo -e "${GREEN}✔ সম্পূর্ণ আনইনস্টল হয়েছে!${RESET}"

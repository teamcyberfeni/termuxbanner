#!/bin/bash
# ─────────────────────────────────────────
#  Termux Banner Tool - Installer
#  চালান: bash install.sh
# ─────────────────────────────────────────

RESET="\033[0m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
CYAN="\033[0;36m"

BANNER_SCRIPT="$HOME/.termux_banner.sh"
CONFIG_FILE="$HOME/.termux_banner_config"
BASHRC="$HOME/.bashrc"
ZSHRC="$HOME/.zshrc"

echo -e "${GREEN}"
echo "╔══════════════════════════════════════╗"
echo "║   Termux Banner Tool - Installer     ║"
echo "╚══════════════════════════════════════╝"
echo -e "${RESET}"

# ── Step 1: নাম ও টাইটেল নিন ──────────────
echo -e "${CYAN}[1/3]${RESET} আপনার ব্যানারের নাম দিন (যেমন: ALEX, HACKER, ROOT):"
read -r BANNER_NAME
BANNER_NAME="${BANNER_NAME:-HACKER}"

echo -e "${CYAN}[2/3]${RESET} ব্যানারের টাইটেল দিন (যেমন: Welcome to My Termux):"
read -r BANNER_TITLE
BANNER_TITLE="${BANNER_TITLE:-Welcome to the Matrix}"

echo -e "${CYAN}[3/3]${RESET} সাবটাইটেল দিন (ঐচ্ছিক, খালি রাখতে Enter চাপুন):"
read -r BANNER_SUBTITLE

# ── Step 2: Config সেভ করুন ───────────────
cat > "$CONFIG_FILE" <<EOF
BANNER_NAME="$BANNER_NAME"
BANNER_TITLE="$BANNER_TITLE"
BANNER_SUBTITLE="$BANNER_SUBTITLE"
EOF

echo -e "${GREEN}✔ Config সেভ হয়েছে${RESET}"

# ── Step 3: banner.sh কপি করুন ────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -f "$SCRIPT_DIR/scripts/banner.sh" ]; then
    cp "$SCRIPT_DIR/scripts/banner.sh" "$BANNER_SCRIPT"
    chmod +x "$BANNER_SCRIPT"
    echo -e "${GREEN}✔ Banner script ইনস্টল হয়েছে${RESET}"
else
    echo -e "${RED}✘ scripts/banner.sh পাওয়া যায়নি!${RESET}"
    exit 1
fi

# ── Step 4: .bashrc / .zshrc এ যোগ করুন ──
BANNER_LINE="bash $BANNER_SCRIPT"

add_to_rc() {
    local rcfile="$1"
    if [ -f "$rcfile" ]; then
        # আগের এন্ট্রি থাকলে সরান
        sed -i '/termux_banner/d' "$rcfile"
        echo "" >> "$rcfile"
        echo "# Termux Banner Tool" >> "$rcfile"
        echo "$BANNER_LINE" >> "$rcfile"
        echo -e "${GREEN}✔ $rcfile এ যোগ হয়েছে${RESET}"
    fi
}

add_to_rc "$BASHRC"
add_to_rc "$ZSHRC"

# ── Step 5: MOTD তেও সেট করুন ─────────────
MOTD_DIR="$PREFIX/etc/motd"
if [ -d "$(dirname "$MOTD_DIR")" ]; then
    echo "bash $BANNER_SCRIPT" > "$MOTD_DIR"
    echo -e "${GREEN}✔ MOTD সেট হয়েছে${RESET}"
fi

echo ""
echo -e "${GREEN}══════════════════════════════════════${RESET}"
echo -e "${GREEN}  ইনস্টলেশন সম্পন্ন! প্রিভিউ:${RESET}"
echo -e "${GREEN}══════════════════════════════════════${RESET}"
echo ""
bash "$BANNER_SCRIPT"

echo ""
echo -e "${YELLOW}💡 পরিবর্তন করতে: bash install.sh${RESET}"
echo -e "${YELLOW}💡 সরাতে: bash uninstall.sh${RESET}"

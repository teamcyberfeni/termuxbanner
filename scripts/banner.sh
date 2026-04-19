#!/bin/bash
# ─────────────────────────────────────────
#  Termux Banner Tool - Hacker Theme
#  GitHub: github.com/YOUR_USERNAME/termux-banner
# ─────────────────────────────────────────

CONFIG_FILE="$HOME/.termux_banner_config"

# ── Colors (Hacker Green) ──────────────────
RESET="\033[0m"
GREEN="\033[0;32m"
BRIGHT_GREEN="\033[1;32m"
DIM_GREEN="\033[2;32m"
DARK="\033[0;30m"
WHITE="\033[1;37m"
CYAN="\033[0;36m"

# ── Load Config ────────────────────────────
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    BANNER_NAME="HACKER"
    BANNER_TITLE="Welcome to the Matrix"
    BANNER_SUBTITLE=""
fi

# ── Draw Border ────────────────────────────
draw_banner() {
    local name="${BANNER_NAME:-HACKER}"
    local title="${BANNER_TITLE:-Welcome}"
    local subtitle="${BANNER_SUBTITLE:-}"
    local width=50

    # Top border
    echo -e "${BRIGHT_GREEN}╔══════════════════════════════════════════════════╗${RESET}"

    # ASCII Art Name (figlet style using echo)
    echo -e "${BRIGHT_GREEN}║${RESET}${GREEN}$(printf '%*s' $(( (width + ${#name}) / 2 )) "$name")$(printf '%*s' $(( (width - ${#name}) / 2 )) '')${RESET}${BRIGHT_GREEN}║${RESET}"

    # Divider
    echo -e "${BRIGHT_GREEN}║${DIM_GREEN}──────────────────────────────────────────────────${RESET}${BRIGHT_GREEN}║${RESET}"

    # Title
    local pad_title=$(( (width - ${#title}) / 2 ))
    echo -e "${BRIGHT_GREEN}║${RESET}${WHITE}$(printf '%*s' $(( pad_title + ${#title} )) "$title")$(printf '%*s' $(( width - pad_title - ${#title} )) '')${RESET}${BRIGHT_GREEN}║${RESET}"

    # Subtitle (optional)
    if [ -n "$subtitle" ]; then
        local pad_sub=$(( (width - ${#subtitle}) / 2 ))
        echo -e "${BRIGHT_GREEN}║${RESET}${CYAN}$(printf '%*s' $(( pad_sub + ${#subtitle} )) "$subtitle")$(printf '%*s' $(( width - pad_sub - ${#subtitle} )) '')${RESET}${BRIGHT_GREEN}║${RESET}"
    fi

    # Bottom border
    echo -e "${BRIGHT_GREEN}╚══════════════════════════════════════════════════╝${RESET}"
}

draw_banner

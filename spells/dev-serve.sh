#!/usr/bin/env bash
# =============================================================================
# RaBbLE-Chrysalis — dev-serve.sh
# Launch local server for Chrysalis-Web.
#
# Usage:
#   bash spells/dev-serve.sh
#
# Access: http://localhost:8081
#
# cast ~ dev >> chrysalis-web running local, cdn mocked // %CHRYSALIS_CAST%
# =============================================================================

set -euo pipefail

SPELLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHRYSALIS_ROOT="$(dirname "$SPELLS_DIR")"
DEV_SERVER="$SPELLS_DIR/dev-server.js"

MAGENTA='\033[38;2;255;45;120m'
CYAN='\033[38;2;0;245;255m'
GREEN='\033[38;2;80;250;123m'
RESET='\033[0m'

pulse()   { echo -e "${MAGENTA}${1}${RESET}"; }
info()    { echo -e "${CYAN}  ${1}${RESET}"; }
success() { echo -e "${GREEN}  ✓ ${1}${RESET}"; }

# Preflight checks
echo ""
pulse "dev-serve ~ local chrysalis server"
pulse "════════════════════════════════════════"
echo ""

# Verify node available
if ! command -v node &> /dev/null; then
  echo -e "\033[38;2;224;92;111m  ✗ Node.js not found. Please install Node.js.\033[0m"
  exit 1
fi

info "Starting Chrysalis-Web server on port 8081..."

# Try to open browser after server starts (non-blocking)
(sleep 0.5 && (command -v xdg-open &>/dev/null && xdg-open "http://localhost:8081/chrystalis/" || (command -v open &>/dev/null && open "http://localhost:8081/chrystalis/"))) &

# Keep running node server in foreground
node "$DEV_SERVER"

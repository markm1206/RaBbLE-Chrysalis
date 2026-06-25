#!/usr/bin/env bash
# =============================================================================
# RaBbLE-Chrysalis — status.sh
# Display status and map of the Chrysalis genesis reliquary.
#
# Usage:
#   bash spells/status.sh
#
# harmonize ~ status >> chrysalis map query // %CHRYSALIS_STATUS%
# =============================================================================

set -euo pipefail

SPELLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHRYSALIS_ROOT="$(dirname "$SPELLS_DIR")"

MAGENTA='\033[38;2;255;45;120m'
CYAN='\033[38;2;0;245;255m'
GREEN='\033[38;2;80;250;123m'
YELLOW='\033[38;2;241;250;140m'
RESET='\033[0m'

pulse()   { echo -e "${MAGENTA}${1}${RESET}"; }
info()    { echo -e "${CYAN}  ${1}${RESET}"; }
success() { echo -e "${GREEN}  ✓ ${1}${RESET}"; }
warn()    { echo -e "${YELLOW}  ⚠ ${1}${RESET}"; }

echo ""
pulse "Chrysalis Reliquary Map"
pulse "════════════════════════════════════════"
echo ""

# 1. Show Genesis Projects
info ":: Genesis Projects (Chrysalis-Web/)"
if [[ -d "$CHRYSALIS_ROOT/Chrysalis-Web" ]]; then
  success "Chrysalis-Web dashboard present"
  echo "    ├─ chrysalis (Old World Site)"
  echo "    ├─ JS-Xperiments/NeBuLA-JS"
  echo "    └─ JS-Xperiments/WebOS"
else
  warn "Chrysalis-Web directory not found"
fi

if [[ -d "$CHRYSALIS_ROOT/Python-Xperiments" ]]; then
  echo "    ├─ Python-Xperiments/RaBbLE.py"
  echo "    └─ Python-Xperiments/RaBbLE-Server"
fi
echo ""

# 2. Show Reliquary Branches
info ":: Sealed Reliquary Branches"
git -C "$CHRYSALIS_ROOT" branch -a | grep "reliquary/" | sed 's/^[ *]*//' | while read -r branch; do
  echo "    ├─ $branch"
done || true
git -C "$CHRYSALIS_ROOT" branch -a | grep "archive/" | sed 's/^[ *]*//' | while read -r branch; do
  echo "    ├─ $branch"
done || true
echo "    └─ main (Genesis snapshots)"
echo ""

# 3. Check Symlink Integrities in RaBbLE-World
info ":: Symlink Integrities (RaBbLE-World)"
WORLD_PATH="$CHRYSALIS_ROOT/../RaBbLE-World"
if [[ -d "$WORLD_PATH" ]]; then
  for link in chrysalis chrystalis; do
    if [[ -L "$WORLD_PATH/$link" ]]; then
      if [[ -e "$WORLD_PATH/$link" ]]; then
        success "RaBbLE-World/$link -> resolves OK"
      else
        echo -e "\033[38;2;224;92;111m  ✗ RaBbLE-World/$link -> BROKEN link\033[0m"
      fi
    else
      warn "RaBbLE-World/$link is not set up"
    fi
  done
else
  warn "RaBbLE-World sibling folder not found to verify symlinks"
fi
echo ""

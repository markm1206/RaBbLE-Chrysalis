#!/usr/bin/env bash
# =============================================================================
# RaBbLE-Chrysalis — seal-branch.sh
# Automate importing and sealing a reliquary branch from a member repository.
#
# Usage:
#   bash spells/seal-branch.sh <source-repo-path> <branch-name> [target-branch-name]
#
# Examples:
#   bash spells/seal-branch.sh ../RaBbLE-OS feat/old-shell reliquary/os/old-shell
#
# seal ~ ceremony >> branch imported and sealed in amber // %RELIQUARY_SEALED%
# =============================================================================

set -euo pipefail

SPELLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHRYSALIS_ROOT="$(dirname "$SPELLS_DIR")"

MAGENTA='\033[38;2;255;45;120m'
CYAN='\033[38;2;0;245;255m'
GREEN='\033[38;2;80;250;123m'
YELLOW='\033[38;2;241;250;140m'
RED='\033[38;2;224;92;111m'
RESET='\033[0m'

pulse()   { echo -e "${MAGENTA}${1}${RESET}"; }
info()    { echo -e "${CYAN}  ${1}${RESET}"; }
success() { echo -e "${GREEN}  ✓ ${1}${RESET}"; }
warn()    { echo -e "${YELLOW}  ⚠ ${1}${RESET}"; }
err()     { echo -e "${RED}  ✗ ${1}${RESET}"; }

if [[ $# -lt 2 ]]; then
  err "Usage: bash spells/seal-branch.sh <source-repo-path> <branch-name> [target-branch-name]"
  exit 1
fi

SOURCE_PATH="$1"
BRANCH_NAME="$2"
TARGET_BRANCH="${3:-}"

# Resolve source path to absolute path
ABS_SOURCE_PATH="$(cd "$SOURCE_PATH" && pwd)"

# Verify source path exists and is a git repo
if [[ ! -d "$ABS_SOURCE_PATH/.git" ]]; then
  err "Source path is not a valid Git repository: $SOURCE_PATH"
  exit 1
fi

# Detect repository slug/name
REPO_SLUG="$(basename "$ABS_SOURCE_PATH")"

# Set default target branch if not specified
if [[ -z "$TARGET_BRANCH" ]]; then
  if [[ "$REPO_SLUG" == "RaBbLE-OS" ]]; then
    TARGET_BRANCH="reliquary/os/$BRANCH_NAME"
  else
    # Strip "RaBbLE-" prefix to keep target branch names clean (e.g. reliquary/world/old-chat)
    CLEAN_SLUG="${REPO_SLUG#RaBbLE-}"
    CLEAN_SLUG="$(echo "$CLEAN_SLUG" | tr '[:upper:]' '[:lower:]')"
    TARGET_BRANCH="reliquary/$CLEAN_SLUG/$BRANCH_NAME"
  fi
fi

echo ""
pulse "seal ~ reliquary branch ceremony"
pulse "════════════════════════════════════════"
info "Source repo:   $REPO_SLUG ($ABS_SOURCE_PATH)"
info "Source branch: $BRANCH_NAME"
info "Target branch: $TARGET_BRANCH"
echo ""

# Ensure we are in Chrysalis root
cd "$CHRYSALIS_ROOT"

# Check if branch already exists in Chrysalis
if git show-ref --quiet "refs/heads/$TARGET_BRANCH"; then
  err "Branch '$TARGET_BRANCH' already exists in Chrysalis. Aborting."
  exit 1
fi

# Add temp git remote
info "Fetching source branch..."
git remote add temp_seal "$ABS_SOURCE_PATH"
trap 'git remote remove temp_seal 2>/dev/null || true' EXIT

git fetch temp_seal "$BRANCH_NAME" --quiet

# Checkout branch under target name
info "Importing branch into Chrysalis..."
git checkout -b "$TARGET_BRANCH" FETCH_HEAD --quiet

# Apply final seal commit
info "Applying sealing commit..."
git commit --allow-empty -q -m "archive ~ reliquary >> $BRANCH_NAME sealed — reference only // %RELIQUARY_SEALED%"

# Return to main branch
git checkout main --quiet

success "Branch '$TARGET_BRANCH' successfully sealed in amber."
warn "Remember to delete the branch from $REPO_SLUG when you are ready."
echo ""

#!/usr/bin/env bash
# Build ergoalex firmware locally, the same way ZMK's user-config CI workflow does.
# Usage: .claude/skills/build-firmware/build.sh [shield ...]   (default: ergoalex_right)
# Needs the west workspace and Zephyr SDK in $ZMK_WS (see SKILL.md).
# UF2s land in $OUT (default ~/Desktop).
set -euo pipefail

REPO="$(cd "$(dirname "$0")/../../.." && pwd)"
ZMK_WS="${ZMK_WS:-$HOME/zmk-ws}"
OUT="${OUT:-$HOME/Desktop}"
export ZEPHYR_SDK_INSTALL_DIR="${ZEPHYR_SDK_INSTALL_DIR:-$ZMK_WS/zephyr-sdk-0.16.3}"
export PATH="$ZMK_WS/.venv/bin:$PATH"

if [ $# -eq 0 ]; then set -- ergoalex_right; fi

cd "$ZMK_WS"

# Keep the workspace on the ZMK revision pinned in config/west.yml
if ! cmp -s "$REPO/config/west.yml" config/west.yml; then
  cp "$REPO/config/west.yml" config/west.yml
  west update --fetch-opt=--filter=tree:0
fi

mkdir -p "$OUT"
for shield in "$@"; do
  west build -s zmk/app -d "build/$shield" -b nice_nano_v2 -- \
    -DSHIELD="$shield" -DZMK_CONFIG="$REPO/config" -DZMK_EXTRA_MODULES="$REPO"
  cp "build/$shield/zephyr/zmk.uf2" "$OUT/$shield.uf2"
  echo "==> $OUT/$shield.uf2"
done

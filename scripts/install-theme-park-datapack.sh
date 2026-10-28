#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORLD_DIR="$ROOT_DIR/server/world"
PACK_DIR="$WORLD_DIR/datapacks/themepark"

mkdir -p "$PACK_DIR/data/minecraft/tags/functions" "$PACK_DIR/data/themepark/functions"

cat > "$PACK_DIR/pack.mcmeta" <<'EOF'
{
  "pack": {
    "pack_format": 48,
    "description": "Theme park spawn bootstrap"
  }
}
EOF

cat > "$PACK_DIR/data/minecraft/tags/functions/load.json" <<'EOF'
{
  "values": [
    "themepark:init"
  ]
}
EOF

cat > "$PACK_DIR/data/themepark/functions/init.mcfunction" <<'EOF'
scoreboard objectives add themepark_init dummy
execute if score #themepark themepark_init matches 1 run return 0
setworldspawn 0 64 0
fill -35 0 -35 35 0 35 stone
fill -35 1 -35 35 1 35 stone
fill -34 1 -34 34 1 34 dirt replace stone
fill -35 1 -35 35 1 -35 barrier replace air
fill -35 1 35 35 1 35 barrier replace air
fill -35 1 -35 -35 1 35 barrier replace air
fill 35 1 -35 35 1 35 barrier replace air
fill -35 1 -35 35 1 -17 water replace air
fill -35 1 17 35 1 35 water replace air
fill -35 1 -17 -17 1 35 water replace air
fill 17 1 -17 35 1 35 water replace air
fill -28 1 -24 -18 1 -24 stone
fill -28 2 -24 -18 2 -24 stone
fill -28 3 -24 -18 3 -24 stone
fill -28 4 -24 -18 4 -24 stone
fill -28 5 -24 -18 5 -24 stone
fill -28 6 -24 -18 6 -24 stone
fill -28 7 -24 -18 7 -24 stone
fill -28 8 -24 -18 8 -24 stone
fill -28 9 -24 -18 9 -24 stone
fill -28 10 -24 -18 10 -24 stone
fill -28 11 -24 -18 11 -24 stone
fill -28 12 -24 -18 12 -24 stone
fill -27 12 -23 -19 12 -23 powered_rail replace air
fill -27 12 -22 -19 12 -22 rail replace air
fill -27 12 -21 -19 12 -21 rail replace air
fill -27 12 -20 -19 12 -20 rail replace air
fill -27 12 -19 -19 12 -19 rail replace air
fill -27 12 -18 -19 12 -18 rail replace air
fill -30 1 -30 -30 15 -30 stone
fill 30 1 -30 30 15 -30 stone
fill -30 1 30 -30 15 30 stone
fill 30 1 30 30 15 30 stone
scoreboard players set #themepark themepark_init 1
EOF

echo "Installed theme park datapack in $PACK_DIR"

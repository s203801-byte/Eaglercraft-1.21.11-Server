# Theme park bootstrap

This repository now defaults the world to a flat spawn layout so the park can be generated cleanly at world creation. The server config is intentionally set to a flat world with structures disabled and spawn protection disabled, which makes it easier to build a custom park centered on spawn.

## Files changed

- `server/server.properties` – flat-world generation, structure off, spawn protection off.
- `scripts/init-theme-park.sh` – writes a ready-to-paste command list for the server console.

## How to use it

1. Start a fresh world or delete the current `world` folder to regenerate it.
2. Start the server.
3. Become an operator.
4. Run the generated bootstrap file in the console:

```bash
bash scripts/init-theme-park.sh
```

5. Copy the commands from `server/theme-park-bootstrap.txt` and paste them into the server console or a command block chain.

## Included features

- 70 x 70 stone spawn pad centered on 0, 0
- Dirt path layout across the park
- Lazy river ring along the outer edge of the park
- Roller coaster staircase and support pillars
- Four minecarts granted at spawn for testing
- Barrier-edge protection along the exterior of the lazy river

## Important note

This is a 1.12-style world-init build setup expressed as a command bootstrap. For a production-grade map, you would normally run it through WorldEdit or a custom world-generation plugin to keep the park fully reproducible and protected after chunk generation.

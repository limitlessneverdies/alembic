# Alembic — Systems: Machines & Energy

Companion to `SIM-PIPELINE.md`. Covers machine/device/energy-conversion systems (13 of 62).

| # | System | @VA | Calls | Role (INFERRED from name + helpers) |
|---|--------|-----|-------|-------------------------------------|
| 08 | tree_support_check | 0x1401022D6 | 13 | structural support check for trees |
| 28 | refining | 0x14010F76B | 49 | ore refining / smelting |
| 48 | spawners | 0x1401294BF | 15 | spawner tick |
| 49 | conveyors | 0x14012A409 | 33 | conveyor belts |
| 50 | pipes | 0x14012BDD4 | 18 | pipe flow |
| 51 | transmutations | 0x14012C4EC | 18 | transmutation devices |
| 52 | radiate_plates | 0x14012C8B3 | 22 | radiating plates |
| 53 | sensors | 0x14012D1C0 | 24 | sensor update |
| 54 | fans | 0x14012F974 | 10 | fan airflow |
| 55 | filters | 0x1401303BF | 5 | filter tick |
| 56 | generators | 0x140130618 | 10 | generator output |
| 57 | pressure_sources | 0x140131128 | 11 | pressure source injection |
| 58 | pressure | 0x140131400 | 9 | pressure field solve |

Shared helpers: `FUN_1401A63E0/480`, `FUN_140206870`, `FUN_1402CBA90`, `FUN_1402CC340`, `FUN_1402D4831`, `FUN_1402D2C00`, `FUN_140007ED0`/`FUN_1400549E0`/`FUN_140054A10` (thunks).

Extracted bodies present in `../src/systems/`: `FUN_1400c3710`, `FUN_1400c57c0`, `FUN_1400c59e0`, `FUN_1400c88f0`, `FUN_1400cf490`, `FUN_1400cf5d0`, `FUN_1400d1590`, `FUN_1400d24e0`, `FUN_1400d7510`, `FUN_1400dc950`, `FUN_1400dcdf0`, `FUN_1400df650`, `FUN_1400e07b0`, `FUN_1400e7d00`, `FUN_1400e90c0`, `FUN_1400e9be0`, `FUN_1400e9d10`, `FUN_1400f46b0`, `FUN_1400f6360`, `FUN_1400f6960`, `FUN_1400f83d0`, `FUN_1400f8cb0`, `FUN_1401a63e0`, `FUN_1401a6480`, `FUN_1401c07c0`, `FUN_1401c6800`, `FUN_1401c6d90`, `FUN_1401c8830`, `FUN_1401c9f80`, `FUN_1401cb0d0`, `FUN_1401d6870`, `FUN_1401eb540`, `FUN_1401eb930`, `FUN_1401ebb30`, `FUN_1401ebc90`, `FUN_1401f0ec0`, `FUN_1401f0f90`, `FUN_140206870`, `FUN_1402068b0`, `FUN_1402b7d70`, `FUN_1402bab40`, `FUN_1402bc050`, `FUN_1402cb3f0`, `FUN_1402cba90`, `FUN_1402cc340`, `FUN_1402cc420`, `FUN_1402cc490`, `FUN_1402cc570`, `FUN_1402cc8f0`, `FUN_1402cc960`, `FUN_1402cca40`, `FUN_1402cdbf0`, `FUN_1402d1400`, `FUN_1402d1c80`, `FUN_1402d2c00`, `FUN_1402d4831`.

Open: per-machine state struct layouts (conveyor item slots, pipe endpoints, sensor thresholds) — **UNKNOWN**; extracted helper bodies are the source of truth.

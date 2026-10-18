# Alembic — Reverse Engineering & Modding

> Full reverse-engineering of *Alembic* (Steam appid 4933990), a falling-sand periodic-table sandbox by dev `equious`.
> Goal: understand the complete game engine, then build a modded version that can accept new content.

## Phase status
- **Phase 1 (extraction):** complete — decompiled C (15.5 MB), 119,871 strings, element table, 10 shaders, assets.
- **Phase 2 (analysis docs):** complete — see `PHASE2-HANDOFF.md`.
- **Phase 3 (Rust reimplementation):** not started — hand the repo to the implementing model.

Start here: [`PHASE2-HANDOFF.md`](PHASE2-HANDOFF.md) → [`docs/SIM-PIPELINE.md`](docs/SIM-PIPELINE.md).

## Target Binary

| Property | Value |
|----------|-------|
| File | `alembic.exe` |
| Format | PE32+ x86_64 |
| Size | 6,756,864 bytes |
| SHA256 | `31b67190d09f9e8891a4c8129258604a85aa354dae521295a2a052d2a10d3e99` |
| Compiler | rustc `254b59607d4417e9dffbc307138ae5c86280fe4c` (Linux build by `equious`) |
| Engine | macroquad 0.4.14 / miniquad 0.4.8 (OpenGL ES 2.0) |
| Deps | steamworks 0.13.1, rodio 0.17.3, cpal 0.15.3, image 0.24.9, rayon |
| Version | Full (92 elements H..U) |

## Repository Structure

```
alembic-re/
├── README.md
├── SPEC.md                    # Modding spec (corrected to 62 systems)
├── PHASE2-HANDOFF.md          # Master handoff for Phase 3
├── docs/                      # 15 analysis documents
│   ├── SIM-PIPELINE.md        # 62-system sim pipeline + frame entry
│   ├── ELEMENTS-INTERNALS.md  # 92-element table fully decoded
│   ├── SAVE-FORMAT.md         # v6 save loader byte map
│   ├── TOOLS-IMPL.md
│   ├── REACTIONS-COMPOUNDS.md
│   ├── SYSTEMS-*.md           # 4 subsystem docs
│   └── ...
├── data/                      # Decoded tables & maps
│   ├── elements92.json / .txt
│   ├── kind-table.bin / .txt
│   ├── sim-sections.txt / sim-timeline.txt / sim-name-pool.*
│   ├── frame-entry-context.txt
│   ├── dump-gaps.txt
│   └── ...
├── src/
│   ├── systems/               # 130 decompiled helper bodies
│   └── extracted/             # 18 larger decompiled bodies
├── tools/                     # 83 Python analysis scripts
├── evidence/                  # REA evidence bundles & snapshot
├── assets/                    # Shaders, audio, fonts, images
└── .gitignore
```

Big artifacts (decompiled C 15.5 MB, strings map 3.76 MB, etc.) are on the
[phase2 release](https://github.com/limitlessneverdies/alembic-re/releases/tag/phase2), not committed.

## Analysis Method
- **REA** (Reverse Engineering Anything) MCP server + CLI
- **Ghidra 12.1.4** (headless) for decompilation and xrefs
- Mass decompilation: 8,269 functions, 15.5 MB pseudocode
- String address mapping: 119,871 printable runs
- Function index: 8,056 functions with line numbers

## Key Findings

### Element System
- 92 elements (H..U), u8 ID space (0-255), ~163 free slots
- 80-byte element struct in `.rdata` @ `0x14034F350`: symbol/name/desc slices, mass, density, electronegativity, melt/boil, radioactivity, Z, period, group, valence, category, STP phase, validity
- Consumer `FUN_140094590` → `KIND_TABLE[Z-1]` (VA `0x14035D008`, 92 bytes) or `0x8D`
- Registry cap: 256 live species (`FUN_1400bbf70`)

### Physics Simulation
- CPU-side Rust sim (not GPU)
- Single mega-function `FUN_1400FDF00` (`0x1400FDF00`–`0x140137C10`, 236,816 B) running **62 named systems in fixed order** (see `docs/SIM-PIPELINE.md`)
- Each section wrapped in QPC timing + 24-byte profile-record Vec push
- Name pool: 886-byte bare concatenation at VA `0x140356D20`
- RNG: `FUN_140206870` (PCG, multiplier `0x5851f42d4c957f2d`)
- Frame entry: two E8 call sites at `0x140017E88` (per-frame) and `0x14001DADC` (stepping mode)
- Physics kinds: solid(1), gravel(2), powder(3), liquid(4), gas(5)

### GPU Rendering
- kind_tex: R=element id (u8), G=physics kind (u8)
- Special IDs: K_BATTPOS=46, K_BATTNEG=47, K_HG (mercury), K_LAVA
- Shading: edge depth, directional AO, glass/ice transparency, mercury shimmer, lava pulse, ONI-style liquid field, battery caps, specular, bloom
- Shader runtime-templated (`GRID_W`/`GRID_H`)
- 10 GLSL shader blocks extracted

### Save System (v6)
- Magic "ALIN" (u32 LE), version byte (8-255 accepted; 8-22 known)
- Environment values (2 f32), thumbnail (W×H×3 RGB, validated), cell count check
- Compound manifest required for v6; legacy saves remap compounds
- Save dir: `alembic_saves/` or `{base}/saves/`

### Steam
- steam_api64.dll hard import (game won't start without it)
- 16+ achievement IDs, SetAchievement/StoreStats/InitFlat
- AppID: 4933990

### I18N
- 8 languages: EN, DE, FR, PL, PT-BR, ES, IT, TR
- NotoSansSC.ttf for CJK, ProggyClean embedded

### Tools (16)
- Place, Heat, Pressure, Pipet, Prefab, Mortar & Pestle, Selection, Push/Pull, Precision delivery, …
- Unlock rules: "Have 5+ gases", "Dissolve solute into water", "Shake window (Shift+drag)"

### Contracts (16)
- Evaporate the Sea, Alloy Foundry, Fireworks, Reclaim the Metal, Neutralize the Spill, Halogen Displacement, Reforestation, Scorched Earth, Remote Ignition, Hydrogen Storage, Going Critical, The Crucible, Jacob's Ladder, Powerhouse, First Light, The Alembic

### Phenomena
- Electrolysis, discharge, oxidation (3 ways), ignition metals, detonation, nuclear chain reaction, noble gas idling

### Audio
- rodio 0.17.3 + cpal 0.15.3 (WASAPI)
- Assets: 16 ogg + music

## Open Items (Phase 3 inputs)
- Reaction table format; compound struct layout; per-cell save stride; tool handler mapping
- Element `+0x3C`/`+0x44`/`+0x4A` semantics; 24-byte profile record layout
- 15 decompile-dump holes (~607 KiB) including frame-driver region
- Sim mega-function pseudo-code (decompile timeout); section map is the substitute

## Modding Route
**Flavor 3 — Hook/Loader mod:** original exe untouched. Loader DLL injects new logic at runtime. Element/compound tables extended by hooking population function. New shaders loaded from disk.

## License
This repository contains reverse-engineering documentation and tools. The original game binary is not included. The user owns a licensed copy of Alembic.

---

*Generated from extensive reverse-engineering sessions using REA, Ghidra 12.1.4, and custom analysis scripts.*
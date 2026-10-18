# Architecture

## Overview

Alembic is a falling-sand periodic-table sandbox built in Rust using macroquad 0.4.14 (OpenGL ES 2.0). The game simulates a 2D grid of cells, each containing an element (u8 ID), physics kind (solid/gravel/powder/liquid/gas), temperature, pressure, and other properties. The simulation runs on the CPU; the GPU handles rendering only.

## PE Structure

| Section | VA Range | Size | Purpose |
|---------|----------|------|---------|
| .text | 0x140001000-0x1402DEA00 | ~2.9 MB | Code (8,269 functions) |
| .rdata | 0x1402DF000-0x140641800 | ~3.4 MB | Read-only data (strings, shaders, element table, assets paths) |
| .data | 0x140642000-0x1406471EC | ~21 KB | Mutable data (hash map base, counts, config) |
| .pdata | 0x140648000-0x14065F200 | ~93 KB | Exception unwind info |
| .gfids | 0x140660000-0x140660200 | 512 B | Guard function ID table |
| .tls | 0x140661000-0x140665200 | ~17 KB | Thread-local storage |
| _RDATA | 0x140666000-0x140666200 | 512 B | (miniquad) |
| .reloc | 0x140667000-0x14067A200 | ~78 KB | Base relocations |

Entry point RVA: 0x2C8D08 → VA 0x1402C8D08 (CRT bootstrap → Rust main)

## Simulation Pipeline

The sim runs as a sequence of passes over the grid (CPU-side Rust):

1. `update` — main orchestrator
2. `compute_atmo_open` — atmospheric computation (open air)
3. `flow_water_systems` — water system flow
4. `flow_water_pressure` — water pressure flow
5. `tick_airborne` — airborne particle tick (gas movement)
6. `particle_movement` — particle movement (falling sand physics)
7. `roof_mask` — roof masking (prevents cells falling through)
8. `reactions` — general reactions
9. `carbonic_degassing` — CO₂ degassing
10. `diffuse_solvent` — solvent diffusion
11. `dissolve` — dissolution
12. `alloy_formation` — alloy formation
13. `alloy_acid_leach` — alloy acid leaching
14. `oxidising_attack` — oxidation
15. `acid_displacement` — acid displacement
16. `base_neutralization` — acid-base neutralization
17. `flush_chem_blast` — chemical blast flushing

## Rendering Pipeline

GPU handles rendering only (OpenGL ES 2.0 via miniquad):
- Grid rendered as texture quads
- Element ID (u8) stored in red channel of kind_tex
- Physics kind (u8) stored in green channel
- Shader is runtime-templated (GRID_W, GRID_H placeholders)
- Special rendering: edge depth, directional AO, glass/ice transparency, mercury shimmer, lava pulse, ONI-style liquid field, battery caps, specular, bloom

## Audio
- rodio 0.17.3 + cpal 0.15.3 (WASAPI on Windows)
- Assets: OGG/WAV files in assets/audio/music/
- src/audio.rs (Rust module)

## Save System
- Custom binary format (v6), magic "ALIN"
- Compound manifest required, cell count validation
- Migration from legacy saves
- Save dir: "alembic_saves" (relative) or "{}/saves"

## Steam Integration
- steam_api64.dll hard import (game won't start without it)
- 16+ achievement IDs
- SetAchievement, StoreStats, InitFlat
- AppID: 4933990

## I18N
- 8 languages: EN, DE, FR, PL, PT-BR, ES, IT, TR
- NotoSansSC.ttf for CJK, ProggyClean embedded (macroquad default)
- Full translations in .rdata (0x140469BB0)

## Assets (loaded from disk)
- assets/logo_sign_clean/sign_atlas.png
- assets/fonts/ (NotoSansSC.ttf)
- assets/audio/music/ (ogg/wav)
- screenshots written as screenshot_{}.png
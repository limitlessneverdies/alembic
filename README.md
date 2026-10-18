# Alembic — Reverse Engineering & Modding

> Full reverse-engineering of *Alembic* (Steam appid 4933990), a falling-sand periodic-table sandbox by dev `equious`.  
> Goal: understand the complete game engine, then build a modded version that can accept new content.

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
| Version | Full (92/118 element names present) |

## Repository Structure

```
alembic-re/
├── README.md              # This file
├── SPEC.md                # Modding specification (planned)
├── docs/
│   ├── architecture.md    # Engine architecture overview
│   ├── elements.md        # Element system schema
│   ├── save-format.md     # Save v6 format
│   ├── gpu-layout.md      # GPU rendering layout
│   ├── i18n.md            # Internationalization
│   ├── steam.md           # Steam integration
│   ├── audio.md           # Audio system
│   ├── tools.md           # Tools & contracts
│   └── modding.md         # Modding guide & hooks
├── src/
│   ├── ghidra-scripts/    # Ghidra Java scripts used
│   └── extracted/         # Key extracted function bodies
├── data/
│   ├── func-index.txt     # 8,056 function headers (name, addr, line)
│   └── strings-map.txt    # String address map (sample)
├── evidence/              # REA evidence bundles
└── .gitignore
```

## Analysis Method

- **REA** (Reverse Engineering Anything) MCP server + CLI for native binary analysis
- **Ghidra 12.1.4** (headless) for decompilation and cross-reference analysis
- **Temurin JDK 25** for Ghidra
- Mass decompilation: 8,269 functions, 15.5 MB pseudocode
- String address mapping: 119,871 printable runs in .rdata/.data with VAs
- Function index: 8,056 functions with line numbers

## Key Findings

### Element System
- 92 elements (only Oganesson missing), u8 ID space (0-255), ~163 free slots
- 80-byte element struct: symbol (ptr,len), name (ptr,len), desc (ptr,len), atomic_mass (f32), density (f32), +2 unknown floats, 16 bytes flags
- Registry cap: 256 live species
- Categories: Hydrogen (unique), Alkali, Alkaline-Earth, Transition, Post-Transition, Metalloid, Nonmetal, Halogen, Noble Gas, Lanthanide, Actinide

### Physics Simulation
- CPU-side Rust sim (not GPU)
- 17-function pipeline: update → compute_atmo_open → flow_water_systems → flow_water_pressure → tick_airborne → particle_movement → roof_mask → reactions → carbonic_degassing → diffuse_solvent → dissolve → alloy_formation → alloy_acid_leach → oxidising_attack → acid_displacement → base_neutralization → flush_chem_blast
- Physics kinds: solid(1), gravel(2), powder(3), liquid(4), gas(5)

### GPU Rendering
- kind_tex: R=element id (u8), G=physics kind (u8)
- Special IDs: K_BATTPOS=46, K_BATTNEG=47, K_HG (mercury), K_LAVA
- Shading: edge depth, directional AO, glass/ice transparency, mercury shimmer, lava pulse, ONI-style liquid field, battery caps, specular, bloom
- Shader runtime-templated (GRID_W=__GRID_W__, GRID_H=__GRID_H__)
- 83 shader text blocks in .rdata

### Save System
- v6 format with compound manifest + discoveries
- Magic: "ALIN", version byte (8-22 valid)
- Environment values (2 floats), thumbnail (W×H×3 RGB), cell count validation
- Migration from legacy saves
- Save dir: "alembic_saves" or "{}/saves"

### Steam
- steam_api64.dll hard import (game won't start without it)
- 16+ achievement IDs, SetAchievement/StoreStats/InitFlat
- AppID: 4933990

### I18N
- 8 languages: EN, DE, FR, PL, PT-BR, ES, IT, TR
- NotoSansSC.ttf for CJK, ProggyClean embedded (macroquad default)
- Full translations in .rdata

### Tools (16)
- Place, Heat, Pressure, Pipet, Prefab, Mortar & Pestle, Selection, Copy/Paste, Mill, Push/Pull, Precision delivery
- Unlock rules: "Have 5+ gases", "Dissolve solute into water", "Shake window (Shift+drag)"

### Contracts (16)
- Evaporate the Sea, Alloy Foundry, Fireworks, Reclaim the Metal, Neutralize the Spill, Halogen Displacement, Reforestation, Scorched Earth, Remote Ignition, Hydrogen Storage, Going Critical, The Crucible, Jacob's Ladder, Powerhouse, First Light, The Alembic

### Phenomena
- Electrolysis, discharge, oxidation (3 ways), ignition metals, detonation, nuclear chain reaction, noble gas idling

### UI/Controls
- Keybindings: stamp, R-click erase, Shift+R, rotate 90 CW/CCW, flip, delete, brush size, zoom (Ctrl+Scroll), pan (middle-drag), backspace, Space (pause), F2 (screenshot), F (favorites), Tab/J (codex)
- Tabs: Elements, Reactions, Phenomena, Tools, Challenges, Favorites, Log

### Audio
- rodio 0.17.3 + cpal 0.15.3 (WASAPI)
- Assets: assets/audio/music/ (ogg/wav)

### Modding Implications
- Element IDs: u8 (0-255), 92 used, ~163 free
- Compound registry: 256 cap
- Element table in .rdata (read-only) — modding requires byte-patching or hooking
- Save format: custom binary (v6) with compound manifest
- Steam achievements: hardcoded strings — new content can add
- Shader: runtime-templated — grid size changeable
- Assets: loaded from disk — new files can be added
- Both demo and full content compiled in — runtime flag gates

## Modding Route

**Flavor 3 — Hook/Loader mod:** Original exe untouched. Loader DLL injects new logic at runtime. Element/compound tables extended by hooking population function. New shaders loaded from disk. New achievements via Steam API.

## Tools Used

- **REA** (Reverse Engineering Anything) — MCP server + CLI for native binary analysis
- **Ghidra 12.1.4** (headless) — decompilation, cross-references
- **Temurin JDK 25** — for Ghidra
- Custom Ghidra Java scripts for batch extraction and xref analysis

## License

This repository contains reverse-engineering documentation and tools for educational/modding purposes. The original game binary is not included. The user owns a licensed copy of Alembic.

---

*Generated from extensive reverse-engineering sessions using REA, Ghidra 12.1.4, and custom analysis scripts.*
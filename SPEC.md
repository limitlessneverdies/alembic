# Alembic Modding Specification (SPEC.md)

## 1. Overview

This specification defines the data structures, hook points, and modding interfaces for *Alembic* (Steam appid 4933990). The goal is to enable community-created content (new elements, compounds, reactions, tools, challenges) without modifying the original executable.

## 2. Modding Route

**Flavor 3 — Hook/Loader Mod:** Original exe untouched. A loader DLL (`alembic_mod.dll`) is injected into the game process at startup. The loader hooks the game's population functions and injects new content entries at runtime.

## 3. Element System

### 3.1 Element Struct (80 bytes / 0x50)

```rust
#[repr(C)]
pub struct Element {
    // +0x00..+0x0F: 16 bytes flags (category, period, group, phase, etc.)
    flags: [u8; 16],
    // +0x10/+0x18: symbol (ptr, len) → packed symbol blob
    symbol_ptr: *const u8,
    symbol_len: usize,
    // +0x20/+0x28: name (ptr, len) → handbook blob
    name_ptr: *const u8,
    name_len: usize,
    // +0x30/+0x38: desc (ptr, len) → handbook blob
    desc_ptr: *const u8,
    desc_len: usize,
    // +0x40/+0x43: atomic mass (f32)
    atomic_mass: f32,
    // +0x44/+0x47: density (f32)
    density: f32,
    // +0x48/+0x4B: float_x (f32) — unknown property
    float_x: f32,
    // +0x4C/+0x4F: float_y (f32) — often 0.0
    float_y: f32,
}
```

### 3.2 Element Categories

```rust
pub enum Category {
    HydrogenUnique = 0,
    AlkaliMetals = 1,
    AlkalineEarth = 2,
    TransitionMetals = 3,
    PostTransition = 4,
    Metalloids = 5,
    Nonmetals = 6,
    Halogens = 7,
    NobleGases = 8,
    Lanthanides = 9,
    Actinides = 10,
}
```

### 3.3 Physics Kinds

```rust
pub enum PhysicsKind {
    Solid = 1,
    Gravel = 2,
    Powder = 3,
    Liquid = 4,
    Gas = 5,
}
```

### 3.4 Element ID Space

- u8 (0-255), 92 currently used (H-U), ~163 free slots
- Special IDs: 46 = Battery Positive, 47 = Battery Negative
- ID 0 = empty/none (likely)

### 3.5 Element Registry

- Runtime hash map at `DAT_140642100` (base), `DAT_140642108` (count)
- 256 capacity, 0x50-stride entries
- Key = byte slice (element name), value = ptr+len
- Populated by `FUN_1400bbf70(name_ptr, name_len, desc_ptr, desc_len, ...)`
- Panic at 256 entries: "src/lib.rs" (capacity exceeded)

### 3.6 Display Data

- Static .rdata table at 0x14034F350+ (64-byte entries)
- Contains: symbol (ptr,len), name (ptr,len), desc (ptr,len), mass, density, float_x, float_y
- 21 "special" elements with full data (H, He, C, N, O, F, Ne, Na, Mg, Al, Si, ..., Fe, Cu, Au, Hg, U)
- Other 71 elements may use default properties or be in a different format

---

## 4. GPU Rendering

### 4.1 kind_tex Layout

- R channel: element ID (u8)
- G channel: physics kind (u8)
- B/A channels: unused or temperature/pressure

### 4.2 Render Shader

- Embedded GLSL at ~0x1402E3429 (20KB, fully commented)
- Runtime-templated: `__GRID_W__` and `__GRID_H__` replaced at runtime
- Special-cased elements: K_BATTPOS=46, K_BATTNEG=47, K_HG, K_LAVA
- Shading: edge depth, directional AO, glass/ice transparency, mercury shimmer, lava pulse, ONI-style liquid field, battery caps, specular, bloom

### 4.3 Shaders

10 GLSL shader blocks extracted:
1. `render-main.glsl` — main element rendering (20KB)
2-4. `blur-*.glsl` — blur passes
5,9. `vertex-*.glsl` — vertex shaders
6-8,10. `shader-*.glsl` — utility shaders

---

## 5. Simulation Pipeline

CPU-side Rust, 17 passes per frame:

1. `update` — orchestrator
2. `compute_atmo_open` — atmospheric computation
3. `flow_water_systems` — water system flow
4. `flow_water_pressure` — water pressure flow
5. `tick_airborne` — airborne particle tick (gas)
6. `particle_movement` — falling sand physics
7. `roof_mask` — roof masking
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

### Physics Kinds

| Kind | Value | Behavior |
|------|-------|----------|
| Solid | 1 | Doesn't move, blocks other cells |
| Gravel | 2 | Falls, can be crushed |
| Powder | 3 | Falls, flows like sand |
| Liquid | 4 | Flows, pressure-based |
| Gas | 5 | Rises, diffuses |

---

## 6. Save Format (v6)

### Header
- Magic: "ALIN" (u32 LE: 0x4E494C41)
- Version: u8 (8-22 valid; else "unknown save version")
- Environment values: 2 × f32 (NaN/inf check)
- Thumbnail: W×H×3 bytes (RGB), validated: (W & 0xffff) × (H & 0xffff) × 3 == length
- Cell data: count validation ("cell count mismatch")
- Compound manifest: required for v6 ("v6 save requires a compound manifest")
- Discoveries: discovery log entries

### Migration
- Legacy saves: "compound identities were not recorded; unrecognised compounds were remapped"
- v6 requires compound manifest

### Save Directory
- If config base == ".": `./alembic_saves/`
- Otherwise: `{base}/saves/`

---

## 7. Steam Integration

- steam_api64.dll hard import (game won't start without it)
- AppID: 4933990
- Achievements: 16+ IDs (ACH_WHOLE_TABLE, ACH_FIRST_CONTACT, ACH_WELL_READ, ACH_GOING_CRITICAL, ACH_LIVE_WIRE, ACH_BOOM, ACH_FIRE, ACH_ELECTROLYTE, ACH_NEON_SIGN, ACH_RUST_NEVER_SLEEPS, ACH_BRIGHT_SPARK, ACH_COLD_SHOULDER, ACH_GOLD_STANDARD, ACH_MELTDOWN, ACH_COMPLETIONIST, ACH_CONTRACT_* ×16)
- Stats: SetAchievement, StoreStats, InitFlat
- Networking: CloseConnection, CloseListenSocket, etc.

---

## 8. I18N

- 8 languages: EN, DE, FR, PL, PT-BR, ES, IT, TR
- NotoSansSC.ttf for CJK, ProggyClean embedded (macroquad default)
- Full translations in .rdata at 0x140469BB0
- Calidum/Humidum (Latin temp/humidity), pH display
- Demo upsell: "+ {} more in the full version" (compiled into full binary, runtime-gated)

---

## 9. Tools (16)

| Tool | Description |
|------|-------------|
| Place | Circular brush |
| Heat | Pour heat into/out of brush |
| Pressure | Spray pressure, Shift for suction |
| Pipet | Collect and release cells |
| Prefab | Stamp shapes (boxes, beakers, bowls, circles, lines, batteries, wires) |
| Mortar & Pestle | Mill loose chunks into powder |
| Selection | Copy, cut, rotate, flip, paste |
| Push/Pull | Push without touching, pull without asking |
| Precision delivery | One droplet at a time |

Unlock rules: "Have 5+ different gases", "Dissolve solute into water (make brine)", "Shake window (Shift+drag)"

---

## 10. Contracts (16)

Evaporate the Sea, Alloy Foundry, Fireworks, Reclaim the Metal, Neutralize the Spill, Halogen Displacement, Reforestation, Scorched Earth, Remote Ignition, Hydrogen Storage, Going Critical, The Crucible, Jacob's Ladder, Powerhouse, First Light, The Alembic

---

## 11. Phenomena

Electrolysis, discharge (colored light), oxidation (3 ways: ambient/pure O₂/brine), ignition metals (Mg/thermite), detonation (shockwave), nuclear chain reaction, noble gas idling

---

## 12. UI/Controls

- Keybindings: stamp, R-click erase, Shift+R, rotate 90 CW/CCW, flip, delete, brush size (prefab h/w), zoom (Ctrl+Scroll), pan (middle-drag), backspace, Space (pause), F2 (screenshot), F (favorites radial), Tab/J (codex), toggle side panel
- Tabs: Elements, Reactions, Phenomena, Tools, Challenges, Favorites, Log
- Options: Music, volume

---

## 13. Audio

- rodio 0.17.3 + cpal 0.15.3 (WASAPI)
- Assets: assets/audio/music/ (ogg/wav)
- src/audio.rs (Rust module)

---

## 14. Modding Guide

### Modding Route: Flavor 3 — Hook/Loader Mod

Original exe untouched. Loader DLL injects new logic at runtime.

### Hook Points

1. **Element population** — hook to inject new elements at startup
2. **Compound registration** — hook to add new compounds
3. **Reaction dispatcher** — hook to add new reactions
4. **Tool dispatcher** — hook to add new tools
5. **Save loader** — hook to handle new save format versions
6. **Render shader loader** — hook to load custom shaders
7. **Asset loader** — hook to load custom assets

### Modding Constraints

- Element IDs: u8 (0-255), 92 used → ~163 free slots
- Compound registry: 256 cap
- Element table in .rdata (read-only) — modding requires byte-patching or hooking
- Save format: custom binary (v6) with compound manifest
- Steam achievements: hardcoded strings — new content can add
- Shader: runtime-templated — grid size changeable
- Assets: loaded from disk — new files can be added
- Both demo and full content compiled in — runtime flag gates behavior

---

## 15. Open Items (for future deep-dive)

1. Sim update function — identified pipeline (17 passes), main `update()` not located
2. Reaction table format — not extracted
3. Save v6 byte-level layout — loader analyzed, full serialization not mapped
4. Element consumer code — accessed via closure dispatch
5. Compound struct layout — not extracted
6. Tool implementations — 16 tools, logic not extracted
7. Element flags full decode — partial
8. +0x48 floats meaning — unknown
9. Full 92-element data table — only 21 special entries found

---

## 16. Files on Disk

| File | Size | Location |
|------|------|----------|
| alembic_all_decompiled.c | 15.5 MB | rea-tools/decompiled/ |
| strings-address-map.txt | ~5 MB | rea-tools/ |
| func-index.txt | ~200 KB | rea-tools/ |
| element-table.txt | ~2 KB | rea-tools/ (21 entries) |
| shaders/*.glsl | ~25 KB | rea-tools/shaders/ (10 files) |
| extracted/*.txt | ~15 KB | rea-tools/extracted/ |
| ghidra-proj/AlembicX | ~400 MB | rea-tools/ghidra-proj/ |
| REA-TASK.md | ~8 KB | ~/ |
| alembic-opus-prompt.md | ~5 KB | ~/ |
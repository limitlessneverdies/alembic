# Alembic Modding Specification (SPEC.md)

## 1. Overview

This specification defines the data structures, hook points, and modding interfaces for *Alembic* (Steam appid 4933990). The goal is to enable community-created content (new elements, compounds, reactions, tools, challenges) without modifying the original executable.

## 2. Modding Route

**Flavor 3 — Hook/Loader Mod:** Original exe untouched. A loader DLL (`alembic_mod.dll`) is injected into the game process at startup. The loader hooks the game's population functions and injects new content entries at runtime.

## 3. Element System

### 3.1 Element Struct (80 bytes / 0x50)

```rust
#[repr(C)]
pub struct ElementStatic {   // .rdata @ VA 0x14034F350, 92 entries, stride 0x50
    // +0x00..+0x0F: symbol: &str
    symbol_ptr: *const u8,
    symbol_len: usize,
    // +0x10..+0x1F: name: &str
    name_ptr: *const u8,
    name_len: usize,
    // +0x20..+0x2F: desc: &str
    desc_ptr: *const u8,
    desc_len: usize,
    // +0x30: atomic mass (f32)
    atomic_mass: f32,
    // +0x34: density (f32)
    density: f32,
    // +0x38: Pauling electronegativity (f32)
    electronegativity: f32,
    // +0x3C: f32 (always 0.0; meaning UNKNOWN)
    f3c: f32,
    // +0x40: melt point (i16, °C)
    melt_c: i16,
    // +0x42: boil point (i16, °C)
    boil_c: i16,
    // +0x44: radioactivity magnitude (u16; 0 = stable)
    radioactivity: u16,
    // +0x46: atomic number Z (u8)
    z: u8,
    // +0x47: period (u8)
    period: u8,
    // +0x48: group 1..18 (u8)
    group: u8,
    // +0x49: valence (u8)
    valence: u8,
    // +0x4A: decay marker (u8; 0 stable, nonzero for radioactive species)
    decay_marker: u8,
    // +0x4B: category 0..10 (see §3.2)
    category: u8,
    // +0x4C: STP phase (0=solid, 1=liquid (Br,Hg), 2=gas)
    phase_stp: u8,
    // +0x4D: validity flag (1 in all 92 entries)
    valid: u8,
    // +0x4E: reserved (u16, 0)
    reserved: u16,
}
```

Full decode: `docs/ELEMENTS-INTERNALS.md`, `data/elements92.json`."""

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

### 3.6 Display Data (fully decoded)

- Static `.rdata` table at VA `0x14034F350` (raw `0x34E150`), 92 entries, stride `0x50` (80 bytes), elements H (Z=1) … U (Z=92). Every entry carries full data (mass, density, electronegativity, melt/boil, radioactivity, Z, period, group, valence, STP phase, category, validity).
- The old "21 special entries + 71 defaults" wording is **SUPERSEDED** — it was an artifact of an incomplete early scan.
- Full field-by-field decode (incl. tail bytes and the kind table) in `docs/ELEMENTS-INTERNALS.md` and `data/elements92.json`.
- Consumer: `FUN_140094590` → `KIND_TABLE[Z-1]` (VA `0x14035D008`, 92 bytes) when `id < 0x5C && elem[+0x4D] != 0`, else `0x8D`."""

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

CPU-side Rust. The pipeline is a single mega-function `FUN_1400FDF00` (`0x1400FDF00`–`0x140137C10`, 236,816 bytes) running **62 named systems in fixed order**, each wrapped in QPC timing + a 24-byte profile-record Vec push. The old "17 passes" list is **SUPERSEDED**.

Full map (addresses, call counts, name-pool offsets, frame-entry disassembly, gaps): `docs/SIM-PIPELINE.md`.

Summary of the 62 systems (execution order):

refresh_presence, compute_energized, joule_heating, tick_arcs, electrolysis, tick_nuclear_traces, radioactive_decay, tree_support_check, thermite, magnesium_burn, organic_maturation, glass_etching, fluorine_hydrolysis, anhydride_hydration, slaking, dry_carbonation, neat_acid_meets_water, nitrogen_oxide_chemistry, metal_hydrogen_absorption, cerium_sparks, spark_motion, neutron_motion, halogen_displacement, hg_amalgamation, flame_test_emission, color_fires, thermal, refining, resolve_hot_h_o_charges, chemical_reactions, flush_chem_blast, base_neutralization, acid_displacement, oxidising_attack, alloy_acid_leach, alloy_formation, dissolve, diffuse_solute, carbonic_degassing, reactions, roof_mask, particle_movement, tick_airborne, flow_water_pressure, flow_water_systems, compute_atmo_open, update_breach_release, spawners, conveyors, pipes, transmutations, radiate_plates, sensors, fans, filters, generators, pressure_sources, pressure, absorb_acoustics, tick_shockwaves, evaluate_challenges, snapshot.

Frame entry: two direct call sites at `0x140017E88` and `0x14001DADC` (raw E8 rel32, verified) inside the uncarved region `0x140008370`–`0x14002F090`. Disassembly: `data/frame-entry-context.txt`.

### Physics Kinds

| Kind | Value | Behavior |
|------|-------|----------|
| Solid | 1 | Doesn't move, blocks other cells |
| Gravel | 2 | Falls, can be crushed |
| Powder | 3 | Falls, flows like sand |
| Liquid | 4 | Flows, pressure-based |
| Gas | 5 | Rises, diffuses |

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

## 15. Open Items (post-Phase 2)

1. Sim mega-function `FUN_1400FDF00` pseudo-code — **UNKNOWN** (extractr timeout); section map in `docs/SIM-PIPELINE.md` is the substitute.
2. Reaction table format — **UNKNOWN** (not extracted).
3. Save v6 byte-level layout — loader analyzed (`docs/SAVE-FORMAT.md`); per-cell stride + compound manifest entry layout **UNKNOWN** (needs a real save).
4. Compound struct layout — **UNKNOWN**.
5. Tool implementations — names + unlock rules in `docs/TOOLS-IMPL.md`; per-tool handler mapping **UNKNOWN**.
6. Element `+0x3C` f32, `+0x44` u16 radioactivity unit, `+0x4A` low byte — **UNKNOWN** (see `docs/ELEMENTS-INTERNALS.md`).
7. Frame driver region `0x140008370`–`0x14002F090` — uncarved in the 15.5 MB dump; call sites A/B documented in `docs/SIM-PIPELINE.md` §3.
8. 15 extract-dump holes (~640 KB) — see `data/dump-gaps.txt`.
9. Section 62 snapshot call list truncated (cosmetic).
10. 24-byte profile record layout — **UNKNOWN**.

---

## 16. Files on Disk

| File | Size | Location |
|------|------|----------|
| alembic_all_extracted.c | 15.5 MB | rea-tools/extracted/ |
| strings-address-map.txt | ~5 MB | rea-tools/ |
| func-index.txt | ~200 KB | rea-tools/ |
| element-table.txt | ~2 KB | rea-tools/ (21 entries) |
| shaders/*.glsl | ~25 KB | rea-tools/shaders/ (10 files) |
| extracted/*.txt | ~15 KB | rea-tools/extracted/ |
| ghidra-proj/AlembicX | ~400 MB | rea-tools/ghidra-proj/ |
| REA-TASK.md | ~8 KB | ~/ |
| alembic-opus-prompt.md | ~5 KB | ~/ |
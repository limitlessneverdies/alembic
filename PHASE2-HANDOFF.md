# Alembic Reverse-Engineering — Phase 2 Handoff

Repository: `https://github.com/limitlessneverdies/alembic-re` (master). Local: `C:\Users\limit\alembic-re`.
Target binary: `alembic.exe` (Steam appid 4933990), sha256 `31b67190d09f9e8891a4c8129258604a85aa354dae521295a2a052d2a10d3e99`.

## Phase status
- Phase 1 (extraction): COMPLETE — decompiled C (15.5 MB), 119,871 strings map, element table, shaders, assets.
- Phase 2 (analysis docs): COMPLETE — this repo's `docs/` + `data/` + `src/`.
- Phase 3 (Rust reimplementation): NOT STARTED — hand this repo to the implementing model.

## Document index (`docs/`)
- `SIM-PIPELINE.md` — 62-system sim pipeline, frame entry, helpers, gaps.
- `ELEMENTS-INTERNALS.md` — 92-element table fully decoded + kind table + consumer.
- `SAVE-FORMAT.md` — v6 save loader byte map.
- `TOOLS-IMPL.md` — 16 tools (names/unlocks; handler mapping open).
- `REACTIONS-COMPOUNDS.md` — chemistry passes, compound registry, reaction table (open).
- `SYSTEMS-WORLD-DYNAMICS.md`, `SYSTEMS-MACHINES-ENERGY.md`, `SYSTEMS-PHYSICS-FIRE.md`, `SYSTEMS-MICRO-REACTIONS.md` — per-subsystem system notes.
- `SPEC.md` — modding spec (corrected to 62 systems).
- `architecture.md`, `elements.md`, `gpu-layout.md`, `modding.md` — earlier notes.

## Data (`data/`)
- `elements92.json` / `.txt` — full 92-element dump.
- `kind-table.bin` / `.txt` — 92-byte kind table (VA 0x14035D008).
- `sim-sections.txt` — per-system ordered call map (source of SIM-PIPELINE table).
- `sim-timeline.txt` — 1,729-event merged timeline.
- `sim-name-pool.bin` / `.txt` — 886-byte name pool with offsets.
- `poolrefs.txt`, `elemrefs.txt` — LEA ref maps.
- `lea-refs.txt`, `func-index.txt` — full ref index / function map.
- `frame-entry-context.txt` — disassembly of the two sim call sites.
- `dump-gaps.txt` — 15 uncarved code regions (~607 KiB).

## Code (`src/`, `tools/`)
- `src/systems/*.txt` — 130 decompiled helper bodies.
- `tools/*.py` — Python toolkit (peutils, sim_map, callscan, timeline, leascan, elements_extract, kindtable, find_callers, disasm_frame_entry, …).

## Key verified facts
1. Element table: VA 0x14034F350, stride 0x50, 92 entries (H..U). Layout in `ELEMENTS-INTERNALS.md`. Consumer `FUN_140094590` → `KIND_TABLE[Z-1]` (VA 0x14035D008) or 0x8D.
2. Sim: `FUN_1400FDF00` (0x1400FDF00–0x140137C10, 236,816 B), 62 systems in fixed order (list in `SIM-PIPELINE.md` §2). Each section: QPC timing + 24-byte profile Vec push. Name pool 886 B at VA 0x140356D20 (bare concat). RNG `FUN_140206870` (PCG, mult 0x5851f42d4c957f2d).
3. Frame entry: exactly two E8 calls to the sim at `0x140017E88` (per-frame) and `0x14001DADC` (stepping mode, gated on world+0x297A != 1, counter to 0x707). World ptr at frame [rbp+0x2580]; ambient floats at world+0x2740/0x2744.
4. Save format: magic "ALIN" (u32), version u8 @+4, env 2×f32, thumbnail W×H×3, cell count check, compound manifest (v6), discoveries. See `SAVE-FORMAT.md`.
5. GPU rendering: 10 GLSL shaders in `rea-tools/shaders/` (also in repo `assets/`? check); render shader at ~0x1402E3429 (20 KB, runtime-templated).
6. Audio: rodio 0.17.3 + cpal 0.15.3; 16 ogg + assets in `assets/`.

## Open items (Phase 3 inputs)
- Reaction table format; compound struct layout; per-cell save stride; tool handler mapping; element +0x3C/+0x44/+0x4A semantics; 24-byte profile record layout; 15 dump holes (~607 KiB) incl. frame driver region; sim mega-function pseudo-code (decompile timeout); snapshot serialization.

## Reproduce
All analysis scripts in `tools/`. Primary: `sim_map.py`, `callscan.py`, `timeline.py`, `leascan.py`, `elements_extract.py`, `kindtable.py`, `find_callers.py`, `disasm_frame_entry.py`. Inputs: `alembic.exe` (not in repo — obtain from Steam).

## Evidence discipline
Claims are labeled CONFIRMED/INFERRED/UNKNOWN with REA/byte/code backing. Original exe untouched. Evidence artifacts in `evidence/`: `alembic-final-bundle.json` (72,928 B, 11 records, 4 unknowns), `alembic-session-bundle.json` (2 records), `alembic.snapshot` (70,474 B, 7 evidence records, 1 workflow entry). An earlier REA pass produced a larger snapshot (13.65 MB) holding an oversized save-loader dossier (evidence_id `ev_6161d7a8…`); that snapshot was overwritten during the unknown-recording recovery pass. The save-loader pseudo-code is preserved in `src/extracted/FUN_1400c8a80_1400c8a80.txt` and summarized in `docs/SAVE-FORMAT.md`. REA MCP provider was observed wedged ("Analysis could not complete") intermittently; `rea doctor` reports environment healthy. Unknowns recorded (4): element `+0x4A` low byte, `+0x44` radioactivity unit, v6 per-cell stride + compound-manifest entry, 24-byte profile record layout.

## Big artifacts (GitHub release, not committed)
- `rea-tools/decompiled/alembic_all_decompiled.c` (15.5 MB)
- `rea-tools/strings-address-map.txt` (3.76 MB)
- `rea-tools/lea-refs.txt` (0.4 MB)
- `rea-tools/func-index.txt` (0.27 MB)
- `rea-tools/sim_timeline.txt` (0.18 MB)
Release tag: `phase2`.

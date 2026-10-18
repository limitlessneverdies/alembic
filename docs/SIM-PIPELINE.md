# Alembic — Simulation Pipeline (Reverse-Engineered Map)

Target: `alembic.exe` (Steam appid 4933990), sha256 `31b67190d09f9e8891a4c8129258604a85aa354dae521295a2a052d2a10d3e99`.
All addresses are image-base VAs (ImageBase `0x140000000`). Raw→VA deltas: `.text` +0x140000C00, `.rdata` +0x140001200, `.data` +0x140001A00.

Confidence tags: **CONFIRMED** = byte/code-verified; **INFERRED** = reasoned from evidence; **UNKNOWN** = open.

---

## 1. The orchestrator mega-function `FUN_1400FDF00`

**CONFIRMED**: The whole per-tick simulation pipeline lives in one gigantic function:

| Property | Value |
|---|---|
| Entry VA | `0x1400FDF00` |
| End | immediately before `FUN_140137C10` (`0x140137C10`) |
| Size | `0x39D10` = **236,816 bytes (~231 KiB)** |
| Structure | 62 consecutive system sections (lexical blocks), one per named system |
| Ghidra decompile | **TIMES OUT** (never retry blind; the pseudo-code of this function has never been produced) |

The reconstruction in this document was produced from:
- 1,135 RIP-relative LEA references inside the function (`fun_1400fdf00_refs.txt`)
- 1,667 direct call sites (`fun_calls.tsv`)
- the 62-name debug string pool (below) — all 62 refs to the pool come from this function alone (`poolrefs.txt`)
- 130 individually-decompiled helper bodies (`../src/systems/`)

### 1.1 Per-system profile framework

Each of the 62 sections is wrapped in a timing/profiling envelope:

```
lea  reg, [rip + name_ptr]      ; section's debug name (ptr only — lengths are immediates)
call FUN_1401A63E0              ; QPC start-info capture
... section body ...
call FUN_1401A6480              ; QPC stop + delta
lea  reg, [profile_vec]
call FUN_1402CC340              ; Vec::push of a 24-byte profile record
```

- `FUN_1401A63E0` / `FUN_1401A6480` — QueryPerformanceCounter pair (CONFIRMED by body extraction).
- `FUN_1402CC340` — dynamic-array (Vec) growth helper for 24-byte records (CONFIRMED body).
- `FUN_1402CBA90` — SIMD memset (CONFIRMED body).
- The 24-byte profile record layout is **UNKNOWN** (candidate: `{name_ptr, name_len, duration, ...}` — not byte-verified).

### 1.2 The 62-system name pool

**CONFIRMED**: 886-byte bare ASCII pool at raw `0x355B20` (VA `0x140356D20`). Names are concatenated **without separators**; each name slice is `(ptr, len-immediate)` loaded at its section head. Offsets below are exact; `offset + len` of the last name = 886 (verified).

---

## 2. The 62 systems in execution order

Order is the literal section order inside `FUN_1400FDF00` (address order). "Calls" = direct-call count inside the section as recovered by `fun_calls.tsv`/`sim_sections.txt` (`xN` = same callee called N times).

| # | Name | Section @VA | Name pool @VA | Calls | Group (INFERRED) |
|---|------|------------|---------------|-------|------------------|
| 01 | refresh_presence | `0x1400FE337` | `0x140356D20` | 11 | world/energy |
| 02 | compute_energized | `0x1400FE8F3` | `0x140356D30` | 5 | world/energy |
| 03 | joule_heating | `0x1400FED94` | `0x140356D41` | 12 | world/energy |
| 04 | tick_arcs | `0x1400FF397` | `0x140356D4E` | 27 | world/energy |
| 05 | electrolysis | `0x140100D27` | `0x140356D57` | 3 | world/energy |
| 06 | tick_nuclear_traces | `0x140100F36` | `0x140356D63` | 37 | nuclear |
| 07 | radioactive_decay | `0x140102206` | `0x140356D76` | 3 | nuclear |
| 08 | tree_support_check | `0x1401022D6` | `0x140356D87` | 13 | materials |
| 09 | thermite | `0x140102DA2` | `0x140356D99` | 13 | materials |
| 10 | magnesium_burn | `0x140103F46` | `0x140356DA1` | 5 | materials |
| 11 | organic_maturation | `0x140104BE9` | `0x140356DAF` | 3 | materials |
| 12 | glass_etching | `0x140104CEC` | `0x140356DC1` | 3 | materials |
| 13 | fluorine_hydrolysis | `0x140104DE1` | `0x140356DCE` | 34 | materials |
| 14 | anhydride_hydration | `0x1401070C4` | `0x140356DE1` | 12 | materials |
| 15 | slaking | `0x1401077D0` | `0x140356DF4` | 12 | materials |
| 16 | dry_carbonation | `0x140107F34` | `0x140356DFB` | 7 | materials |
| 17 | neat_acid_meets_water | `0x140108811` | `0x140356E0A` | 39 | chemistry |
| 18 | nitrogen_oxide_chemistry | `0x14010A6B9` | `0x140356E1F` | 11 | chemistry |
| 19 | metal_hydrogen_absorption | `0x14010B28C` | `0x140356E37` | 6 | materials |
| 20 | cerium_sparks | `0x14010B555` | `0x140356E50` | 3 | materials |
| 21 | spark_motion | `0x14010B7BA` | `0x140356E5D` | 18 | particle motion |
| 22 | neutron_motion | `0x14010C6AE` | `0x140356E69` | 10 | particle motion |
| 23 | halogen_displacement | `0x14010D23B` | `0x140356E77` | 20 | chemistry |
| 24 | hg_amalgamation | `0x14010E3CB` | `0x140356E8B` | 8 | materials |
| 25 | flame_test_emission | `0x14010EF93` | `0x140356E9A` | 3 | optics/thermal |
| 26 | color_fires | `0x14010F44D` | `0x140356EAD` | 4 | optics/thermal |
| 27 | thermal | `0x14010F505` | `0x140356EB8` | 6 | optics/thermal |
| 28 | refining | `0x14010F76B` | `0x140356EBF` | 49 | materials/industrial |
| 29 | resolve_hot_h_o_charges | `0x14011114C` | `0x140356EC7` | 4 | chemistry |
| 30 | chemical_reactions | `0x140111204` | `0x140356EDE` | 7 | chemistry |
| 31 | flush_chem_blast | `0x140111380` | `0x140356EF0` | 9 | chemistry |
| 32 | base_neutralization | `0x1401115E9` | `0x140356F00` | 18 | chemistry |
| 33 | acid_displacement | `0x1401126A1` | `0x140356F13` | 23 | chemistry |
| 34 | oxidising_attack | `0x140113D11` | `0x140356F24` | 28 | chemistry |
| 35 | alloy_acid_leach | `0x140114EAA` | `0x140356F34` | 9 | chemistry |
| 36 | alloy_formation | `0x1401160FA` | `0x140356F44` | 8 | chemistry |
| 37 | dissolve | `0x1401174F2` | `0x140356F53` | 41 | chemistry/solutes |
| 38 | diffuse_solute | `0x140118961` | `0x140356F5B` | 11 | chemistry/solutes |
| 39 | carbonic_degassing | `0x140118ED5` | `0x140356F69` | 10 | chemistry |
| 40 | reactions | `0x140119443` | `0x140356F7B` | 4 | chemistry |
| 41 | roof_mask | `0x140119655` | `0x140356F84` | 196 | spatial |
| 42 | particle_movement | `0x140123578` | `0x140356F8D` | 12 | spatial |
| 43 | tick_airborne | `0x140123DEC` | `0x140356F9E` | 25 | spatial |
| 44 | flow_water_pressure | `0x140125D99` | `0x140356FAB` | 39 | fluids |
| 45 | flow_water_systems | `0x140127AC9` | `0x140356FBE` | 4 | fluids |
| 46 | compute_atmo_open | `0x140127B82` | `0x140356FD0` | 14 | world state |
| 47 | update_breach_release | `0x1401285DA` | `0x140356FE1` | 17 | world state |
| 48 | spawners | `0x1401294BF` | `0x140356FF6` | 15 | machines |
| 49 | conveyors | `0x14012A409` | `0x140356FFE` | 33 | machines |
| 50 | pipes | `0x14012BDD4` | `0x140357007` | 18 | machines |
| 51 | transmutations | `0x14012C4EC` | `0x14035700C` | 18 | machines |
| 52 | radiate_plates | `0x14012C8B3` | `0x14035701A` | 22 | machines |
| 53 | sensors | `0x14012D1C0` | `0x140357028` | 24 | machines |
| 54 | fans | `0x14012F974` | `0x14035702F` | 10 | machines |
| 55 | filters | `0x1401303BF` | `0x140357033` | 5 | machines |
| 56 | generators | `0x140130618` | `0x14035703A` | 10 | machines |
| 57 | pressure_sources | `0x140131128` | `0x140357044` | 11 | pressure |
| 58 | pressure | `0x140131400` | `0x140357054` | 9 | pressure |
| 59 | absorb_acoustics | `0x1401316A0` | `0x14035705C` | 16 | physics |
| 60 | tick_shockwaves | `0x140132B55` | `0x14035706C` | 586 | physics |
| 61 | evaluate_challenges | `0x1401379C8` | `0x14035707B` | 4 | meta |
| 62 | snapshot | `0x140137B02` | `0x14035708E`… see note | 25 | meta |

Notes:
- Name pool check: deltas between consecutive pool VAs equal exact name lengths (bare concatenation, no separators); total = 886 bytes. `snapshot` occupies the final 8 bytes (offset 878).
- Section 62 (`snapshot`) call list in `sim_sections.txt` is truncated (11 of 25 listed — map generation limit; re-run `sim_map.py` to complete).
- Section 60 (`tick_shockwaves`) is dominated by inlined heavy-SIMD helper `FUN_1402D4F02` (invoked ~x170/x66/x47 in runs) plus repeated `FUN_1402D4818`/`FUN_1402D4831`/`FUN_1402D1C80` — a noise/blast-field update kernel. CONFIRMED counts; exact semantics of `FUN_1402D4F02` pending (it also appears as a panic sink).

---

## 3. Who calls the simulation, and how (frame entry)

**CONFIRMED (raw byte scan)**: `FUN_1400FDF00` is called from exactly two places in the whole binary, both `E8 rel32` direct calls (no LEA, no indirect, no absolute pointer anywhere — verified by full-file qword scan and full-text LEA scan):

| Site | VA | Disassembly | Notes |
|---|---|---|---|
| A | `0x140017E88` | `call 0x1400FDF00` | entered per frame; preceded by `movss xmm1,[rax+0x2740]`, `movss xmm2,[rax+0x2744]` (ambient floats from world struct) |
| B | `0x14001DADC` | `call 0x1400FDF00` | guarded: skipped when `byte [world+0x297A] == 1`; sets same xmm1/xmm2; `rcx = [rbp+0x22E8]`; after return increments `[world+0x28B8]` and compares to `0x707` (1799) — stepping/warm-up style loop (**INFERRED**) |

Context (raw disassembly, capstone x86-64, from `frame-entry-context.txt`):

```
site A:
  0x140017E78  movss  xmm1,[rax+0x2740]
  0x140017E80  movss  xmm2,[rax+0x2744]
  0x140017E88  call   0x1400FDF00          <-- sim runs here
  0x140017E8D  mov    rax,[rbp+0x2580]     ; world ptr kept at frame [rbp+0x2580]
  0x140017E94  cmp    byte [rax+0x297A],0
  0x140017E9B  jne    0x140017F42
  0x140017EA1  mov    cx,0xFFC5
  0x140017EA5  call   0x140176C20
  0x140017EAA  test   al,al
  0x140017EAC  je     0x140017F42
  0x140017EB2  call   0x1401550B0
  ... frame present/UI path follows

site B:
  0x14001DAB2  cmp    byte [rax+0x297A],1
  0x14001DAB9  je     0x14001DAE1          ; skip when flag==1
  0x14001DABB  mov    rax,[rbp+0x2580]
  0x14001DAC2  movd   xmm1,[rax+0x2740]
  0x14001DACA  movss  xmm2,[rax+0x2744]
  0x14001DAD2  mov    r14b,1
  0x14001DAD5  mov    rcx,[rbp+0x22E8]
  0x14001DADC  call   0x1400FDF00          <-- sim (stepping mode)
  0x14001DAE1  mov    rcx,[rbp+0x2580]
  0x14001DAE8  mov    eax,[rcx+0x28B8]
  0x14001DAEE  inc    eax
  0x14001DAF0  mov    [rcx+0x28B8],eax
  0x14001DAF6  cmp    eax,0x707            ; 1799
  0x14001DAFB  jbe    0x14001DC71
```

**CONFIRMED**: both call sites are inside the address range `0x140008370`–`0x14002F090`, a region that the current 15.5 MB decompile dump does **not** include (see §6). The enclosing function(s) of these sites have not yet been decompiled as whole bodies.

**INFERRED** frame flow at site A: sim tick → check `world+0x297A` mode byte → present/render path (`FUN_140176C20` may be a vsync/present gate given `cx=0xFFC5` looks like a message/ID constant; unverified) → continue UI.

**CONFIRMED (data xrefs)**: `FUN_1400FDF00` references (among others): `0x140644820` (hot global, hit repeatedly per section — likely profile accumulator/context), `0x1402F6D10/18/20`, `0x1402F76FC`, `0x140364834…`, `0x140358490` (.rdata tables).

---

## 4. Shared helper functions (IDs used across sections)

| Function | Role | Status |
|---|---|---|
| `FUN_1401A63E0` | QPC start capture | CONFIRMED (body) |
| `FUN_1401A6480` | QPC stop/delta | CONFIRMED (body) |
| `FUN_140206870` | PCG-family RNG, multiplier `0x5851f42d4c957f2d` | CONFIRMED (body); called by nearly every stochastic system |
| `FUN_1402CBA90` | SIMD memset | CONFIRMED (body) |
| `FUN_1402CC340` | Vec push/grow (24-byte records) | CONFIRMED (body) |
| `FUN_1402CC570` | Vec auxiliary op (repeated x6 in refresh_presence) | body extracted |
| `FUN_1402D4F02` | heavy SIMD kernel (tick_shockwaves; also panic sink) | body extraction failed/timeout in dump; count-verified |
| `FUN_1400BBF70` | element/compound registration bookkeeping | CONFIRMED (prior dossier ev_1beb52eb…) |
| `FUN_140094590` | element consumer (`kind = KIND_TABLE[Z-1]` path) | CONFIRMED (pseudo-code captured) |

All 130 extracted helper bodies: `../src/systems/*.txt` (incl. `ceilf`, `floorf`, `roundf`, `trunc`, `memcmp` intrinsics).

---

## 5. Reproduce / verify

| Step | Command (from repo `tools/`) |
|---|---|
| Section map | `python sim_map.py C:\path\alembic.exe` → `sim_sections.txt` |
| Direct calls | `python callscan.py` → `fun_calls.tsv` |
| LEA refs | `python leascan.py` → `lea-refs.txt` |
| Timeline merge | `python timeline.py` → `sim_timeline.txt` |
| Name pool | raw `0x355B20`, 886 bytes; parse lengths from `lea+imm` pairs |
| Call sites | `python find_callers.py` (raw E8/E9 scan) → confirmed sites A/B |
| Entry disasm | `python disasm_frame_entry.py` (capstone 5.x) |

Source artifacts: `../data/sim-sections.txt`, `../data/sim-timeline.txt`, `../data/poolrefs.txt`, `../data/elemrefs.txt`, `../data/frame-entry-context.txt`.

---

## 6. Known gaps / open items

1. **Decompile-dump holes (15 regions, ≈640 KB total)** — functions with no bodies in `alembic_all_decompiled.c` (see `../data/dump-gaps.txt`). Largest: `0x140008370 → 0x14002F090` (159,008 B — hosts the frame driver), and `0x1400FDF00 → 0x140137C10` (236,816 B — this pipeline). Workaround adopted: `src/systems/` holds 130 helper bodies extracted individually from REA; supplementary passes fill others.
2. `FUN_1400FDF00` pseudo-code itself: **UNKNOWN** (decompiler timeout — algorithmic, not hardware). Section map in this file is the substitute.
3. 24-byte profile record layout: **UNKNOWN**.
4. Site B's `0x707` (1799) counter and `world+0x297A` flag: semantics **INFERRED** (stepping/warm-up); verify against live game (`Cheat Engine`-style watch on `world+0x28B8`).
5. Section 62 call list truncated in current map (cosmetic).
6. `world+0x2740/0x2744` ambient floats → feed `xmm1/xmm2` into sim: **INFERRED** (temperatures/humidity); confirmable via live watch while changing environment sliders.

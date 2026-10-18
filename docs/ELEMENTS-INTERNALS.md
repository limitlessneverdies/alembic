# Alembic — Element System Internals

Source: `alembic.exe` sha256 `31b67190d09f9e8891a4c8129258604a85aa354dae521295a2a052d2a10d3e99`. Evidence: `rea-tools/elements92.json`, `rea-tools/kindtab.txt`, REA dossiers (registry `ev_1beb52eb…`, consumer `ev_279682be…`).

## 1. Static element table (`.rdata`)

**CONFIRMED**: 92 entries at VA `0x14034F350` (raw `0x34E150`), stride `0x50` (80 bytes), elements H (Z=1) through U (Z=92).

Layout (byte offsets within each 80-byte entry):

| Offset | Size | Field | Verified values / notes |
|---|---|---|---|
| +0x00 | 16 | `symbol: &str` | ptr,len into `.rdata` (e.g. "H","He",…) |
| +0x10 | 16 | `name: &str` | "Hydrogen","Helium",… |
| +0x20 | 16 | `desc: &str` | handbook description |
| +0x30 | 4 | `atomic_mass: f32` | H=1.008, Li=6.941, U=238.029… |
| +0x34 | 4 | `density: f32` | H=9.0e-5 (g/cm³ scale) |
| +0x38 | 4 | `electronegativity: f32` | Pauling scale (H=2.20, F=3.98, …) |
| +0x3C | 4 | `f3c: f32` | always 0.0 in all 92 entries — **UNKNOWN** meaning |
| +0x40 | 2 | `melt_c: i16` | °C (H=-259, Li=180, Fe=1538, Hg=-39) |
| +0x42 | 2 | `boil_c: i16` | °C (H=-253, Li=1342, Fe=2862, Hg=357) |
| +0x44 | 2 | `radioactivity: u16` | 0 = stable; Po=70, At=40, Rn=30, Ra=50, Th=20, Pa=30, U=30, Ac=30. **Unit UNKNOWN** (not Tc/Pm/Fr despite those being radioactive) |
| +0x46 | 1 | `Z: u8` | atomic number 1..92 |
| +0x47 | 1 | `period: u8` | 1..9 |
| +0x48 | 1 | `group: u8` | 1..18 (IUPAC) |
| +0x49 | 1 | `valence: u8` | 1..8 |
| +0x4A | 1 | `decay_marker: u8` | 0 for stable; nonzero only for Tc (0x4C), Pm (0x5C), and Z≥84 (Po 0x33, At 0x6E, Rn 0x6F, Fr 0x35, Ra 0x33, Ac 0x74, Th 0x35, Pa 0x73, U 0x33). **Semantics UNKNOWN** |
| +0x4B | 1 | `category: u8` | 0=HydrogenUnique … 10=Actinides (see §3) |
| +0x4C | 1 | `phase_stp: u8` | 0=solid, 1=liquid (Br, Hg), 2=gas |
| +0x4D | 1 | `valid: u8` | 1 in all 92 entries (consumer gate) |
| +0x4E | 2 | `reserved: u16` | 0 in all entries |

Full dump: `rea-tools/elements92.json` + `rea-tools/elements92.txt` (also staged as `data/elements92.json`).

## 2. Element consumer (`FUN_140094590`)

**CONFIRMED** pseudo-code (REA dossier ev_279682be…):

```c
// returns a "physics kind" byte used by the renderer/sim
u8 consumer(u8 element_id) {
    if (element_id < 0x5C
        && static_table[element_id].valid != 0          // +0x4D
        && (element_id) < 0x5C) {                      // Z-1 < 0x5C i.e. Z <= 92
        return KIND_TABLE[element_id - 1];             // VA 0x14035D008
    }
    return 0x8D;                                    // default "unknown kind"
}
```

- `KIND_TABLE` @ VA `0x14035D008`, 92 bytes, indexed by `Z-1`. Values: H..U = `0x12 … 0x26` sequential for the 21 core materials, others `0x2D … 0x75`. Full dump: `rea-tools/kindtab.txt`.
- Element IDs are `u8` (0–255); 92 used (H–U); ~163 free slots. Special IDs from SPEC: 46 = Battery Positive, 47 = Battery Negative (these are **kind/overlay IDs**, not periodic-table Z — they do not appear in the 92-entry table; INFERRED).

## 3. Category enum (`+0x4B`)

Matches the enum already documented in `SPEC.md §3.2`:

| Value | Category |
|---|---|
| 0 | HydrogenUnique |
| 1 | AlkaliMetals |
| 2 | AlkalineEarth |
| 3 | TransitionMetals |
| 4 | PostTransition |
| 5 | Metalloids |
| 6 | Nonmetals |
| 7 | Halogens |
| 8 | NobleGases |
| 9 | Lanthanides |
| 10 | Actinides |

CONFIRMED for all 92 entries (e.g. H=0, He=8, Fe=3, U=10, La=9).

## 4. Runtime registry (`FUN_1400bbf70`)

- Hash map base `DAT_140642100`, count `DAT_140642108`, capacity 256, entry stride `0x50`.
- Key = byte slice (element name); value = ptr+len.
- Populated by `FUN_1400bbf70(name_ptr, name_len, desc_ptr, desc_len, …)`.
- Panic at 256 entries: `"src/lib.rs"` (capacity exceeded) — REA dossier ev_1beb52eb….
- Registry is the *runtime* form; the static table is the *shipped* form. Modding via hook/loader (SPEC Flavor 3) targets the registry.

## 5. STP phase field (`+0x4C`)

| Value | Meaning | Examples |
|---|---|---|
| 0 | solid | everything else (Fe, Au, Na, …) |
| 1 | liquid | Br, Hg |
| 2 | gas | H, He, N, O, F, Ne, Cl, Ar, Kr, Xe, Rn |

CONFIRMED against known STP phases for all 92 entries.

## 6. Open questions

- `+0x3C` f32 = 0.0 in all entries — meaning **UNKNOWN** (candidate: unused/reserved).
- `+0x44` u16 "radioactivity" — values 0–70; exact unit **UNKNOWN** (does not correlate monotonically with half-life; candidate: sim decay-intensity bucket).
- `+0x4A` low byte — nonzero only for radioactive species (Tc, Pm, Z≥84); **UNKNOWN** (candidate: decay-mode/daughter index).
- Battery Positive/Negative (IDs 46/47) — overlay kinds, not in the 92-entry table; **INFERRED** from SPEC.
- 21 "special" elements with full data vs 71 defaults (old SPEC wording) — **SUPERSEDED**: all 92 entries carry full data; the distinction was an artifact of an incomplete early scan.

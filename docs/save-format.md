# Alembic — Save Format (v6 loader analysis)

Source: `FUN_1400c8a80` (3,058 bytes, extracted body in `rea-tools/extracted/FUN_1400c8a80_1400c8a80.txt`), plus SPEC.md §6 strings ("ALIN", "unknown save version", "cell count mismatch", "v6 save requires a compound manifest", "compound identities were not recorded; unrecognised compounds were remapped").

## 1. High-level

- File starts with magic `ALIN` (u32 LE `0x4E494C41`).
- Version byte at offset 4. Loader accepts 8..255 (`(version-8) < 0xF9`); versions < 8 → "unknown save version".
- Version gates feature sets: <2, <4, <5, <6, ≥6 (see §3).
- v6 (and the modding target) requires a compound manifest; v<6 are "legacy" and trigger remapping of unrecognised compounds.
- Save directory: `./alembic_saves/` if config base == `"."`, else `{base}/saves/`.

## 2. Header (CONFIRMED magic/version; INFERRED field widths from stream helpers)

```
offset  size  field
0       4     magic: u32 LE = 0x4E494C41 ("ALIN")
4       1     version: u8
5       ?     (version-gated environment values begin here; see §3)
```

Stream is read through helpers `FUN_14006f1f0/250/2d0/350/3d0/450/4c0` (exact widths not individually verified — marked INFERRED).

## 3. Version-gated fields

| Version | Behaviour |
|---|---|
| < 2 | Environment values default to `DAT_1402df008` / `DAT_1402f69a0`; `uVar9 = 1` (a flag). |
| ≥ 2 | Read 2 × f32 environment values (temp/humidity-style); NaN/inf rejected ("invalid environment values"). |
| < 4 | Skip an extra block (line 206-213). |
| < 5 | `local_101 = 8` (default thumbnail dimension). |
| ≥ 5 | Read thumbnail dimensions W, H (u16 each, masked `& 0xffff`) plus a u32 byte length; validate `(W & 0xffff) * (H & 0xffff) * 3 == length` ("invalid thumbnail length"); then read `length` bytes (RGB, W×H×3). |
| < 6 | Legacy path: "save is missing its compound manifest … Legacy save: compound identities were not recorded; unrecognised compounds were remapped." |
| ≥ 6 | Compound manifest required ("v6 save requires a compound manifest"); discoveries log read. |

## 4. Body

- Cell count validation: loader compares stream count against `*(ulonglong *)(param_1 + 0x48)` ("cell count mismatch").
- Cell data: read per cell (element id + state). Exact per-cell stride **UNKNOWN** (the cell struct is not yet mapped byte-for-byte; candidate 4–16 bytes incl. element id, temperature, pressure, compound ref).
- Compound manifest (v6): list of compound identities (count + entries). Entry layout **UNKNOWN** (see REACTIONS-COMPOUNDS.md).
- Discoveries: discovery log entries (count + ids).
- Thumbnail RGB blob (if version ≥ 5).

## 5. Error strings (from binary, CONFIRMED)

- `"unknown save version"`
- `"invalid environment values"`
- `"invalid thumbnail length"`
- `"cell count mismatch"`
- `"save is missing its compound manifest and discoveries … Legacy save: compound identities were not recorded; unrecognised compounds were remapped. v6 save requires a compound manifest"`

## 6. Open questions

- Exact per-cell byte stride and field order — **UNKNOWN** (needs a real save file; none found in the Steam install — only assets).
- Compound manifest entry layout — **UNKNOWN**.
- Discoveries entry layout — **UNKNOWN**.
- Thumbnail placement (before/after cells) — INFERRED: thumbnail read happens before cell count validation in the loader, so thumbnail precedes cells.
- Whether saves are compressed/encrypted — not observed in loader (raw reads).

## 7. Note on saves in the wild

No save files were found anywhere in the Steam install (`C:\Users\limit\Downloads\Alembic\Alembic\Alembic\`) — only assets (16 ogg, 9 ttf, 6 png). Save directory is created at runtime by the game. To complete the byte map, run the game once and capture a minimal save, then diff against this loader.

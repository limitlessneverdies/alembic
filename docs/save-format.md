# Save Format (v6)

## Header

| Offset | Field | Type | Notes |
|--------|-------|------|-------|
| 0 | Magic | u32 (LE) | "ALIN" (0x4E494C41) |
| 4 | Version | u8 | Must be 8-22 (0x08-0x16), else "unknown save version" |
| 5+ | Environment values | 2 × f32 | NaN/inf check (0x7f7fffff) |
| ... | Thumbnail | W×H×3 bytes (RGB) | Width×Height×3, validated: (W & 0xffff) × (H & 0xffff) × 3 == thumbnail_length |
| ... | Cell data | variable | Cell count validation ("cell count mismatch") |
| ... | Compound manifest | variable | Required for v6 ("v6 save requires a compound manifest") |
| ... | Discoveries | variable | Discovery log entries |

## Error Messages

- "unknown save version" — version byte < 8 or > 22
- "invalid environment values" — NaN or inf in environment floats
- "invalid thumbnail length" — thumbnail size mismatch
- "cell count mismatch" — cell count doesn't match expected
- "save is missing its compound manifest and discoveries" — v6 requires compound manifest
- "Legacy save: compound identities were not recorded; unrecognised compounds were remapped." — migration from older format

## Migration

Legacy saves (pre-v6) don't have compound manifests. On load, the game:
1. Detects missing compound manifest
2. Remaps unrecognised compounds
3. Reports "Legacy save: compound identities were not recorded; unrecognised compounds were remapped."

## Save Directory

- If config base == ".": saves go to `./alembic_saves/`
- Otherwise: saves go to `{base}/saves/`

## Save Loader Function

- `FUN_1400c8a80` (3,058 bytes) — closure-dispatched, never called by name
- Reads magic, version, environment, thumbnail, cell data, compound manifest, discoveries
- Validates all fields, returns 1 on error

## Open Questions

- Exact byte-level layout of cell data (element ID, temperature, pressure per cell)
- Compound manifest binary format (entry count, entry size, fields)
- Discovery log format
- Thumbnail format (raw RGB, no compression?)
- Compression (none detected — custom binary)
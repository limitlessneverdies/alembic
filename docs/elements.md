# Element System

## Struct Layout (80 bytes / 0x50)

| Offset | Field | Type | Notes |
|--------|-------|------|-------|
| +0x00..+0x0F | flags/metadata | 16 bytes | Packed (category, period, group, phase, etc.) |
| +0x10/+0x18 | symbol (ptr, len) | u64×2 | → packed symbol blob "HHeCNOFNeNaMgAlSiPSClKCaFeCuAuHgURustS..." |
| +0x20/+0x28 | name (ptr, len) | u64×2 | → handbook blob |
| +0x30/+0x38 | desc (ptr, len) | u64×2 | → handbook blob |
| +0x40/+0x43 | atomic_mass | f32 | H=1.008, He=4.006, C=12.011 ✓ |
| +0x44/+0x47 | density | f32 | H=8.99e-5, He=1.786e-4, C=2.267 ✓ |
| +0x48/+0x4B | float_x | f32 | H=2.2, He=2.2, C=2.55 (unknown property) |
| +0x4C/+0x4F | float_y | f32 | Often 0.0 |

## Categories (from UI strings)

Hydrogen (unique), Alkali Metals, Alkaline-Earth Metals, Transition Metals, Post-Transition Metals, Metalloids, Nonmetals, Halogens, Noble Gases, Lanthanides, Actinides

## Key Data

- **92 elements** in full version (only Oganesson missing)
- u8 ID space (0-255), ~163 free slots
- Registry cap: **256 live species** (dev string: "[registry] flooded ... /256 live")
- Element handbook: name+desc pairs in .rdata at 0x14034DA10+ (5,950 bytes, H..~Ru)
- Symbol table: single packed blob at 0x1402F73F5

## GPU Layout (CONFIRMED)

- kind_tex: R=element id (u8), G=physics kind (u8)
- Physics kinds: P_SOLID=1, P_GRAVEL=2, P_POWDER=3, P_LIQUID=4, P_GAS=5
- Special IDs: K_BATTPOS=46, K_BATTNEG=47, K_HG (mercury), K_LAVA

## Hash Map (FUN_1400bbf70)

- 256-capacity hash map with 0x50-stride entries
- Key = byte slice (name), value = ptr+len
- Used for compound lookups and element registration
- Panic at 256 entries: "src/lib.rs" (capacity exceeded)

## Modding Notes

- Element IDs are u8 (0-255), 92 used → ~163 free slots
- Element table is in .rdata (read-only) — modding requires byte-patching or hooking population function
- New elements need: name, desc, symbol, mass, density, flags, and +0x48/+0x4C floats
- The hash map (DAT_140642100) is the runtime registry — can be extended by hooking population
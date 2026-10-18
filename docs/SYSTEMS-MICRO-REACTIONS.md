# Alembic — Systems: Micro-Reactions & Meta

Companion to `SIM-PIPELINE.md`. Covers chemistry/material/solute systems plus the challenge/snapshot meta (23 of 62).

| # | System | @VA | Calls | Role (INFERRED from name + helpers) |
|---|--------|-----|-------|-------------------------------------|
| 11 | organic_maturation | 0x140104BE9 | 3 | organic maturation |
| 12 | glass_etching | 0x140104CEC | 3 | glass etching (HF) |
| 13 | fluorine_hydrolysis | 0x140104DE1 | 34 | F hydrolysis (uses `FUN_1400bbf70`) |
| 14 | anhydride_hydration | 0x1401070C4 | 12 | anhydride hydration |
| 15 | slaking | 0x1401077D0 | 12 | slaking (quicklime) |
| 16 | dry_carbonation | 0x140107F34 | 7 | dry carbonation |
| 17 | neat_acid_meets_water | 0x140108811 | 39 | acid dilution heat |
| 18 | nitrogen_oxide_chemistry | 0x14010A6B9 | 11 | NOx chemistry |
| 23 | halogen_displacement | 0x14010D23B | 20 | halogen displacement |
| 29 | resolve_hot_h_o_charges | 0x14011114C | 4 | H/O charge resolution (uses `FUN_1400E9D10`) |
| 30 | chemical_reactions | 0x140111204 | 7 | generic reaction dispatcher |
| 31 | flush_chem_blast | 0x140111380 | 9 | chem blast flushing |
| 32 | base_neutralization | 0x1401115E9 | 18 | acid+base neutralization |
| 33 | acid_displacement | 0x1401126A1 | 23 | acid displacement |
| 34 | oxidising_attack | 0x140113D11 | 28 | oxidation (3 paths) |
| 35 | alloy_acid_leach | 0x140114EAA | 9 | alloy acid leach |
| 36 | alloy_formation | 0x1401160FA | 8 | alloy formation |
| 37 | dissolve | 0x1401174F2 | 41 | dissolution |
| 38 | diffuse_solute | 0x140118961 | 11 | solute diffusion |
| 39 | carbonic_degassing | 0x140118ED5 | 10 | CO₂ degassing |
| 40 | reactions | 0x140119443 | 4 | secondary reactions |
| 61 | evaluate_challenges | 0x1401379C8 | 4 | challenge evaluation |
| 62 | snapshot | 0x140137B02 | 25 | state snapshot |

Shared helpers: `FUN_1401A63E0/480`, `FUN_140206870`, `FUN_1402CC340`, `FUN_1400BBF70` (compound bookkeeping), `FUN_1400E9D10`, `FUN_1400E9BE0`, `FUN_1400D1F20`, `FUN_14008FC40`, `FUN_14008BDB0`, `FUN_1400BC6A0`, `FUN_1400BCB50`, `FUN_14009CA80`, `FUN_14009C7F0`, `FUN_1400A7720`, `FUN_140090320`, `FUN_140093950`, `FUN_1400939E0`, `FUN_1400988B0`, `FUN_1400927C0`, `FUN_1400F83D0`, `FUN_140081CD0`, `FUN_140082EC0`, `FUN_14008C530`, `FUN_1400BBF70`, `FUN_1400F5DD0`, `FUN_1400F3580`, `FUN_1400F57C0`, `FUN_1400BEB80`, `FUN_1400BEA90`, `FUN_1400C1C00`, `FUN_1400BF830`, `FUN_1400EFB90`, `FUN_1400BC6A0`, `FUN_1400BCB50`, `FUN_14008FC40`, `FUN_14008BDB0`, `FUN_140090320`, `FUN_1400988B0`, `FUN_1400BBF70`, `FUN_1400A7720`, `FUN_14009C7F0`, `FUN_14009CA80`.

Extracted bodies present in `../src/systems/`: `FUN_140081cd0`, `FUN_140082ec0`, `FUN_14008bdb0`, `FUN_14008c530`, `FUN_14008fc40`, `FUN_140090320`, `FUN_1400927c0`, `FUN_140093950`, `FUN_1400939e0`, `FUN_1400988b0`, `FUN_14009c7f0`, `FUN_14009ca80`, `FUN_1400a7720`, `FUN_1400bbf70`, `FUN_1400bc6a0`, `FUN_1400bcb50`, `FUN_1400bea90`, `FUN_1400beb80`, `FUN_1400bf830`, `FUN_1400c1c00`, `FUN_1400e9be0`, `FUN_1400e9d10`, `FUN_1400f3580`, `FUN_1400f5dd0`, `FUN_1400f83d0`, `FUN_1401a63e0`, `FUN_1401a6480`, `FUN_140206870`, `FUN_1402cc340`.

Open: reaction table format (§REACTIONS-COMPOUNDS.md), compound manifest entry layout, challenge definitions (16 contracts), snapshot serialization (see SAVE-FORMAT.md).

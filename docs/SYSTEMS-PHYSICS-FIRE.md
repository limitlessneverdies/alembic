# Alembic — Systems: Physics & Fire

Companion to `SIM-PIPELINE.md`. Covers thermal/combustion/optics/exothermic systems (8 of 62).

| # | System | @VA | Calls | Role (INFERRED from name + helpers) |
|---|--------|-----|-------|-------------------------------------|
| 09 | thermite | 0x140102DA2 | 13 | thermite ignition/reaction |
| 10 | magnesium_burn | 0x140103F46 | 5 | Mg combustion |
| 19 | metal_hydrogen_absorption | 0x14010B28C | 6 | H absorption in metals |
| 20 | cerium_sparks | 0x14010B555 | 3 | Ce spark generation |
| 24 | hg_amalgamation | 0x14010E3CB | 8 | Hg amalgamation |
| 25 | flame_test_emission | 0x14010EF93 | 3 | flame-test spectra |
| 26 | color_fires | 0x14010F44D | 4 | colored fire (uses `FUN_14013DA30`) |
| 27 | thermal | 0x14010F505 | 6 | general thermal diffusion |

Shared helpers: `FUN_1401A63E0/480`, `FUN_140206870`, `FUN_1402CC340`, `FUN_1400988B0`, `FUN_1400FA730`, `FUN_1400F7E40`, `FUN_1400F83D0`, `FUN_14013DA30`.

Extracted bodies present in `../src/systems/`: `FUN_140081cd0`, `FUN_140082ec0`, `FUN_14008bdb0`, `FUN_140090320`, `FUN_1400927c0`, `FUN_140098410`, `FUN_1400988b0`, `FUN_1400a7720`, `FUN_1400bc6a0`, `FUN_1400bcb50`, `FUN_1400fa730`, `FUN_1400f7e40`, `FUN_1400f83d0`, `FUN_14013da30`, `FUN_1401a63e0`, `FUN_1401a6480`, `FUN_140206870`, `FUN_1402bab40`, `FUN_1402bba70`, `FUN_1402b7d70`, `FUN_1402bc050`, `FUN_1402cc340`.

Open: ignition thresholds, flame color palette mapping, thermal conductivity constants — **INFERRED** (live in the extracted helper bodies; not summarized here).

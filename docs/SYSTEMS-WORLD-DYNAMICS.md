# Alembic — Systems: World Dynamics

Companion to `SIM-PIPELINE.md`. Covers the world/energy/nuclear/particle/fluid/spatial/acoustics systems (18 of 62).

| # | System | @VA | Calls | Role (INFERRED from name + helpers) |
|---|--------|-----|-------|-------------------------------------|
| 01 | refresh_presence | 0x1400FE337 | 11 | presence grid refresh (SIMD memset + Vec ops) |
| 02 | compute_energized | 0x1400FE8F3 | 5 | energized-state compute (uses `floorf`, RNG) |
| 03 | joule_heating | 0x1400FED94 | 12 | resistive/Joule heating |
| 04 | tick_arcs | 0x1400FF397 | 27 | electric arc tick (RNG-heavy) |
| 05 | electrolysis | 0x140100D27 | 3 | water electrolysis |
| 06 | tick_nuclear_traces | 0x140100F36 | 37 | nuclear trace propagation (floorf, RNG, `FUN_1402b7d70`/`FUN_1402bc050`) |
| 07 | radioactive_decay | 0x140102206 | 3 | radioactive decay |
| 21 | spark_motion | 0x14010B7BA | 18 | spark particle motion (SIMD memset) |
| 22 | neutron_motion | 0x14010C6AE | 10 | neutron particle motion |
| 41 | roof_mask | 0x140119655 | 196 | roof/enclosure mask (RNG-heavy, `FUN_140145430`, `FUN_14013cbf0`) |
| 42 | particle_movement | 0x140123578 | 12 | falling-sand particle movement |
| 43 | tick_airborne | 0x140123DEC | 25 | airborne (gas) tick |
| 44 | flow_water_pressure | 0x140125D99 | 39 | water pressure flow |
| 45 | flow_water_systems | 0x140127AC9 | 4 | water system flow |
| 46 | compute_atmo_open | 0x140127B82 | 14 | atmospheric openness |
| 47 | update_breach_release | 0x1401285DA | 17 | breach release |
| 59 | absorb_acoustics | 0x1401316A0 | 16 | acoustic absorption (ceilf) |
| 60 | tick_shockwaves | 0x140132B55 | 586 | shockwave propagation (heavy SIMD: `FUN_1402D4F02` x170+, `FUN_1402D4818/831`) |

Shared helpers: `FUN_1401A63E0/480` (QPC timing), `FUN_140206870` (PCG RNG), `FUN_1402CBA90` (SIMD memset), `FUN_1402CC340` (profile Vec), `FUN_1402D4F02` (heavy SIMD kernel).

Extracted helper bodies for this group present in `../src/systems/`: `FUN_1400858e0`, `FUN_140090320`, `FUN_140098410`, `FUN_1400988b0`, `FUN_1400c4360`, `FUN_1400f86f0`, `FUN_1400f93a0`, `FUN_14013cbf0`, `FUN_140145430`, `FUN_14019c670`, `FUN_1401a3c50`, `FUN_1401a63e0`, `FUN_1401a6480`, `FUN_1401c6d90`, `FUN_1401c9f80`, `FUN_1401e80a0`, `FUN_140206870`, `FUN_1402cc040`, `FUN_1402cc1f0`, `FUN_1402cc500`, `FUN_1402cc570`, `FUN_1402cc8f0`, `FUN_1402cca40`, `FUN_1402cdbf0`, `FUN_1402d1400`, `FUN_1402d1c80`, `FUN_1402d4818`, `FUN_1402d4831`, `FUN_1402d4d20`, `FUN_1402d4dc0`, `FUN_1402d4f02` (if extracted).

Open: exact semantics of world+0x2740/0x2744 (ambient floats fed to sim as xmm1/xmm2), world+0x297A mode flag, world+0x28B8 counter (1799) — INFERRED, verify live.

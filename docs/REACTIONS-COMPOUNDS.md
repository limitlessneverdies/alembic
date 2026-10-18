# Alembic — Reactions & Compound Registry

Source: `SPEC.md` §§3,5,6,10,11; `FUN_1400bbf70` registry dossier (REA ev_1beb52eb…); sim pipeline §2 of `SIM-PIPELINE.md`; save loader `FUN_1400c8a80`.

## 1. Compound registry

- Runtime hash map at `DAT_140642100` (base) / `DAT_140642108` (count), capacity 256, entry stride `0x50` (same shape as the element registry — compounds reuse the registry machinery). CONFIRMED from `FUN_1400bbf70` dossier.
- Populated by `FUN_1400bbf70(name_ptr, name_len, desc_ptr, desc_len, …)`.
- Panic at 256 entries: `"src/lib.rs"` (capacity exceeded).
- Compound identity is persisted in v6 saves via the compound manifest; v<6 saves did not record compound identities → "compound identities were not recorded; unrecognised compounds were remapped."
- v6 requires a compound manifest ("v6 save requires a compound manifest").

## 2. Compound struct layout — UNKNOWN

The per-compound entry (80 bytes, `0x50`) layout is **not yet extracted**. Candidate fields (INFERRED from element table parity and save strings): name/desc slices, component element ids, formation conditions, display color. Needs a decompiled `FUN_1400bbf70` body pass (dossier exists; full pseudo-code not captured) and a real save's manifest.

## 3. Reaction passes in the sim (CONFIRMED names + order)

These are the chemistry-relevant systems inside `FUN_1400FDF00` (see `SIM-PIPELINE.md` §2 for full order and addresses):

| # | System | Role (INFERRED from name) |
|---|--------|---|
| 03 | joule_heating | resistive heating |
| 04 | tick_arcs | electric arcs / discharge |
| 05 | electrolysis | water splitting |
| 13 | fluorine_hydrolysis | F + H₂O |
| 14 | anhydride_hydration | oxide + water |
| 15 | slaking | quicklime + water |
| 16 | dry_carbonation | CO₂ + base (dry) |
| 17 | neat_acid_meets_water | acid dilution heat |
| 18 | nitrogen_oxide_chemistry | NOx chain |
| 19 | metal_hydrogen_absorption | H storage in metals |
| 23 | halogen_displacement | halogen redox |
| 24 | hg_amalgamation | Hg alloying |
| 28 | refining | ore → metal |
| 29 | resolve_hot_h_o_charges | H/O charge resolution |
| 30 | chemical_reactions | generic reaction dispatcher |
| 31 | flush_chem_blast | blast flushing |
| 32 | base_neutralization | acid+base |
| 33 | acid_displacement | acid redox |
| 34 | oxidising_attack | oxidation (3 paths: ambient O₂, pure O₂, brine) |
| 35 | alloy_acid_leach | alloy leaching |
| 36 | alloy_formation | alloying |
| 37 | dissolve | dissolution |
| 38 | diffuse_solute | solute diffusion |
| 39 | carbonic_degassing | CO₂ degassing |
| 40 | reactions | secondary reactions |
| 09 | thermite | thermite ignition |
| 10 | magnesium_burn | Mg combustion |
| 20 | cerium_sparks | Ce spark |
| 12 | glass_etching | HF glass etch |
| 11 | organic_maturation | organic chemistry |
| 26 | color_fires | flame colors |
| 25 | flame_test_emission | flame-test spectra |

Each section calls `FUN_140206870` (PCG RNG) for stochastic outcomes and `FUN_1400bbf70`-family helpers for compound bookkeeping.

## 4. Reaction table format — UNKNOWN

No reaction table has been extracted yet. Candidate: a static array in `.rdata` of `{reactant_a, reactant_b, conditions, product_compound_id, energy, …}`. The dispatch in `chemical_reactions` (system 30) presumably iterates it. Locating it: scan `.rdata` for the compound-id range and cross-reference from `FUN_1400bbf70` callers. **Not done.**

## 5. Phenomena (from SPEC.md §11, CONFIRMED names)

Electrolysis, discharge (colored light), oxidation (3 ways), ignition metals (Mg/thermite), detonation (shockwave), nuclear chain reaction, noble gas idling. These map to systems 04/05/06/07/09/10/20/24/34/60.

## 6. Contracts (16, from SPEC.md §10)

Evaporate the Sea, Alloy Foundry, Fireworks, Reclaim the Metal, Neutralize the Spill, Halogen Displacement, Reforestation, Scorched Earth, Remote Ignition, Hydrogen Storage, Going Critical, The Crucible, Jacob's Ladder, Powerhouse, First Light, The Alembic. (Names only; challenge logic in system 61 `evaluate_challenges`.)

## 7. Modding hook

SPEC §14: "Reaction dispatcher — hook to add new reactions", "Compound registration — hook to add new compounds". New compounds require a registry entry (capacity 256) and, for v6 saves, a manifest entry.

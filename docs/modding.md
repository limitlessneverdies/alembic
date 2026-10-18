# Modding Guide

## Modding Route: Flavor 3 — Hook/Loader Mod

Original exe untouched. Loader DLL injects new logic at runtime.

## Element Modding

### Adding New Elements

1. Element IDs are u8 (0-255). 92 currently used, ~163 free.
2. Each element is an 80-byte struct in .rdata:
   - symbol (ptr, len) → packed symbol blob
   - name (ptr, len) → handbook blob
   - desc (ptr, len) → handbook blob
   - atomic_mass (f32), density (f32), float_x (f32), float_y (f32)
   - 16 bytes flags (category, period, group, phase)
3. To add an element: append a new 80-byte entry to the element table in .rdata, OR hook the population function to inject at runtime.
4. New elements need unique IDs (92+), names, descriptions, mass, density, and flags.

### Compound Modding

- Compound registry caps at 256 live compounds
- Compounds are registered via hash map (FUN_1400bbf70)
- New compounds need: name, formula, properties, recipe (input elements + conditions)

### Reaction Modding

- 17-function sim pipeline can be extended
- New reactions need trigger conditions (element A + element B + conditions)
- Reaction effects: temperature change, pressure change, phase change, new element creation

### Tool Modding

- 16 tools currently implemented
- Tool unlock rules are string-based (can be modified)
- New tools need: name, description, unlock condition, implementation

### Asset Modding

- Assets loaded from disk: `assets/logo_sign_clean/sign_atlas.png`, `assets/fonts/`, `assets/audio/music/`
- New textures/fonts/sounds can be added by dropping files in assets/
- Screenshots written as `screenshot_{}.png`

### Shader Modding

- Shader is runtime-templated (GRID_W=__GRID_W__, GRID_H=__GRID_H__)
- New shaders can be loaded from disk
- kind_tex layout: R=element id (u8), G=physics kind (u8)

### Save Format Modding

- v6 format with compound manifest
- New content needs save format understanding
- Migration from older formats supported

### Steam Integration

- Achievement IDs are hardcoded strings — new content can add new achievement strings
- SetAchievement, StoreStats, InitFlat

## Hook Points

1. **Element population function** — hook to inject new elements at startup
2. **Compound registration** — hook to add new compounds
3. **Reaction dispatcher** — hook to add new reactions
4. **Tool dispatcher** — hook to add new tools
5. **Save loader** — hook to handle new save format versions
6. **Render shader loader** — hook to load custom shaders
7. **Asset loader** — hook to load custom assets

## Steam Folder Requirement

The game requires `steam_api64.dll` (hard import) and assets in the install folder. To run/test mods, copy the entire Steam install folder to your machine.
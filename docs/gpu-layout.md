# GPU Layout

## Rendering Pipeline

Alembic renders the simulation grid using OpenGL ES 2.0 (via miniquad 0.4.8). The GPU handles rendering only — simulation runs on CPU.

## Textures

### kind_tex
- R channel: element ID (u8, 0-255)
- G channel: physics kind (u8: 1=solid, 2=gravel, 3=powder, 4=liquid, 5=gas)
- Used by the main render shader to determine per-cell appearance

### Render Shader (embedded GLSL, ~0x1402E2229-0x1402E8xxx)

The render shader is a runtime-templated GLSL string with `__GRID_W__` and `__GRID_H__` placeholders. Key features:

1. **Element ID lookup**: `float k = ki.r * 255.0;` (element id from red channel)
2. **Physics kind lookup**: `float pkind = ki.g * 255.0;` (physics kind from green channel)
3. **Special-cased elements**:
   - K_BATTPOS = 46.0 (battery positive terminal)
   - K_BATTNEG = 47.0 (battery negative terminal)
   - K_HG (mercury — shimmer effect)
   - K_LAVA (lava — pulse effect)
4. **Edge depth shading**: non-metal blocks get edge darkening
5. **Directional AO**: upper neighbors weighted more (buried cells shaded)
6. **Glass/Ice transparency**: alpha blending for transparent materials
7. **Mercury shimmer**: wave animation on mercury surface
8. **Lava pulse**: 1.35× brightness pulse
9. **ONI-style liquid field**: all liquids rendered as continuous field (3×3 neighborhood thresholding)
10. **Battery terminal caps**: special rendering for battery terminals
11. **Specular highlights**: narrow band, hot white shine
12. **Composite bloom + gas**: bloom effect + gas overlay

### Shader Blocks (83 total in .rdata)

The .rdata contains 83 shader text blocks, including:
- Main render shader (element rendering + shading)
- Macroquad default shaders (texture, sprite, vertex)
- Metal shaders (for Metal backend, if available)

### Assets (loaded from disk)

- `assets/logo_sign_clean/sign_atlas.png` — UI atlas
- `assets/fonts/` — NotoSansSC.ttf (CJK) + ProggyClean (macroquad default)
- `assets/audio/music/` — OGG/WAV music tracks
- Screenshots written as `screenshot_{}.png` at runtime

### Grid Dimensions

Grid dimensions are runtime-templated (`__GRID_W__`/`__GRID_H__` placeholders replaced at runtime). The actual grid size is determined at runtime based on window size and settings.
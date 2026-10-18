# Alembic — Tool Implementations (16 tools)

Source: `SPEC.md §9`, binary strings ("Have 5+ different gases", "Dissolve solute into water (make brine)", "Shake window (Shift+drag)"), and decompiled helpers. Individual tool-handler → function mapping is **not yet complete** (see §4) — the handlers live in the decompile dump but have not been labelled per tool.

## 1. Tool list (from SPEC.md, CONFIRMED names)

| # | Tool | Description (SPEC) |
|---|------|---|
| 1 | Place | Circular brush |
| 2 | Heat | Pour heat into/out of brush |
| 3 | Pressure | Spray pressure; Shift for suction |
| 4 | Pipet | Collect and release cells |
| 5 | Prefab | Stamp shapes (boxes, beakers, bowls, circles, lines, batteries, wires) |
| 6 | Mortar & Pestle | Mill loose chunks into powder |
| 7 | Selection | Copy, cut, rotate, flip, paste |
| 8 | Push/Pull | Push without touching, pull without asking |
| 9 | Precision delivery | One droplet at a time |
| 10–16 | (unnamed in SPEC) | SPEC lists 16 tools total; only 9 are named in §9. Remaining 7 are referenced by unlock strings and the tool radial but not individually named in the extracted spec — **UNKNOWN** (likely: Erase, Fill, Inspect/Probe, Wire, Battery, …) |

## 2. Unlock rules (CONFIRMED strings)

- "Have 5+ different gases"
- "Dissolve solute into water (make brine)"
- "Shake window (Shift+drag)"

These gate tool availability in the UI (favorites radial / tool tabs).

## 3. What is verified in code

- Heat brush kernel: `FUN_140041150` (decompiled, body in dump) implements a circular brush over cells: radius loop (`param_5 * param_5`), per-cell `SQRT` falloff, reads `*(byte *)(param_1 + uVar7*4)` (element id), calls `FUN_140008370(element_byte)` to obtain a packed color (`uVar7 = flags | r<<8 | g<<16 | b<<24`) used to scale the applied heat. This is the **Heat** tool's application kernel (INFERRED — function not yet tied to a tool enum, but behaviour matches).
- Generic brush radius/pressure application appears in the same family (`FUN_1400c4360`, `FUN_1400549f0` thunk, `FUN_1402cba90` memset) — used by Place/Pressure.
- Selection/copy/paste use `FUN_1402cb3f0` (panic/memcpy-style) and `thunk_FUN_140191310` (free) for buffer management (INFERRED).
- Prefab stamping uses `FUN_140057040`/`FUN_14005b9f0` (shape helpers, called from the conveyors/spawners code too).

## 4. Open items

- Map each of the 16 tool enums → handler function. The tool dispatcher hook point (SPEC §14) is the entry; enumerate its switch/closure table. **Not done.**
- Mortar & Pestle milling, Pipet collect/release, Push/Pull, Precision delivery kernels — **not individually located.**
- Tool state structs (brush size, prefab dimensions) — **UNKNOWN** layout.
- Undo/redo stack — not observed in extracted code.

## 5. Modding hook

SPEC §14 lists "Tool dispatcher — hook to add new tools" as a hook point. New tools require: an enum entry, a handler closure, an icon asset, and an unlock rule string.

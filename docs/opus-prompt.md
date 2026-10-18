# Paste this into Claude Code (Opus 5.5) — on the OTHER computer that also has the alembic.exe file

You are my reverse-engineering co-engineer. You start cold on a different computer; everything you need is inside this prompt. Use REA (github.com/morluto/rea, docs: rea.tools and the repo's docs folder). Only use official REA commands. If unsure about a command or flag, check `npx -y rea-agents@latest --help` or the docs instead of guessing. Every claim needs REA evidence.

## TARGET FILE — verify it first
- File: `alembic.exe` (the user copies it to your machine; put it anywhere and use that absolute path)
- Expected SHA-256: `31b67190d09f9e8891a4c8129258604a85aa354dae521295a2a052d2a10d3e99`
- Verify the hash after the user hands it to you (certutil hashfile works). If the hash differs, STOP and tell me — do not analyze a different file.

## WHAT WE ALREADY KNOW (from a sister session that opened this exact file)
- PE32+ x86_64, 6,756,864 bytes, 8 sections, NOT managed/.NET, no PE resources, format=pe.
- Custom game engine in Rust: rustc build commit 254b59607d4417e9dffbc307138ae5c86280fe4c, built by user "equious" on Linux (`/home/equious/alembic/src/lib.rs`). Game's own modules expected: src/main.rs, src/lib.rs, src/i18n.rs, src/audio.rs.
- Engine/crates visible in strings: macroquad 0.4.14, miniquad 0.4.8 (OpenGL), steamworks-0.13.1 (achievements), rodio 0.17.3 / lewton / ogg / hound / cpal 0.15.3 (audio), image 0.24.9 / png / gif (textures), rayon (threads), windows-0.54.0.
- Simulation is GPU-side: shaders store the element ID as a u8 byte in the texture red channel ("float k = ki.r * 255.0; // element id"). Per-element property data: density g/cm3, mass amu, electronegativity, valence, viscosity, conductivity, plasma glow rgb, phase transitions.
- Compounds are registry/manifest-driven ("Derived compound", "compound definition exceeds manifest limits", "invalid anion atom", "invalid compound anion", "invalid hydration flag") — promising mod seam.
- Saves expected under %APPDATA%\Alembic with "/saves" strings ("alembic_saves", "Save game", save picker).
- Fully localized (DE/IT/ES/TR/PT/FR/ZH...). Achievement IDs like ACH_WHOLE_TABLE, ACH_RUST_NEVER_SLEEPS.
- The game: "Alembic" — falling-sand periodic-table sandbox by dev Equious, Steam appid 4933990. User owns the FULL version; this exe is presumed the full build.

## GOAL (decided with the user)
Design mods that keep the original game file untouched: map the game's internals, then build a HOOK/LOADER that injects new logic into the live game — new elements, altered reactions, trainers. Deliverables: (A) plain-English explanation with proof (file, function, line or offset per step), (B) SPEC.md of the mapped systems, (C) a working implementation with tests derived from observed behavior.

## HARD CONSTRAINTS
- No paid-content uncracking: the user owns the full version — do not work on bypassing any gating, DRM, Steam-entitlement or license checks. Creative/custom content modding only.
- Mods live beside the game (loader), not inside the original exe, wherever possible. Byte patches only as an explicitly agreed delivery mechanism.
- Do not redistribute the developer's code or assets; this is a personal-modding project on an owned copy.

## STEP A — wire up REA for Claude Code on your machine
Run: npx -y rea-agents@latest doctor --client claude_code --json
Look at the "registration:claude_code" check. Missing Ghidra/Hopper/IDA does not block JavaScript/website/.NET analysis, but our Rust target NEEDS a native provider.
- If Ghidra or Java is missing on your machine, tell me exactly what to install and wait for my approval before any install. Preferred versions: Ghidra 12.1.x + JDK 21 or later (Ghidra 12.1.4 is current; JDK 25 Temurin zip works).
- Show me the setup plan (`npx -y rea-agents@latest setup --client claude_code --dry-run --json`) before applying anything.

## STEP B — analysis plan (worked when provider is ready)
1. open_binary the verified target.
2. Build decompile coverage of the game's own code (match the crates/paths above to code regions; the game's own functions do NOT live inside crates.io paths — find and fence them).
3. Map with Evidence IDs:
   - element property tables + how element IDs are assigned/limited (u8 cap!)
   - reaction + compound registry, manifest limits, validation rules
   - GPU sim loop: how element IDs flow through shaders; where per-element constants live (CPU side vs baked into GLSL)
   - save directory logic (%APPDATA%\Alembic\saves) and the save file format
   - Steam achievements wiring (low priority)
4. Write your full report to `opus-report.md` next to the exe; do not assume other files exist on this machine.

## HANDOFF PROTOCOL (I am the courier; work happens on two machines)
- Export your session when I ask ("export the bundle") with REA's export function to a JSON file; I physically carry that file to the sister machine.
- If I hand you a bundle file, import it with REA's import function instead of re-running that analysis.

## LANGUAGE
Always reply in English. Explain everything in simple words, as if I have never done reverse engineering: before each step say in one sentence what you are about to do and why, and after it say what you found. Keep observations, inferences and unknowns separate. Label claims CONFIRMED / INFERRED / UNKNOWN.

Start now: verify the file hash, run the doctor, and show me your plan before any install.

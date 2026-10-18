# REA-TASK.md

next step: 2

## Answers (Step 1)
- **Target type:** Game / .exe native app
- **Where is it:** `C:\Users\limit\Desktop\alembic.exe`
- **Feature/behavior to understand:** User wants to EDIT, MODIFY and UPGRADE the game (game modding), rather than trace one click; specific mods undecided (asked, unanswered)
- **Engine:** unknown — to be determined from the file itself — maps to option C (explanation with proof -> SPEC.md -> build modified version in ./my-version, tests from observed behavior)

## Findings so far (updated after leak scan + web check)
- Target: `alembic.exe` PE32+ x86_64, 6,756,864 bytes, sha256 31b67190d09f9e8891a4c8129258604a85aa354dae521295a2a052d2a10d3e99 (Evidence: ev_bffcbd44d68be0add0f2ab4a62cd844beea49c1288ca1563a891b07d8761f172, ev_51ffc1447f2cf466335e1838d0bae916623e3f1fef4ae9e7a229c28dc931f653)
- NOT managed (.NET): no CLI directory — classification "not-managed" (observed); no PE resources at all (observed)
- Custom engine, Rust: rustc commit 254b59607d4417e9dffbc307138ae5c86280fe4c, built on Linux by user "equious" (/home/equious/.cargo/...), crate deps visible (cpal-0.15.3 ...), 320+ .rs path strings, LLD-PDB codeview reference "alembic.pdb"
- Save naming strings adjacent: "alembic_" + "…ic_saves" (candidate save dir/file naming) — Level 0 entry point
- Game identified: "Alembic" falling-sand periodic-table sandbox, dev Equious, Steam appid 4933990, released 2026-09-10
- No public source found (GitHub hits are unrelated projects: RareBird15 text-alchemy game, Adobe Alembic scene framework — NOT our target)
- Deep providers unavailable: Ghidra (GHIDRA_INSTALL_DIR unset), IDA unset, Hopper unsupported on win32; host has no Java/JDK
- User goal: wants "whole source code" -> agreed realistic path: extract + SPEC + own rebuilt version (option C)

## Findings 2 — deep string sweep (no install needed)
- Engine identified: macroquad 0.4.14 + miniquad 0.4.8 (OpenGL), rustc build 254b59607d4417e9dffbc307138ae5c86280fe4c, dev path /home/equious/alembic/src/lib.rs; own modules visible: src/main.rs, src/lib.rs, src/i18n.rs, src/audio.rs
- Crates: steamworks-0.13.1 (achievements), rodio 0.17.3/lewton/ogg/hound (audio), image-0.24.9/png/gif, rayon (threads), cpal 0.15.3, macroquad/miniquad, windows-0.54.0
- Sim is GPU-side: element ID stored as u8 byte in texture red channel ("float k = ki.r * 255.0; // element id"); per-element property tables: density g/cm3, mass amu, electronegativity, valence, viscosity, conductivity (partial/strong), plasma glow rgb, phase transitions
- Compounds are registry/manifest-driven: "Derived compound", "compound definition exceeds manifest limits", "invalid anion atom", "invalid compound anion", "invalid hydration flag" -> strong mod seam
- Saves: %APPDATA%\Alembic + /saves strings ("alembic_saves", "Save game", save picker); NOTE: no %APPDATA%\Alembic folder exists yet — game has not been run on this PC
- Achievements IDs: ACH_WHOLE_TABLE, ACH_RUST_NEVER_SLEEPS, ACH_GOING_CRITICAL, ACH_ELECTROLYTE, ACH_NEON_SIGN, ACH_FIRST_CONTACT, ACH_WELL_READ, ACH_ROCK_COLLECTION, etc.
- UI: Elements/Reactions/Phenomena/Tools/Challenges/Favorites/Log codex; challenge names found; fully localized (i18n) to DE/IT/ES/TR/PT/FR/ZH+ ("Full version only", "The demo covers the first stretch of the periodic table")
- DEV flags in strings: "DEV: discovery gating re-enabled", "DEV: all materials unlocked, announcements silenced"
- OPEN QUESTION 1: is the user's copy full version or demo? (affects scope: no paid-content uncracking allowed)
- DECIDED: mod route = flavor 3 (hook/loader; original exe untouched); full rebuild = fallback only
- Opus handoff prompt written: C:\Users\limit\alembic-opus-prompt.md (courier = user)

## Status
- RUN TEST BLOCKER SOLVED: alembic.exe hard-imports steam_api64.dll (import table walk, my observation, 12 imports total); lone Desktop copy cannot launch without it -> instant silent exit, no WER crash events (checked Event Log, none), no %APPDATA%\Alembic created, Steam client not installed on this machine at all
- Element table: 92+/118 chemical element names present case-sensitively (missing: Oganesson; concatenated-blob heuristics may undercount) -> full periodic table shipped, consistent with FULL version
- Achievements: contract challenge IDs found (ACH_CONTRACT_SEA/FOUNDRY/FIREWORKS/RECLAIM/NEUTRALIZE/HALOGEN/REFOREST/SCORCHED/IGNITION/HYDROGEN/CRITICAL/CRUCIBLE/LADDER/POWERHOUSE/FIRSTLIGHT/ALEMBIC + ACH_GOLD_STANDARD, ACH_MELTDOWN, ACH_COMPLETIONIST, ACH_WHOLE_TABLE set) - concatenated, so list is approximate
- PE section map (my raw observation, useful for future patch math): .text 0x400-0x2DDE00 (code ~2.9MB), .rdata 0x2DDE00-0x640600 (~3.4MB, shaders+strings), .data 0x640600-0x643000, .pdata/.gfids/.tls/_RDATA/.reloc; EntryPointRVA 0x2C8D08; NO embedded debug section (alembic.pdb is only an external reference)
- ASKED USER: copy the ENTIRE Steam install folder of Alembic to this PC (contains steam_api64.dll + any data; requirement for running/testing mods here)
- Downloads: installer running in background (rea-tools\install-engines.ps1) — will notify on completion

## Analysis status (run 3)
- Attempt 2 (full overview, no snapshot) -> provider_timeout at list_documents after 330000ms budget; Ghidra headless DID run 334s; no cache left behind
- Key learning: REA budgets an overview request; remedy per docs = SMALLER requests; snapshot mechanism persists analysis across invocations (--snapshot on analyze/function/extract/inspect-native-api verbs), and each per-op run loads-and-UPDATES the snapshot
- Verb format: rea function <path> [address] --snapshot <file> --provider ghidra --format json (+ global --filter-output/--token-limit for paging)
- ONLY known address so far: EntryPointRVA 0x2C8D08 (PE32+, no debug symbols in-file; alembic.pdb absent)
- RUN 4 SUCCESS (exit 0, 917s, after REA_GHIDRA_STARTUP_TIMEOUT_MS=3600000): REA Evidence ev_b8070c0b78c6ec651d33bf37b9c856a7fc23280d1fce3a6a9ca582752de9bc19 = binary_overview: 8269 procedures, 2262 strings, 9 segments, ImageBase 0x140000000, .text VA 0x140001000-0x1402dea00, EntryPoint VA 0x1402C8D08 (RVA 0x2C8D08). Snapshot binding file: C:\Users\limit\rea-tools\alembic.snapshot (7850 bytes; profile digests recorded; entries[] empty — need empirical test whether per-op runs stay cheap)
- Function-entry timing probe RUNNING (function-entry.json + .err + function-entry-status.txt): rea function <exe> 0x1402c8d08 --snapshot --provider ghidra
## Analysis findings (entry chain, Evidence ev_913d6862424c3d7670eee5752de3b8358f763e121d44fc1722415759e505cd26)
- entry @0x1402C8D08: calls FUN_1402c8f5c (175-byte runtime init) then __scrt_common_main_seh @0x1402C8B8C (body 0x1402c8b8c-0x1402c8cb9 + 0x1402c8cd3-0x1402c8d07, 355 bytes, non-contiguous)
- Terminal call at 0x1402c8d15 -> __scrt_common_main_seh (no-return flow; CRT startup machinery); Rust main reachable one hop below CRT
- Per-op cost measured: 1774s (29.5 min) for ONE function pull -> per-op CLI calls uneconomic; mass extract via raw analyzeHeadless as labeled observation is the workhorse (REA still supplies Evidence for key claims)
- Mass extract run 1 failed in 6s: Ghidra headless requires the project DIRECTORY to pre-exist (FileNotFoundException on ghidra-proj). RUN 2 RELAUNCHED with mkdir first (headless2.out/.err + headless2-status.txt)
- Run 2 (2686s, exit 0): import + full auto-analysis SUCCEEDED and was SAVED into project ghidra-proj\AlembicX (reusable via -process -noanalysis); but postScript failed TO COMPILE (Ghidra 12 API: abstract run() no-args, script args via getScriptArgs() — fixed in extractAll.java). Run 3 (-process, 15s) failed once more: return type is extractedFunction, not extractFunction — fixed. Run 4 RUNNING (headless4.*)
- Engine-level reuse unlocked: analyzed program persists in the project dir; future Ghidra scripts run cheap via -process (real equivalent of REA snapshots, working)
- Run 3 (analyze --snapshot rea-tools\alembic.snapshot) RUNNING in background -> analysis3.json/err + analyze3-status.txt
- After snapshot exists: chain narrow ops (entrypoint function extract -> string xrefs -> element property table discovery). MCP restart still preferred for full tool surface (trace_application_feature etc.), CLI is sufficient meanwhile

## Analysis status (runs 3-4)
- Run 2 AND run 3 failed with provider_timeout at operation list_documents, timeout_ms=330000, no snapshot saved; Ghidra headless DOES run (334/335s) but the combined import+analysis+bridge deadline (Ghidra STARTUP budget) is exceeded
- ROOT CAUSE FOUND IN PACKAGE SOURCE (my observation, rea-agents 6.4.0): dist/config/ghidraStartupTimeout.js DEFAULT_GHIDRA_STARTUP_TIMEOUT_MS=330_000 = "absolute deadline for Ghidra import, analysis, bridge, and readiness"; env override REA_GHIDRA_STARTUP_TIMEOUT_MS (positive int up to 2^31-1). Other knobs: REA_GHIDRA_LANGUAGE_ID, REA_GHIDRA_COMPILER_SPEC_ID, REA_GHIDRA_SEED_FILE (potential pre-analyzed DB seed — not used yet)
- Fix applied: setx REA_GHIDRA_STARTUP_TIMEOUT_MS 3600000 (user scope; benefits future MCP server too) + injected in run-4 process env
- Run 4 RUNNING (analysis4.json/err + analyze4-status.txt): analyze --provider ghidra --format json --snapshot C:\Users\limit\rea-tools\alembic.snapshot with 60-min budget
- After success: snapshot = reusable analysis DB; chain narrow ops (rea function/extract with --snapshot)

## Engine status (2026-10-17 evening) [historical]
- Ghidra 12.1.4 installed at C:\Users\limit\rea-tools\ghidra_12.1.4_PUBLIC (sha256 verified vs official ddac49f9...d2d4db) + Temurin JDK 25.0.4.1+1 (sha verified) at C:\Users\limit\rea-tools\jdk\jdk-25.0.4.1+1
- User env vars set (registry): GHIDRA_INSTALL_DIR, JAVA_HOME
- rea doctor --client opencode (fresh shell with env injected): ghidra HEALTHY/available, headless + native extractr + Java all pass; registration healthy
- LIVE MCP rea server in this session predates env vars -> still reports ghidra unavailable. REMEDY: restart OpenCode so the MCP server re-spawns with fresh env (or run CLI commands with env injected)
- CLI fallback works right now: rea <cmd> with $env:GHIDRA_INSTALL_DIR / $env:JAVA_HOME set; verbs include analyze, function, extract, capabilities, evidence-export/import
- Session evidence exported: C:\Users\limit\rea-tools\alembic-session-bundle.json (2 records, safe to import after any restart)
- CLI native analysis RUNNING in background: rea analyze alembic.exe --json -> C:\Users\limit\rea-tools\alembic-analysis.json (stderr: analyze-stderr.txt; status line written to analyze-status.txt)
- ATTEMPT 1 FAILED (learned): used wrong flag --json (correct: --format json) plus shell-redirect junk got fed into argv; rea exited 1 with error "Cannot read binary file: rea-tools/alembic-analysis.json" (732-byte error envelope). No analysis performed. RETRY=attempt 2 running: Start-Process rea.cmd analyze <exe> --provider ghidra --format json with proper redirects -> analysis2.json / analysis2.err / analyze2-status.txt

## Next actions
- [x] Kick off CLI native analysis (running in background)
- [ ] USER: restart OpenCode at convenience; new session: say "continue Alembic" — REA-TASK.md resumes; import evidence bundle if needed; verify MCP ghidra provider; proceed Step 4 deep dive
- [ ] USER: copy whole Steam install folder of Alembic to this PC (steam_api64.dll needed to run/test)
- [ ] Step 4 investigation -> Step 5 report -> Step 6 SPEC/loader build (./my-version)

## Content data map (mass extract + string map, 2026-10-17 late)
- Mass extract run 4 SUCCESS: 15.5 MB, all 8269 funcs -> rea-tools\extracted\alembic_all_extracted.c (exit 0, 2357s, via -process -noanalysis on reused project). String bridge: rea-tools\strings-address-map.txt (119871 runs w/ VAs)
- SAVE SYSTEM: FUN_1400c8a80 (@0x1400c8a80) = save loader; strings "save is missing its compound manifest and discoveries" (53), "Legacy save: compound identities were not recorded; unrecognised compounds were remapped.", "v6 save requires a compound manifest", "cell count mismatch"; saves dir name = "alembic_saves" built from hex literals in FUN_14014aff0 (branch "." -> relative ./alembic_saves, else "{}/saves" format)
- REGISTRY CAP: "[registry] flooded ... /256 live" (i18n pool @0x140469BB0) -> 256 live species = u8 ID space CONFIRMED
- GPU: render GLSL embedded @~0x1402E3429: kind_tex R=element-id (k=ki.r*255.0), G=physics kind; P_SOLID=1 P_GRAVEL=2 P_POWDER=3 P_LIQUID=4 P_GAS=5; K_BATTPOS=46.0 K_BATTNEG=47.0 K_HG K_LAVA; runtime-templated (GRID_W=__GRID_W__) — 83 shader text hits, sim location TBD (CPU vs further blocks)
- CONTENT VAs: contracts 0x1402E0DEC + name list 0x1403480ED (16: Evaporate the Sea..The Alembic); tools/unlock rules 0x1402F86EF ("Have 5 or more different gases present at once", "Dissolve a solute into water (make brine)", "Shake the window (Shift+drag)"); compound acids 0x1403455C4 (+ "this save holds more distinct compounds than can be live at once"); element handbook pairs 0x14034DA10 (name+desc H..~Ru); categories 0x14034B47E ("period {} group {} | {} | {} at STP"); phenomena 0x140348CEA (electrolysis/discharge/oxidation/detonation/nuclear chain); i18n 0x140469BB0 (8 languages; Calidum/Humidum; pH; "(gas)/(liquid)/(solid)"; "1-5: pour element"; "+ {} more in the full version" = DEMO upsell string present in FULL binary -> both content sets compiled in, gate is runtime flag)
- Keybinding table via (ptr,len) pairs @raw 0x34BEF8 stride 16 (stamp/rotate/flip/brush/zoom/pan)
- Entry-path fn FUN_140067b20 registers few entries w/ ids 0x12,0x17,0x43,0x54; definition-call schema FUN_1400bbf70(name,len,desc,desc_len, ints..); full element table likely DATA array (slice tables) — NEXT: find element DEFINE struct array, reaction table format, save v6 layout, loader attach points

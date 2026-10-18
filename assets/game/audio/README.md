# Alembic audio assets

Drop audio files here and the engine picks them up automatically. **OGG**
preferred (small); **WAV** also works. Any file that's missing is simply
silent — the game never requires audio.

The engine looks for these exact basenames (`.ogg` tried first, then `.wav`):

## Looping ambience beds (volume tracks world state)
These must be **seamless loops** (no click at the loop point). 2–6 seconds is plenty.

| file | what it is | plays when |
|------|------------|-----------|
| `fire.ogg`     | steady crackling fire / roar     | anything is burning (scales with fire on screen) |
| `boil.ogg`     | rolling boil / bubbling water    | water is boiling (steam present) |
| `electric.ogg` | low electrical hum / buzz        | current is flowing (energized cells) |
| `gas.ogg`      | soft gas hiss / venting          | gases present (CO₂, Cl, H₂…) |
| `geiger.ogg`   | sparse geiger-counter clicks     | radioactive material is decaying (scales with decay rate) |

## One-shot stingers
| file | what it is | plays when |
|------|------------|-----------|
| `boom.ogg`     | deep explosion / impact          | a large chemical detonation |
| `critical.ogg` | bigger, nastier nuclear blast    | a nuclear criticality (falls back to boom.ogg if absent) |
| `chime.ogg`    | bright, pleasant discovery chime | a new element/compound/phenomenon/group/tool unlock |
| `contract.ogg` | warmer success flourish          | a contract is completed (falls back to chime.ogg if absent) |

## How to get them (no recording, no library-wading)
Use a **text-to-SFX generator** — describe it, download it. Suggested prompts
are in the project notes; e.g. for ElevenLabs Sound Effects / Stable Audio:
- fire: "steady crackling campfire, close, seamless loop, no music"
- boil: "rolling boil, bubbling water in a pot, seamless loop"
- electric: "low electrical transformer hum, 60Hz buzz, seamless loop"
- gas: "soft continuous gas hiss escaping a valve, seamless loop"
- geiger: "geiger counter, sparse random clicks, seamless loop"
- boom: "deep cinematic explosion boom with low-end thump, short"
- chime: "bright magical discovery chime, short, sparkly"
- contract: "warm success flourish, short, satisfying"

Mix balance lives in `src/audio.rs` (`BED_GAIN`) and the intensity curve
denominators in `run_game`.

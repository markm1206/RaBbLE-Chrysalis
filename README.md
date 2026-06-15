# RaBbLE-Chrysalis

Genesis archive and reliquary for the RaBbLE Collective. Where ideas go when they've been outgrown or integrated — frozen in amber, preserved for reference. These branches likely hold useful insights and important Collective history even if they no longer run.

Chrysalis holds three kinds of things:

- **Genesis code** — the earliest RaBbLE prototypes, before the Collective existed: animated faces, entropy engines, intelligence servers, WebOS experiments. These predate the Grimoire, the Pulse Protocol, and the entity model.
- **Reliquary — OS** — sealed snapshots of RaBbLE-OS development eras, each representing a distinct phase of the substrate's evolution.
- **Reliquary — World** — (incoming) sealed World/web branches as the site evolves through episodes.

Nothing here is current. Nothing here is meant to evolve. If something gets extracted and revived, it moves to an active member repo. Chrysalis stays amber.

---

## Genesis Code (main branch)

The `main` branch holds readable snapshots of the genesis projects. Full git history for each lives in the corresponding `archive/` branch.

```
Python-Xperiments/
  RaBbLE.py/       — Animated face frontend + LLM/speech-to-text integration (Python/pygame)
                     The first thing that looked like RaBbLE. Pre-Collective.
  RaBbLE-Server/   — Intelligence microservices harness + Railway deploy scripts
                     First server-side intelligence architecture. Pre-Collective.

JS-Xperiments/
  WebOS/           — RaBbLE Simple WebOS + 3D holographic renderer (RabbleJS v0.0.1–v0.1.1)
                     RaBbLE as a web operating system concept. Pre-Collective.
  NeBuLA-JS/       — NeBuLA rendering engine, BaBbLE command system, entropy visualizations
                     Direct ancestor of RaBbLE-NeBuLA. Early Collective era.
```

---

## Branch Map

### Genesis archive — pre-Collective experiments

Full git histories imported from origin repos when the Collective was founded.

| Branch | What it preserves | Origin repo |
|---|---|---|
| `archive/rabble-collective` | RaBbLE-Collective v0 scaffold — the Collective's own genesis | `markm1206/RaBbLE-Collective` |
| `archive/rabble-py-main` | RaBbLE.py — animated face + LLM/transcription agent, full history | `markm1206/RaBbLE.py` |
| `archive/rabble-py-speech-to-text` | RaBbLE.py speech-to-text development branch | `markm1206/RaBbLE.py` |
| `archive/raBbLE-server` | Intelligence server microservices harness | `markm1206/RaBbLE-Xperimental` |
| `archive/rabble-js` | RabbleJS WebOS + holographic renderer | `markm1206/RaBbLE-Xperimental` |
| `archive/nebula-main` | NeBuLA-JS main — entity renderer origin | `markm1206/RaBbLE-NeBuLA-JS` |
| `archive/nebula-RaBbLE-dev` | NeBuLA RaBbLE dev branch | `markm1206/RaBbLE-NeBuLA-JS` |
| `archive/nebula-BaBbLE-dev` | NeBuLA BaBbLE dev — entity + command system | `markm1206/RaBbLE-NeBuLA-JS` |

### Reliquary — RaBbLE-OS

Each branch is a sealed era from RaBbLE-OS. The tip commit is always `%RELIQUARY_SEALED%`. Archived here so RaBbLE-OS stays clean; full context lives in each branch's history.

| Branch | What it preserves | Era |
|---|---|---|
| `reliquary/os/episode-I-substrate` | Episode 1 OS scaffolding: Ansible roles, config stack, shell, dotctl, control-plane. The foundation layer before New-Horizons diverged. | S80–S92 |
| `reliquary/os/ep1-preclean` | Pre-EP1 cleanup snapshot — last stable state before Episode 1 hardening pass | pre-S85 |
| `reliquary/os/os-dev-bootstrap` | OS dev bootstrap era — first Ansible scaffolding and Grimoire integration | pre-S70 |
| `reliquary/os/legacy-bootstrap` | Fedora 43 dev bootstrap — RaBbLE-dev-fedora43 era, early netinstall approach | pre-S70 |
| `reliquary/os/grimoire-expansion` | Grimoire expansion era — RaBbLE-Dev-Testing, Grimoire-in-OS experiments | pre-S60 |
| `reliquary/os/grimoire-seed` | Grimoire seed era — RaBbLE-Dev-Clean, first Grimoire integration | pre-S60 |
| `reliquary/os/babble-embryo` | BaBbLE-dev era — OS state during early BaBbLE intake experiments | pre-S50 |

---

## How Things End Up Here

**From active member repos:** When a development era in RaBbLE-OS (or any member) is superseded, the branch is imported via temp remote and a `%RELIQUARY_SEALED%` commit is added at the tip. The branch is then deleted from the source repo — Chrysalis is its permanent address.

**Genesis projects:** Imported once at Collective founding. Origin repos are archived on GitHub. They don't change.

**Seal ceremony:** A branch lands here when its work has been:
- Fully integrated into a successor branch or member
- Superseded by a new architectural approach
- Explored far enough to understand the idea, even if not shipped

Sealed branches receive a final commit: `archive ~ reliquary >> [name] sealed — reference only // %RELIQUARY_SEALED%`

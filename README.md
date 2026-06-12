# RaBbLE-Chrysalis

Genesis archive and reliquary for the RaBbLE Collective. This is where the pre-Collective experiments live — frozen in amber, preserved for reference, not meant to run.

Chrysalis holds two kinds of things:

- **Genesis code** — the earliest RaBbLE prototypes, before the Collective existed: animated faces, entropy engines, intelligence servers, WebOS experiments.
- **Reliquary branches** — frozen branch snapshots from active member repos, sealed when their development line ended. They're here so the active repos stay clean.

Nothing here is current. Nothing here is meant to evolve. If something gets extracted and revived, it moves to an active member repo. Chrysalis stays amber.

---

## Genesis Code (dev branch)

```
Python-Xperiments/
  RaBbLE.py/       — Animated face frontend + LLM/speech-to-text integration (Python/pygame)
  RaBbLE-Server/   — Intelligence microservices harness + Railway deploy scripts

JS-Xperiments/
  WebOS/           — RaBbLE Simple WebOS + 3D holographic renderer (RabbleJS v0.0.1–v0.1.1)
  NeBuLA-JS/       — NeBuLA rendering engine, BaBbLE command system, entropy visualizations
```

---

## Origins

| Project | Origin repo | Archive branch |
|---------|-------------|----------------|
| `Python-Xperiments/RaBbLE.py` | `markm1206/RaBbLE.py` | `archive/rabble-py-main` |
| `Python-Xperiments/RaBbLE-Server` | `markm1206/RaBbLE-Xperimental` | `archive/raBbLE-server` |
| `JS-Xperiments/WebOS` | `markm1206/RaBbLE-Xperimental` | `archive/rabble-js` |
| `JS-Xperiments/NeBuLA-JS` | `markm1206/RaBbLE-NeBuLA-JS` | `archive/nebula-*` |

True dev history for each project lives in the corresponding `archive/` branch. The code in `dev` is a readable snapshot.

---

## Branches

### Genesis archive (pre-Collective experiments)

| Branch | Purpose |
|--------|---------|
| `main` | Orientation and branch map |
| `dev` | All genesis code — readable snapshot |
| `archive/rabble-collective` | RaBbLE-Collective v0 scaffold |
| `archive/rabble-py-main` | RaBbLE.py full git history |
| `archive/rabble-py-speech-to-text` | RaBbLE.py speech branch |
| `archive/raBbLE-server` | Intelligence server origin |
| `archive/rabble-js` | RabbleJS WebOS origin |
| `archive/nebula-main` | NeBuLA-JS main |
| `archive/nebula-RaBbLE-dev` | NeBuLA RaBbLE dev |
| `archive/nebula-BaBbLE-dev` | NeBuLA BaBbLE dev |

### Reliquary — RaBbLE-OS (sealed branch snapshots)

| Branch | Origin branch in RaBbLE-OS | Sealed state |
|--------|---------------------------|--------------|
| `reliquary/os/babble-embryo` | `reliquary/babble-embryo` | BaBbLE-dev era |
| `reliquary/os/ep1-preclean` | `reliquary/ep1-preclean` | Pre-EP1 cleanup snapshot |
| `reliquary/os/grimoire-expansion` | `reliquary/grimoire-expansion` | Grimoire expansion era |
| `reliquary/os/grimoire-seed` | `reliquary/grimoire-seed` | Grimoire seed era |
| `reliquary/os/legacy-bootstrap` | `reliquary/legacy-bootstrap` | Fedora 43 dev bootstrap |
| `reliquary/os/os-dev-bootstrap` | `reliquary/os-dev-bootstrap` | OS dev bootstrap era |

# AGENT.md — RaBbLE-Chrysalis

> Genesis archive and reliquary for the RaBbLE Collective.
> Read-only by intent. Nothing here is current. Nothing here runs.

---

## What This Repo Is

Chrysalis holds the genesis code and reliquary branch snapshots that show where RaBbLE came from — ideas outgrown or integrated, preserved for their history and insights. Three kinds of things live here:

**Genesis code** (on `main`): The pre-Collective experiments — Python animated faces, entropy visualization engines, WebOS prototypes, intelligence servers. Readable snapshots frozen at the moment the Collective took over.

**Reliquary — OS branches**: Sealed snapshots of RaBbLE-OS development eras, each representing a phase of the substrate's evolution. Prefixed `reliquary/os/`.

**Reliquary — other members** (incoming): As World, sCoRE, and other members evolve through episodes, superseded branch eras will be sealed here.

---

## This Repo's Job

One job only: **preserve the past so active repos don't have to carry it.**

- Never add new features or code here
- Never merge reliquary branches into dev or main
- If something gets extracted and revived, it moves to an active member repo; Chrysalis keeps its frozen copy
- New reliquary branches can be added as other member repos seal development lines

---

## Orientation

```bash
# Genesis code snapshot
git checkout main && ls

# Full git history for a genesis project
git checkout archive/rabble-py-main

# RaBbLE-OS sealed branch snapshots
git branch -a | grep reliquary/os/
```

---

## Branches

See `README.md` for the full branch map and provenance table.

- `main` — genesis code snapshot + orientation and branch map
- `archive/*` — full git histories from pre-Collective origin repos
- `reliquary/os/*` — sealed RaBbLE-OS development era snapshots

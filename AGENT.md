# AGENT.md — RaBbLE-Chrysalis

> Genesis archive and reliquary for the RaBbLE Collective.
> Read-only by intent. Nothing here is current. Nothing here runs.

---

## What This Repo Is

Chrysalis holds the genesis code and reliquary branch snapshots that show where RaBbLE came from. Two kinds of things live here:

**Genesis code** (on `dev`): The pre-Collective experiments — Python animated faces, entropy visualization engines, WebOS prototypes, intelligence servers. These are readable snapshots, frozen at the moment the Collective took over active development.

**Reliquary branches**: Sealed branch snapshots migrated from active member repos when their development line ended. Moved here so RaBbLE-OS and other members stay clean. Prefixed `reliquary/<member>/`.

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
git checkout dev && ls

# Full git history for a genesis project
git checkout archive/rabble-py-main

# RaBbLE-OS sealed branch snapshots
git branch -a | grep reliquary/os/
```

---

## Branches

See `README.md` for the full branch map and provenance table.

- `main` — orientation and branch map
- `dev` — all genesis code
- `archive/*` — full git histories from pre-Collective origin repos
- `reliquary/os/*` — sealed RaBbLE-OS development snapshots

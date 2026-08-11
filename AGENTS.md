# AGENTS.md — 1c-platform-tools

## Purpose

This repository is the canonical knowledge base for **platform-level 1C:Enterprise 8.3 tools**.
It is **not** a repository for one specific configuration.

Current focus starts with:
- Developer Tools subsystem (RDT1C / «Инструменты разработчика»)
- Object Explorer / `Ис()` / `Исследовать()`

## Repository roles

- `docs/` — canonical promoted knowledge.
- `sessions/` — append-only raw session artifacts and handoff state.
- `adr/` — architectural decisions.
- `scripts/` — helper automation for session lifecycle.

Do not mix these roles.

## Scope rules

1. Put here only platform-level or tool-level knowledge.
2. Do not store configuration-specific fix implementation details here if they belong to `*-devlab` repositories.
3. If a finding was discovered inside a configuration repo but is reusable at platform/tool level, promote the finding here and leave only a link in the source repo.
4. Governance rules belong to `github-playbook`, not here.

## Versioning rules

1. Do **not** create `versions/` folders.
2. Do **not** encode platform version in top-level folder names.
3. Store version context in YAML frontmatter:
   - `platform_verified_on`
   - `rdt_version`
   - `verification`
   - `status`
   - `discarded`
4. Use git tags only as immutable repo snapshots, not as active documentation branches.

## Verification scale

Every behavioral claim about a tool must have a verification status:
- `hypothesis` — idea only, not checked.
- `observed` — seen once in one environment.
- `reproduced` — reproduced intentionally in controlled conditions.
- `externally-confirmed` — confirmed by external source(s), for example official page, issue tracker, maintainer note, or repeatable public evidence.

Do not upgrade a status without evidence.

## Forbidden wording

Do not write statements like:
- “ИР всегда …”
- “Работает на всех версиях …”
- “Поддерживается везде …”
- “Точно связано с платформой …”

unless the page explicitly carries enough evidence for `externally-confirmed`.

## Context restoration protocol

At the start of a new thread/session, read in this exact order:

1. `README.md`
2. Latest relevant ADR(s) in `adr/`
3. `sessions/HANDOFF.md`
4. Relevant page under `docs/tools/<tool>/...`
5. Latest raw session note linked from `sessions/HANDOFF.md`

After reading, answer with this marker in the working draft or first internal note:

`[SYSTEM: CONTEXT LOADED]`

## Session discipline

1. `sessions/HANDOFF.md` is the **single mutable handoff file**.
2. Historical session notes are append-only; do not silently rewrite history.
3. If a hypothesis is disproved, keep it and add it to `discarded:` or the session note instead of deleting traces.
4. Promote only cleaned, stable knowledge into `docs/`.
5. Raw notes remain raw even if messy.

## Handoff slots

Every session handoff must keep these slots:
- Goal
- Verified state
- Decisions locked
- Constraints
- First action
- Last promoted artifacts
- Last raw session

Do not replace this structure with freeform prose.

## Tool-first docs structure

Default canonical path:
- `docs/tools/<tool-slug>/`

Recommended internal split when content appears:
- `reference/`
- `how-to/`
- `explanation/`
- `tutorials/`

Create folders only when the first page of that type appears.
Do not create empty structure for appearance only.

## Obsidian bridge

Obsidian is a working knowledge environment, not the canonical public source.
Use the same metadata vocabulary when possible:
- `status`
- `promoted_to`
- `platform_verified_on`
- `rdt_version`
- `verification`
- `discarded`

Recommended flow:
1. Capture rough notes in Obsidian or session raw note.
2. Distill stable result.
3. Promote to `docs/`.
4. Update `sessions/HANDOFF.md`.

## Search hints

Useful retrospective commands:
- `git log -S "term" -- .`
- `git grep "term" docs sessions adr`

Prefer search before adding new pages to avoid duplicates.

## Writing rules

1. Keep pages concise and testable.
2. Separate observation from explanation.
3. Always mention environment when behavior matters:
   - platform version
   - RDT1C version
   - DB mode if relevant
   - configuration context if relevant
4. Use Russian for domain content by default.
5. Use English only when mirroring code symbols, filenames, or external terminology.

## Promotion rules

A page can be promoted into `docs/` when:
1. It has a clear scope.
2. It has frontmatter.
3. It has at least one explicit verification status.
4. It names the environment of observation when relevant.
5. It does not contradict locked ADRs.

## Non-goals

- This repo is not a dump of daily thoughts.
- This repo is not a replacement for configuration-specific repos.
- This repo is not a copy of `github-playbook`.
- This repo is not a place for unbounded speculative claims.

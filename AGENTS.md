# Plant Care Guide — Codex Entry Instructions

Shared project context lives in:
- `docs/context.md`

Read that file first for the domain constraints, irrigation model, and data/document
layering rules.

For current-season operational context, also check the active season journal when
it exists (for example, `notes/2026_journal.md`) before answering timing,
catch-up, or "what already happened?" questions.

## Codex Workflow
- Run `make verify` before reporting completion.
- If generated tables may have changed, run `make generate` then `make verify`.
- Do not hand-edit `content/generated/plant_data.typ`.

## Codex-Focused Priorities
- Favor minimal, targeted edits to the correct layer (`data/`, `notes/`, or `content/`).
- Keep `data/plants.toml` as the canonical plant roster/order.
- Put dated records of work actually performed (fertilizer applied, irrigation
  changes made, inspections completed, pruning/planting done) in the active
  season journal (`notes/2026_journal.md` for 2026), not in topic rationale files.
- Keep recommendations specific to this property, never generic.
- Treat `content/` + PDF as the product output; treat `notes/` as internal rationale.
- Treat `notes/research/` audit artifacts as temporary unless an active audit is in progress.
- When the user reports completed work or explicit observations, capture those
  facts in the active season journal under `notes/` rather than changing canonical
  `data/` or product `content/`, unless the guidance itself needs to change.

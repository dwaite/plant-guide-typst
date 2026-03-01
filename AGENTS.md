# Plant Care Guide — Codex Entry Instructions

Shared project context lives in:
- `docs/context.md`

Read that file first for the domain constraints, irrigation model, and data/document
layering rules.

## Codex Workflow
- Run `make verify` before reporting completion.
- If generated tables may have changed, run `make generate` then `make verify`.
- Do not hand-edit `content/generated/plant_data.typ`.

## Codex-Focused Priorities
- Favor minimal, targeted edits to the correct layer (`data/`, `notes/`, or `content/`).
- Keep `data/plants.toml` as the canonical plant roster/order.
- Keep recommendations specific to this property, never generic.
- Treat `content/` + PDF as the product output; treat `notes/` as internal rationale.
- Treat `notes/research/` audit artifacts as temporary unless an active audit is in progress.

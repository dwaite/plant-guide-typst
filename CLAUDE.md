# Plant Care Guide — Claude Entry Instructions

Shared project context lives in:
- `docs/context.md`

Read that file first for property constraints, irrigation rules, file roles, and
validation requirements.

## Claude-Specific Reminders
- Prefer `make` targets over raw commands (`make build`, `make watch`, `make verify`).
- Do not hand-edit `content/generated/plant_data.typ`; use `make generate`.
- Keep recommendations tailored to this property and avoid generic gardening advice.
- If a factual value changes, update `data/plants.toml` and then reconcile notes/doc.

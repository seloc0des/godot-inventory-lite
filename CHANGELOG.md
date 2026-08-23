# Changelog

## 1.3.0 (2026-08-22)

- Engine floor moves to Godot 4.5. The project and the plugin description both
  said 4.3 before, which no longer matched the code.
- The addon and its docs now say selodev throughout. The old CindieForge name
  was still in the README and the upgrade notes after the rebrand.

## 1.2.0 — 2026-07-24

One-click no-code setup.

- New **Inventory · Setup** panel (the first dock tab): pick the outcome you want → **Apply** → the Lite component is added to your scene, baked in and re-editable.
- Pro unlocks the full no-code wiring — gameplay triggers, bound UI, and cross-system hooks.

## 1.1.0 — 2026-07-24

No-code authoring dock.

- New editor dock: author `ItemLite` items through a UI panel — create, edit, duplicate, delete, no `.tres` hand-editing. (The Pro tier adds every field, one-click scene wiring, and the `EventTrigger` node.)

## 1.0.0 — 2026-06-01

Initial release.

- `ItemLite` Resource — id, name, description, icon, category, max_stack, metadata.
- `InventoryLite` Node — add_item, remove_item, has_item, count_item, clear, snapshot/restore.
- Capacity in slot count. Stacks merge by id and respect `max_stack`.
- Signals: `contents_changed`, `item_added`, `item_removed`, `slot_full`.
- Demo: 3 items, capacity 6, +1 / -1 buttons, live list.

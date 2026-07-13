# Changelog

## 1.0.0 — 2026-06-01

Initial release.

- `ItemLite` Resource — id, name, description, icon, category, max_stack, metadata.
- `InventoryLite` Node — add_item, remove_item, has_item, count_item, clear, snapshot/restore.
- Capacity in slot count. Stacks merge by id and respect `max_stack`.
- Signals: `contents_changed`, `item_added`, `item_removed`, `slot_full`.
- Demo: 3 items, capacity 6, +1 / -1 buttons, live list.

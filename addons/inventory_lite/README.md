# Inventory — Lite

**FREE.** Single-container item inventory for Godot 4.5+. Pure GDScript. MIT.

The working core of the [selodev Inventory addon](docs/upgrade.md). One `InventoryLite` Node per character. Items are `ItemLite` Resources. Stacks merge by id, respect `max_stack`, and fail gracefully when capacity is exceeded.

## 5-minute install

1. Copy `addons/inventory_lite/` into your project's `addons/` folder.
2. Project → Project Settings → Plugins → enable **Inventory — Lite**.
3. Drop an `InventoryLite` node on your player. Set `capacity`.
4. Create `ItemLite` Resources for each item (Inspector or factory script).
5. `inventory.add_item(item, n)`, `inventory.remove_item(item, n)`, `inventory.has_item(item, n)`.

```gdscript
var leftover := inventory.add_item(apple_resource, 5)  # returns what didn't fit
inventory.has_item(sword_resource)                     # bool
inventory.count_item(potion_resource)                  # int
inventory.snapshot()                                   # for custom save systems
```

## What's missing (and why)

| Feature | Tier |
|---|---|
| Weight limits + category gating | Pro |
| Drop-in `InventoryUI` grid + list views | Pro |
| Drag-and-drop slots | Pro |
| `HotbarUI` | Pro |
| Per-item tooltips | Pro |
| `InventoryTheme` Resource (colors, rarity tints) | Pro |
| Save-contract auto-join | Pro |
| Shared `Events` autoload (cross-system integration) | Pro |

See [docs/upgrade.md](docs/upgrade.md).

## License

MIT.


---

## Part of a family

The free Lite tier of one system in a set of Godot 4 RPG systems built to
interoperate (shared item + save contracts) — each also works fully standalone.

**Free tiers — try before you buy:**

- [Inventory Lite](https://github.com/seloc0des/godot-inventory-lite) — item slots, stack merging, capacity
- [Equipment Lite](https://github.com/seloc0des/godot-equipment-lite) — 4-slot gear manager
- [Save/Load Lite](https://github.com/seloc0des/godot-save-load-lite) — single-slot JSON persistence
- [Crafting Lite](https://github.com/seloc0des/godot-crafting-lite) — shapeless instant recipes
- [Quests Lite](https://github.com/seloc0des/godot-quests-lite) — COLLECT + KILL quests
- [Stats/Skills Lite](https://github.com/seloc0des/godot-stats-skills-lite) — stat aggregator
- [Vendor Lite](https://github.com/seloc0des/godot-vendor-lite) — single fixed-currency shop
- [Settings + Menu System](https://github.com/seloc0des/godot-settings-menus) — complete, free, no paid tier

**Full versions** — drop-in UI, weight/categories, timed crafting, restock & currencies,
save-aware cross-system integration, and more — are on itch.io:
**https://selodev.itch.io**

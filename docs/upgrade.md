# Upgrade to Inventory (Pro)

Inventory — Lite covers "stack items in slots." The Pro tier adds production-grade features for shipped games.

## What Pro adds

- **Weight limits + category gating.** Items have weight; inventories have a max weight and allowed-category list.
- **`InventorySettings` Resource.** Author capacity, weight limit, allowed categories, stack policy in one Resource.
- **`InventoryTheme` Resource.** Slot size, columns, colors, rarity tints — re-skin every inventory in one swap.
- **`InventoryUI` Control.** Drop-in grid + list views with reactive bindings.
- **`ItemSlot` drag-and-drop.** Move stacks between inventories. Split with shift-drag.
- **`HotbarUI`.** Quick-access slots wired to the same inventory.
- **Per-item tooltips.** Description, rarity, mods, weight, category.
- **Save-contract auto-join.** Inventory state lives in the Save addon's payload automatically.
- **Shared `Events` autoload.** `item_acquired`, `item_removed`, `item_used` — picked up by Quests, Crafting, Vendor, Loot for cross-system integration.

## Moving from Lite

The full version installs next to the Lite, in its own folder, and both run in the same project, so you can move over one piece at a time. It isn't a drop-in replacement: the class names differ, and so do some method names.

`InventoryLite` becomes `InventoryComponent`. `add_item`, `remove_item`, `has_item`, `count_item`, `clear` and `slot_count` keep their names. `snapshot()` and `restore()` don't exist in the full version, which saves through the Save / Load contract instead. Your `ItemLite.tres` files stay Lite resources, so re-create them as the full `ItemResource`. All seven fields have the same names, so it's a matter of copying the values across.

## Where to buy

The full version is on itch.io: **https://selodev.itch.io**.

## License

MIT.

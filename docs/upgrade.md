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

## Migration from Lite

Both tiers use the same `id` / `name` / `category` / `max_stack` field names on the item Resource — drop your `ItemLite.tres` files into the Pro project and they upgrade as-is. `add_item`, `remove_item`, `has_item`, `count_item` carry the same signatures. The migration is a class-name swap and an enable-plugin step.

## Where to buy

The full version is on itch.io — **https://selodev.itch.io**. Both tiers share the
same field names and method signatures, so upgrading is a class-name swap.

## License

MIT.

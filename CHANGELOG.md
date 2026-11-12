# Changelog

## 1.4.5 (2026-10-24)

The bag list gives you the mouse in a third-person game.

- **Opening the bag list frees the mouse in a third-person game.** The orbit camera from Controller
  (Pro) 1.6.0, which holds the mouse for looking around, now lets go of it while the bag list is on
  screen. When you close the list, the next click in the game takes the mouse back. Nothing to set
  up, and games without that camera behave as before.

## 1.4.4 (2026-10-12)

The tabs show their names on Godot 4.5.

- **The Inventory · Setup and Items (Lite) tabs were blank on Godot 4.5.** Their tabs beside the
  Inspector had no title, so "open the Inventory · Setup tab" pointed at nothing. They are named
  when the pack switches on now. Godot 4.7 was not affected.

## 1.4.3 (2026-09-28)

- **The Items (Lite) list shows item names** ("Iron Sword") instead of file names (iron_sword). An
  item with no name still shows its file name, and the list catches up as soon as you press Save.

## 1.4.2 (2026-09-28)

Lists that stay readable, and clearer example items.

- **The Items (Lite) list always shows about five rows**, at any editor scale. At 125% it came out a
  few rows tall. The divider under it still drags.
- **No "invalid UID" warning on the first Play after New item.** Godot hadn't registered the new
  file yet, which put a yellow Debugger badge on screen.
- **Demo items are marked (example)** in the Setup picker.

## 1.4.1 (2026-09-27)

Both tabs fit a default dock.

- **The Setup and authoring tabs fit a default dock.** A tab taller than the dock scrolls, and lists
  show what you just made the next time they open.

## 1.4.0 (2026-09-27)

Inventory you can use without writing code.

- **Pickups with no code.** "A pickup" on the Setup tab gives its item to the player when they
  touch it, with a short message on screen. A full bag leaves it on the ground, and a partial
  fit takes what fits.
- **A bag list opens with I** at the bottom left and shows what's in the bag.
- **New item** on the Setup tab, and three example items in the demo.
- **The Items (Lite) tab shows its fields in the editor.** It was empty there after New and when
  opening a file, because the editor loads these resources as placeholders.
- **New in the Items (Lite) tab names the item** ("New Item", new_item) and opens it in the
  Inspector, and **a rename made in the Inspector survives the tab's Save**. Save used to put the
  old name back.
- **"Player inventory" marks the node as the player**, so the other packs' touch triggers react to
  it.
- **Pressing Play right after Apply includes what it added.** The Setup tab never marked the scene
  as changed, so Play ran the saved version without it.
- **Saving in the Items tab keeps your scenes linked to the file** instead of leaving them an
  orphaned copy that the scene then saved inside itself.
- **Nodes the Setup tab adds get readable names.** A second one under the same parent is
  called something like `UILayer2`, instead of a generated name full of `@` signs.
- **Long status messages in the authoring tab wrap** instead of running off the edge of the dock.

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

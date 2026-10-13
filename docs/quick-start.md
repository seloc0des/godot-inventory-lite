# Quick Start

Everything here happens in the **Inventory · Setup** tab. Code is optional, at the bottom.

## 1. Give your player a bag

Select your player node, pick **Player inventory** and press **Apply**.

- The player gets an `InventoryLite` with 24 slots (change **Capacity** in the Inspector) and is marked as the player.
- A bag list goes in the bottom-left corner of the screen. It starts hidden. Press **I** in game to open and close it. It shows one line per slot, such as "Apple x3".
- The tab adds the **inventory** input action on I. If your project already has an `inventory` action, the tab keeps yours and the status line names its key.

## 2. Make items

Pick **A pickup** and press **New item**. The item lands in `res://items` (`new_item.tres`, then `new_item_2.tres`, and so on) with a name filled in, and opens in the Inspector: rename it and pick an icon there. The **Items (Lite)** tab edits the same files, and its **New** makes items the same way. The demo's Apple, Iron Sword and Health Potion are listed after your own items, as examples.

## 3. Put pickups in the level

1. Add the thing that lies on the ground: a Sprite2D, a mesh, or an Area2D/Area3D.
2. Select it, pick **A pickup**, choose the item and the amount, and press **Apply**.
3. It gets a `PickupLite` node. A node that isn't an area also gets a **PickupArea** with a round shape. Resize the shape in the Inspector if it doesn't fit your sprite.

Apply again on the same node to change its item or amount.

## 4. Press Play

Walk into the pickup. The item goes into the bag, a message such as "+1 Apple" shows at the top of the screen, and the pickup disappears. When the bag is full the message says "Bag is full" and the pickup stays. Untick **Show Messages** on the pickup to turn the messages off.

Pickups only react to the node in the "player" group, and your player needs a collision shape to touch them. If the tab warns that nothing is the player, select your player and press **Make the selected node the player**.

## From code (optional)

### Create items

`ItemLite` is a Resource with `id`, `name`, `icon`, `category`, `max_stack`, `metadata`. Create one per item type in the Inspector or in code:

```gdscript
const ItemLite := preload("res://addons/inventory_lite/item_resource.gd")

var apple := ItemLite.new()
apple.id = "apple"
apple.name = "Apple"
apple.max_stack = 99
```

### Add inventory to a character

```gdscript
@onready var inventory: InventoryLite = $InventoryLite

func _ready() -> void:
    inventory.capacity = 20
```

### Use it

```gdscript
inventory.add_item(apple, 5)       # returns leftover (int)
inventory.remove_item(apple, 3)    # returns amount actually removed
inventory.has_item(apple, 1)       # bool
inventory.count_item(apple)        # int
inventory.slots()                  # Array[{item, count}], in slot order
inventory.slot_count()             # current used slots
```

### Listen for changes

```gdscript
inventory.contents_changed.connect(_rebuild_my_ui)
inventory.slot_full.connect(func(item): print("No room for ", item.name))
```

### Save / load

The Lite tier doesn't ship a save contract. Call `snapshot()` / `restore(data)` from your own save system, or pair with **Save / Load (Lite)** and stash the snapshot in your `save_state()`:

```gdscript
func get_save_id() -> String:
    return "player_inventory"

func save_state() -> Dictionary:
    return {"inv": inventory.snapshot()}

func load_state(data: Dictionary) -> void:
    inventory.restore(data.get("inv", []))
```

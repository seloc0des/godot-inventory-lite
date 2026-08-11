# Quick Start

## Create items

`ItemLite` is a Resource with `id`, `name`, `icon`, `category`, `max_stack`, `metadata`. Create one per item type — in the Inspector or via code:

```gdscript
const ItemLite := preload("res://addons/inventory_lite/item_resource.gd")

var apple := ItemLite.new()
apple.id = "apple"
apple.name = "Apple"
apple.max_stack = 99
```

## Add inventory to a character

```gdscript
@onready var inventory: InventoryLite = $InventoryLite

func _ready() -> void:
    inventory.capacity = 20
```

## Use it

```gdscript
inventory.add_item(apple, 5)       # returns leftover (int)
inventory.remove_item(apple, 3)    # returns amount actually removed
inventory.has_item(apple, 1)       # bool
inventory.count_item(apple)        # int
inventory.slots()                  # Array[{item, count}], in slot order
inventory.slot_count()             # current used slots
```

## Listen for changes

```gdscript
inventory.contents_changed.connect(_rebuild_my_ui)
inventory.slot_full.connect(func(item): print("No room for ", item.name))
```

## Save / load

The Lite tier doesn't ship a save contract — call `snapshot()` / `restore(data)` from your own save system, or pair with **Save / Load (Lite)** and stash the snapshot in your `save_state()`:

```gdscript
func get_save_id() -> String:
    return "player_inventory"

func save_state() -> Dictionary:
    return {"inv": inventory.snapshot()}

func load_state(data: Dictionary) -> void:
    inventory.restore(data.get("inv", []))
```

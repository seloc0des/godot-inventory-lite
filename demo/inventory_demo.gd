extends Node

const ItemLiteScript := preload("res://addons/inventory_lite/item_resource.gd")
const InventoryLiteScript := preload("res://addons/inventory_lite/inventory_lite.gd")

var _inv: InventoryLite
var _list: VBoxContainer
var _items: Array


func _ready() -> void:
	var bg := ColorRect.new()
	bg.color = Color(0.10, 0.12, 0.16)
	bg.anchor_right = 1; bg.anchor_bottom = 1
	add_child(bg)

	# Build a few demo items.
	_items = [
		_item("apple", "Apple", 99),
		_item("sword", "Iron Sword", 1),
		_item("potion", "Health Potion", 16),
	]

	_inv = InventoryLiteScript.new()
	_inv.capacity = 6
	add_child(_inv)
	_inv.contents_changed.connect(_rebuild)

	# UI.
	var layer := CanvasLayer.new()
	add_child(layer)

	var title := Label.new()
	title.text = "Inventory — Lite — Demo"
	title.position = Vector2(16, 12)
	title.add_theme_font_size_override("font_size", 16)
	layer.add_child(title)

	var btns := VBoxContainer.new()
	btns.position = Vector2(16, 48)
	btns.add_theme_constant_override("separation", 4)
	layer.add_child(btns)
	for it in _items:
		var b := Button.new()
		b.text = "+1 %s" % String(it.name)
		b.pressed.connect(_inv.add_item.bind(it, 1))
		btns.add_child(b)
	for it in _items:
		var b := Button.new()
		b.text = "-1 %s" % String(it.name)
		b.pressed.connect(_inv.remove_item.bind(it, 1))
		btns.add_child(b)

	var panel := PanelContainer.new()
	panel.position = Vector2(280, 48)
	panel.custom_minimum_size = Vector2(560, 400)
	var sb := StyleBoxFlat.new()
	sb.bg_color = Color(0.04, 0.05, 0.07)
	sb.border_color = Color(0.20, 0.22, 0.28)
	sb.set_border_width_all(1); sb.set_corner_radius_all(4)
	sb.content_margin_left = 12; sb.content_margin_right = 12
	sb.content_margin_top = 12; sb.content_margin_bottom = 12
	panel.add_theme_stylebox_override("panel", sb)
	layer.add_child(panel)

	_list = VBoxContainer.new()
	_list.add_theme_constant_override("separation", 4)
	panel.add_child(_list)

	_rebuild()


func _item(id_: String, name_: String, stack: int) -> Resource:
	var it = ItemLiteScript.new()
	it.id = id_; it.name = name_; it.max_stack = stack
	return it


func _rebuild() -> void:
	for c in _list.get_children():
		c.queue_free()
	var header := Label.new()
	header.text = "Slots (%d / %d):" % [_inv.slot_count(), _inv.capacity]
	header.add_theme_font_size_override("font_size", 14)
	_list.add_child(header)
	for s in _inv.slots():
		var l := Label.new()
		l.text = "  • %s ×%d" % [String(s.item.name), int(s.count)]
		l.add_theme_font_size_override("font_size", 13)
		_list.add_child(l)
	if _inv.slot_count() == 0:
		var empty := Label.new()
		empty.text = "  (empty)"
		empty.modulate = Color(1, 1, 1, 0.5)
		_list.add_child(empty)

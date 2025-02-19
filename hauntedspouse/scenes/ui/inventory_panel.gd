extends PanelContainer

@onready var fire_extinguisher: Button = $MarginContainer/NinePatchRect/HBoxContainer/FireExtinguisher
@onready var first_floor_key: Button = $MarginContainer/NinePatchRect/HBoxContainer/FirstFloorKey
@onready var mop: Button = $MarginContainer/NinePatchRect/HBoxContainer/Mop
@onready var attic_key: Button = $MarginContainer/NinePatchRect/HBoxContainer/AtticKey
@onready var cleansing_book: Button = $MarginContainer/NinePatchRect/HBoxContainer/CleansingBook
@onready var item_label: Label = $MarginContainer/NinePatchRect/ItemLabel

var FireExtinguisher: bool = false
var FirstFloorKey: bool = false
var Mop: bool = false
var AtticKey: bool = false
var CleansingBook: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fire_extinguisher.is_hovered():
		item_label.text = "Fire Extinguisher"
	elif first_floor_key.is_hovered():
		item_label.text = "First Floor Key"
	elif mop.is_hovered():
		item_label.text = "Mop"
	elif attic_key.is_hovered():
		item_label.text = "Attic Key"
	elif cleansing_book.is_hovered():
		item_label.text = "Cleansing Book"
	else:
		item_label.text = ""

	if InventoryManager.inventory.has("FireExtinguisher") and not FireExtinguisher:
		fire_extinguisher.disabled = false
		FireExtinguisher = true

	if InventoryManager.inventory.has("FirstFloorKey") and not FirstFloorKey:
		first_floor_key.disabled = false
		FirstFloorKey = true

	if InventoryManager.inventory.has("Mop") and not Mop:
		mop.disabled = false
		Mop = true

	if InventoryManager.inventory.has("AtticKey") and not AtticKey:
		attic_key.disabled = false
		AtticKey = true
		
	if InventoryManager.inventory.has("CleansingBook") and not CleansingBook:
		cleansing_book.disabled = false
		CleansingBook = true

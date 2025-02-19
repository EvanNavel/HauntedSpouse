extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactible_component: InteractibleComponent = $InteractibleComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactible_component.interactible_activated.connect(on_interactible_activated)
	interactible_component.interactible_deactivated.connect(on_interactible_deactivated)
	collision_layer = 1
	animated_sprite_2d.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func on_interactible_activated() -> void:
	if InventoryManager.inventory.has("FirstFloorKey"):
		animated_sprite_2d.play("open_door")
		collision_layer = 2
	
func on_interactible_deactivated() -> void:
	if InventoryManager.inventory.has("FirstFloorKey"):
		animated_sprite_2d.play("close_door")
		collision_layer = 1

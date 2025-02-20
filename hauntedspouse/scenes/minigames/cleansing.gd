extends Node2D

@onready var ghost_static: Node2D = $GhostStatic
@onready var ghost_static_2: Node2D = $GhostStatic2
@onready var ghost_static_3: Node2D = $GhostStatic3
@onready var ghost_1_sprite: AnimatedSprite2D = $GhostStatic/AnimatedSprite2D
@onready var ghost_2_sprite: AnimatedSprite2D = $GhostStatic2/AnimatedSprite2D
@onready var ghost_3_sprite: AnimatedSprite2D = $GhostStatic3/AnimatedSprite2D

var player_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("interact") and InventoryManager.inventory.has("CleansingBook"):
		ghost_1_sprite.play("GhostPoofDown")
		ghost_2_sprite.play("GhostPoofDown")
		ghost_3_sprite.play("GhostPoofDown")

	if not ghost_3_sprite.is_playing():
		queue_free()


func _on_cleanse_area_body_entered(body: Node2D) -> void:
	if body is Player:
		player_in_area = true
		

func _on_cleanse_area_body_exited(body: Node2D) -> void:
	if body is Player:
		player_in_area = false

extends Window

@onready var margin_container: MarginContainer = $MarginContainer

var sprite_count: int = 0

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	sprite_count = get_sprite_count()
	if sprite_count == 0:
		queue_free()

func get_sprite_count() -> int:
	var num_sprites: int = 0
	for child in margin_container.get_children():
		if child is Sprite2D:
			num_sprites += 1
	return num_sprites

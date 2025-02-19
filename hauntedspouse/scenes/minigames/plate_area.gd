extends Area2D

var mouse_in_area: bool = false
var mouse_moving: bool = false
var count = 0
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var cooldown: Timer = $"../cooldown"
@onready var plate: Sprite2D = $".."

func _process(delta: float) -> void:
	if count == 3:
		plate.queue_free()

	if mouse_in_area and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and cooldown.is_stopped():
		if mouse_moving:
			count += 1
			print(count)
			cooldown.start()

func _on_mouse_entered() -> void:
	mouse_in_area = true
	print("mouse entered")

func _on_mouse_exited() -> void:
	mouse_in_area = false
	mouse_moving = false

func _input(event):
	if event is InputEventMouseMotion:
		mouse_moving = true

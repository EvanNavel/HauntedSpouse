extends Sprite2D

var mouse_in_area: bool = false
var mouse_moving: bool = false
var count = 0

@onready var cooldown: Timer = $cooldown

@export var puddle: Sprite2D
func _process(delta: float) -> void:
	if count == 5:
		puddle.queue_free()

	if mouse_in_area and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and cooldown.is_stopped():
		if mouse_moving:
			count += 1
			if puddle:
				puddle.scale /= 2
			else:
				print("Puddle is not assigned!")
			print(count)
			cooldown.start()

func _input(event):
	if event is InputEventMouseMotion:
		mouse_moving = true


func _on_puddle_area_mouse_entered() -> void:
	mouse_in_area = true
	print("mouse entered")


func _on_puddle_area_mouse_exited() -> void:
	mouse_in_area = false
	mouse_moving = false


func _on_cooldown_timeout() -> void:
	pass # Replace with function body.

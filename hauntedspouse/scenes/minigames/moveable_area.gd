class_name MoveableArea
extends Area2D

var mouse_in_area: bool = false
var mouse_moving: bool = false
var count = 0

func _process(delta: float) -> void:
	if mouse_in_area and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		get_parent().global_position = get_global_mouse_position()

func _on_mouse_entered() -> void:
	mouse_in_area = true
	print("mouse entered")

func _on_mouse_exited() -> void:
	mouse_in_area = false
	mouse_moving = false

func _input(event):
	if event is InputEventMouseMotion:
		mouse_moving = true

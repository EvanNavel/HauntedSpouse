extends Node

@onready var pause_menu = preload("res://scenes/ui/pause_screen.tscn").instantiate()

func _ready():
	add_child(pause_menu)
	pause_menu.hide()

func _input(event):
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			pause_menu._on_resume_pressed()
		else:
			pause_menu.show_pause_menu()
			

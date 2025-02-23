extends Node

@onready var text_box = $TextBox
@onready var pause_menu = preload("res://scenes/ui/pause_screen.tscn").instantiate()

func _ready():
	text_box.show_text(["I wanted to use my wife's spell book to help me clean...", "But something feels off."])
	add_child(pause_menu)
	pause_menu.hide()

func _input(event):
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			pause_menu._on_resume_pressed()
		else:
			pause_menu.show_pause_menu()
			

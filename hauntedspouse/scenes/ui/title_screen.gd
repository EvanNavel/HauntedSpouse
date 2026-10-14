extends Control

@onready var start_button = $VBoxContainer/start_button
@onready var settings_button = $VBoxContainer/settings_button
@onready var quit_button = $VBoxContainer/quit_button

func _ready():
	start_button.pressed.connect(_on_start_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/House/testing/test_first_floor.tscn")
	
func _on_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/settings.tscn")
	

func _on_quit_pressed():
	get_tree().quit()

extends Control

@onready var fullscreen_button = $VBoxContainer/fullscreen_button
@onready var sound_button = $VBoxContainer/volume_button
@onready var back_button = $VBoxContainer/back_button

func _ready():
	fullscreen_button.pressed.connect(_toggle_fullscreen)
	sound_button.pressed.connect(_toggle_sound)
	back_button.pressed.connect(_go_back)

func _toggle_fullscreen():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if not DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN else DisplayServer.WINDOW_MODE_WINDOWED)

func _toggle_sound():
	AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0)) 

func _go_back():

		get_tree().change_scene_to_file("res://scenes/ui/title_screen.tscn")

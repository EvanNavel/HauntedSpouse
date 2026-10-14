extends Control

@onready var resume_button = $VBoxContainer/resume_button
@onready var settings_button = $VBoxContainer/settings_button
@onready var quit_button = $VBoxContainer/quit_button

func _ready():
	#_on_resume_button_pressed.connect(_on_resume_pressed)
	#_on_settings_button_pressed.connect(_on_settings_pressed)
	#_on_quit_button_pressed.connect(_on_quit_pressed)
	resume_button.mouse_filter = Control.MOUSE_FILTER_STOP
	settings_button.mouse_filter = Control.MOUSE_FILTER_STOP
	quit_button.mouse_filter = Control.MOUSE_FILTER_STOP
	set_z_index(2)
	hide()


func show_pause_menu():
	show()
	get_tree().paused = true


func _on_resume_button_pressed() -> void:
	print ("sings pressed")
	get_tree().paused = false
	hide()

func _on_settings_button_pressed() -> void:
	print ("settings pressed")
	get_tree().change_scene_to_file("res://scenes/ui/settings.tscn")


func _on_quit_button_pressed() -> void:
	print ("sq pressed")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/ui/title_screen.tscn")

extends Control
@onready var resume_button = $MarginContainer/VBoxContainer/resume_button
@onready var quit_button = $MarginContainer/VBoxContainer/quit_button

func _ready():
	#_on_resume_button_pressed.connect(_on_resume_pressed)
#	_on_settings_button_pressed.connect(_on_settings_pressed)
#	#_on_quit_button_pressed.connect(_on_quit_pressed)
	resume_button.mouse_filter = Control.MOUSE_FILTER_STOP
	quit_button.mouse_filter = Control.MOUSE_FILTER_STOP
	set_z_index(2)
	hide()


func resume():
	get_tree().paused = false
	
func pause():
	get_tree().paused = true
	print("1")
	get_tree().change_scene_to_file("res://scenes/ui/pause_screen.tscn")
func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()

func _on_resume_button_pressed() -> void:
	resume()
	hide()
	
func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/settings.tscn")
	

func _on_quit_button_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://scenes/ui/title_screen.tscn")
	

func show_pause_menu():
	show()
	get_tree().paused = true
func hide_pause_menu():
	hide()
	get_tree().paused = false
	


#func _on_resume_button_pressed() -> void:
#	print ("sings pressed")
#	get_tree().paused = false
#	hide()

#func _on_settings_button_pressed() -> void:
#	print ("settings pressed")
#	get_tree().change_scene_to_file("res://scenes/ui/settings.tscn")


#func _on_quit_button_pressed() -> void:
#	print ("sq pressed")
#	get_tree().paused = false
#	get_tree().change_scene_to_file("res://scenes/ui/title_screen.tscn")

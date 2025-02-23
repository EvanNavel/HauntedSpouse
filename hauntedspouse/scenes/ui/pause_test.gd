extends PanelContainer

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("escape"):
		show()
		get_tree().paused = true
func _on_quit_button_pressed() -> void:
	print ("sq pressed")
	get_tree().change_scene_to_file("res://scenes/ui/title_screen.tscn")
#
#
func _on_resume_button_pressed() -> void:
	hide()
	get_tree().paused = false

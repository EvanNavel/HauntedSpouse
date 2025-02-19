class_name InteractibleComponent
extends Area2D

signal interactible_activated
signal interactible_deactivated



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		interactible_activated.emit()


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		interactible_deactivated.emit()

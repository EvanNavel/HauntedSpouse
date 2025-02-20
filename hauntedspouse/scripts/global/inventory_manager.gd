extends Node

var rooms_cleansed = 0
var inventory: Dictionary = Dictionary()
var task_string = "Tasks\n"
signal inventory_changed()

func add_collectible(collectible_name: String) -> void:
	inventory.get_or_add(collectible_name)
	
	if inventory[collectible_name] == null:
		inventory[collectible_name] = 1
	else:
		inventory[collectible_name] += 1
	
	print(inventory)
	inventory_changed.emit()

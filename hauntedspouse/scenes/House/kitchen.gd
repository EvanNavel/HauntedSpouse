extends Node2D

@onready var sink_area: Area2D = $SinkArea
@onready var clean_dishes: Window = %CleanDishes
@onready var organize_table: Window = $OrganizeTable
@onready var table_area: Area2D = $TableArea
@onready var firearea: Area2D = $Firearea
@onready var put_out_fire: Node2D = $PutOutFire
@onready var cleansing: Node2D = $Cleansing

var tasks_done: int = 0
var tasks_total: int = 3
var sink_being_freed: bool = false
var table_being_freed: bool = false
var fire_being_freed: bool = false
var room_cleansed: bool = false
var tasks: Array = ["Clean Dishes", "Organize Table"]
var tasks_string: String = "Tasks\nClean Dishes\nOrganize Table"
var player_in_area: bool = false

var player_in_fire_area: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clean_dishes.visible = false
	organize_table.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if player_in_area:
		update_tasks()

	if not room_cleansed:
		if cleansing not in get_children():
			room_cleansed = true
			InventoryManager.rooms_cleansed += 1

	if player_in_fire_area:
		if InventoryManager.inventory.has("FireExtinguisher") and Input.is_action_just_pressed("interact"):
			for child in put_out_fire.get_children():
				if child is Window:
					child.visible = true
			
	if not fire_being_freed:
		if put_out_fire not in get_children():
			fire_being_freed = true
			for child in firearea.get_children():
				if child is StaticBody2D:
					child.queue_free()
			
			player_in_fire_area = false
			firearea.queue_free()
			tasks_done += 1
			

	if not sink_being_freed:
		if clean_dishes not in get_children():
			sink_being_freed = true
			sink_area.queue_free()
			tasks_done += 1
			print("Tasks Done: " + str(tasks_done))
	
	if not table_being_freed:
		if organize_table not in get_children():
			table_being_freed = true
			table_area.queue_free()
			tasks_done += 1
			print("Tasks Done: " + str(tasks_done))

	if tasks_done == tasks_total and not room_cleansed:
		cleansing.visible = true

func _on_sink_area_body_entered(body: Node2D) -> void:
	if body is Player:
		if not sink_being_freed:
			clean_dishes.visible = true


func _on_sink_area_body_exited(body: Node2D) -> void:
	if sink_being_freed:
		return
	if body is Player:
		clean_dishes.visible = false


func _on_table_area_body_entered(body: Node2D) -> void:
	if body is Player:
		if not table_being_freed:
			organize_table.visible = true


func _on_table_area_body_exited(body: Node2D) -> void:
	if table_being_freed:
		return
	if body is Player:
		organize_table.visible = false


func _on_task_area_body_entered(body: Node2D) -> void:
	if body is Player:
		player_in_area = true


func _on_task_area_body_exited(body: Node2D) -> void:
	if body is Player:
		player_in_area = false


func update_tasks() -> void:
	tasks_string = "Tasks Kitchen"
	if not sink_being_freed:
		tasks_string += "\nClean Dishes"
	if not table_being_freed:
		tasks_string += "\nOrganize Table"
	if not fire_being_freed:
		tasks_string += "\nPut Out Fire"
	if tasks_done == tasks_total and room_cleansed == false:
		tasks_string += "\nCleanse Room"
	InventoryManager.task_string = tasks_string


func _on_firearea_body_entered(body: Node2D) -> void:
	if body is Player:
		player_in_fire_area = true


func _on_firearea_body_exited(body: Node2D) -> void:
	if fire_being_freed:
		return

	if body is Player:
		player_in_fire_area = false
		for child in put_out_fire.get_children():
			if child is Window:
				child.visible = false

extends Node2D

@onready var sink_area: Area2D = $SinkArea
@onready var clean_dishes: Window = %CleanDishes
@onready var organize_table: Window = $OrganizeTable
@onready var table_area: Area2D = $TableArea

var tasks_done: int = 0
var tasks_total: int = 2
var sink_being_freed: bool = false
var table_being_freed: bool = false
var tasks: Array = ["Clean Dishes", "Organize Table"]
var tasks_string: String = "Tasks\nClean Dishes\nOrganize Table"
var player_in_area: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clean_dishes.visible = false
	organize_table.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if player_in_area:
		update_tasks()

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

	if tasks_done == tasks_total:
		pass

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
		
	InventoryManager.task_string = tasks_string

extends Node2D

@onready var puddle_area: Area2D = $SinkArea
@onready var mop_water: Window = %MopWater
@onready var waterarea: Area2D = $Waterarea
@onready var cleansing: Node2D = $Cleansing

var tasks_done: int = 0
var tasks_total: int = 1
var puddle_being_freed: bool = false
var room_cleansed: bool = false
var tasks: Array = ["Mop Up Water"]
var tasks_string: String = "Tasks\nMop Up Water"
var player_in_area: bool = false

var player_in_puddle_area: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if player_in_area:
		update_tasks()

	if not room_cleansed:
		if cleansing not in get_children():
			room_cleansed = true
			InventoryManager.rooms_cleansed += 1

	#if player_in_puddle_area:
	#	if InventoryManager.inventory.has("Mop") and Input.is_action_just_pressed("interact"):
	#		for child in put_out_fire.get_children():
	#			if child is Window:
	#				child.visible = true
			
	#if not fire_being_freed:
	#	if put_out_fire not in get_children():
	#		fire_being_freed = true
	#		for child in firearea.get_children():
	#			if child is StaticBody2D:
	#				child.queue_free()
			
	#		player_in_fire_area = false
	#		firearea.queue_free()
	#		tasks_done += 1
			



	#if tasks_done == tasks_total and not room_cleansed:
	#	cleansing.visible = true

func _on_task_area_body_entered(body: Node2D) -> void:
	if body is Player:
		player_in_area = true


func _on_task_area_body_exited(body: Node2D) -> void:
	if body is Player:
		player_in_area = false


func update_tasks() -> void:
	tasks_string = "Tasks Bathroom"
#	if not sink_being_freed:
#		tasks_string += "\nClean Dishes"
#	if not table_being_freed:
#		tasks_string += "\nOrganize Table"
#	if not fire_being_freed:
#		tasks_string += "\nPut Out Fire"
	if tasks_done == tasks_total and room_cleansed == false:
		tasks_string += "\nCleanse Room"
	InventoryManager.task_string = tasks_string

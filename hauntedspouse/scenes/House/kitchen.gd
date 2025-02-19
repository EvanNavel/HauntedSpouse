extends Node2D

@onready var sink_area: Area2D = $SinkArea
@onready var clean_dishes: Window = %CleanDishes

var dishes_clean: bool = false
var tasks_done: int = 0
var tasks_total: int = 1
var sink_being_freed: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clean_dishes.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not sink_being_freed:
		if clean_dishes not in get_children():
			sink_being_freed = true
			sink_area.queue_free()
			tasks_done += 1
			print("Tasks Done: " + str(tasks_done))


func _on_sink_area_body_entered(body: Node2D) -> void:
	if body is Player:
		if not dishes_clean:
			clean_dishes.visible = true

func _on_sink_area_body_exited(body: Node2D) -> void:
	if sink_being_freed:
		return
	clean_dishes.visible = false

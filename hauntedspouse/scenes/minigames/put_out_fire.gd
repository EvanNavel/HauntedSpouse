extends Node2D

var game_finished = false
@onready var moving_fires_screen: Node2D = $Window/MovingFiresScreen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Engine.get_process_frames() % 10 == 0:
		if moving_fires_screen.count == 5:
			game_finished = true
			queue_free()

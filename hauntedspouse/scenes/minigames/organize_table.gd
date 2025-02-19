extends Window

@onready var margin_container: MarginContainer = $MarginContainer
@onready var plate_area: Area2D = $MarginContainer/PlateArea
@onready var plate_area_2: Area2D = $MarginContainer/PlateArea2
@onready var plate_area_3: Area2D = $MarginContainer/PlateArea3
@onready var platearea_1_collision: CollisionShape2D = $MarginContainer/PlateArea/platearea1collision
@onready var platearea_2_collision: CollisionShape2D = $MarginContainer/PlateArea2/platearea2collision
@onready var platearea_3_collision: CollisionShape2D = $MarginContainer/PlateArea3/platearea3collision

var area_count: int = 0
var finished_count:int = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if area_count == finished_count:
		if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			queue_free()

func _on_plate_area_area_entered(area: Area2D) -> void:
	if area is MoveableArea:
		#area.input_pickable = false
		platearea_1_collision.set_deferred("disabled", true)
		area_count += 1

func _on_plate_area_2_area_entered(area: Area2D) -> void:
	if area is MoveableArea:
		#area.input_pickable = false
		platearea_2_collision.set_deferred("disabled", true)
		area_count += 1

func _on_plate_area_3_area_entered(area: Area2D) -> void:
	if area is MoveableArea:
		#area.input_pickable = false
		platearea_3_collision.set_deferred("disabled", true)
		area_count += 1

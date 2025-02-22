extends Sprite2D

@onready var start_position = position
@onready var end_position = start_position + Vector2(0, 20)
var duration = 2.0

func _ready():
	animate_ghost()

func animate_ghost():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)

	# Move down
	tween.tween_property(self, "position", end_position, duration / 2)

	# Move up
	tween.tween_property(self, "position", start_position, duration / 2)

	tween.set_loops()

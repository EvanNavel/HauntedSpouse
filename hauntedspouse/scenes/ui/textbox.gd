extends Control
@export var player: Player

@onready var label = $Label
@onready var next_button = $Button

var dialogue_queue = []
var current_index = 0
var previous_speed: int


func _ready():
	hide()
	next_button.pressed.connect(_on_next_pressed)
	previous_speed = player.speed
	player.speed = 0

	# show intro message after loading in
	await get_tree().create_timer(1.0).timeout
	show_text(["I wanted to use my wife's spell book to help me clean...", "But something feels off."])

func show_text(messages):
	if messages is String:
		dialogue_queue = [messages]
	else:
		dialogue_queue = messages

	current_index = 0
	label.text = dialogue_queue[current_index]
	show()
	modulate = Color(1,1,1,0)
	create_tween().tween_property(self, "modulate", Color(1,1,1,1), 0.5)

func _on_next_pressed():
	current_index += 1

	if current_index < dialogue_queue.size():
		label.text = dialogue_queue[current_index]
	else:
		player.speed = previous_speed
		hide()

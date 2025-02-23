extends Node2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var ghost_static: Node2D = $GhostStatic
@onready var animated_sprite_2d: AnimatedSprite2D = $GhostStatic/AnimatedSprite2D

var play_audio_animation = false
var ghost_entered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not ghost_entered and play_audio_animation and not audio_stream_player_2d.playing:
		ghost_static.visible = true
		play_audio_animation = true
		ghost_entered = true
		audio_stream_player_2d.pitch_scale = randf_range(0.8,1.2)
		audio_stream_player_2d.playing = true
		animated_sprite_2d.play("GhostEntersObject")

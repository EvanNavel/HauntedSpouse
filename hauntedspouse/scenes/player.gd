class_name Player
extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 150.0

var direction: Vector2

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_direction: Vector2 = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down") 
	direction = input_direction.normalized()

	if direction.y < 0:
		animated_sprite_2d.play("WalkUp")
	elif direction.y > 0:
		animated_sprite_2d.play("WalkDown")
	elif direction.x < 0:
		animated_sprite_2d.play("WalkLeft")
	elif direction.x > 0:
		animated_sprite_2d.play("WalkRight")
	
	if direction == Vector2.ZERO:
		animated_sprite_2d.play("Idle")
	velocity = direction * SPEED
	move_and_slide()

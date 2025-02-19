class_name Player
extends CharacterBody2D

@export var task_panel: PanelContainer
@export var inventory_panel: PanelContainer

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 150.0

var direction: Vector2

func _ready() -> void:
	if task_panel:
		task_panel.visible = false

	if inventory_panel:
		inventory_panel.visible = false

func _physics_process(delta: float) -> void:
	#toggle for task panel
	if task_panel and Input.is_action_just_pressed("task_toggle"):
		task_panel.visible = !task_panel.visible

	if inventory_panel and Input.is_action_just_pressed("inventory_toggle"):
		inventory_panel.visible = !inventory_panel.visible

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

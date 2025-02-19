class_name Player
extends CharacterBody2D

@export var task_panel: PanelContainer
@export var inventory_panel: PanelContainer

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 150.0

var direction: Vector2
var previous_direction: String = 'Down'
func _ready() -> void:
	if task_panel:
		task_panel.visible = false

	if inventory_panel:
		inventory_panel.visible = false

func _physics_process(_delta: float) -> void:
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
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("WalkUp")
		previous_direction = "Up"
	elif direction.y > 0:
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("WalkDown")
		previous_direction = "Down"
	elif direction.x < 0:
		animated_sprite_2d.play("WalkLeftRight")
		animated_sprite_2d.flip_h = false
		previous_direction = "LeftRight"
	elif direction.x > 0:
		animated_sprite_2d.play("WalkLeftRight")
		animated_sprite_2d.flip_h = true
		previous_direction = "LeftRight"
	
	if direction == Vector2.ZERO:
		animated_sprite_2d.play("Idle"+previous_direction)
	velocity = direction * SPEED
	move_and_slide()

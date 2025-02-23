class_name Player
extends CharacterBody2D

@export var task_panel: PanelContainer
@export var inventory_panel: PanelContainer
@export var pause_screen: PanelContainer

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var scare_timer: Timer = $ScareTimer

var speed = 150.0

var direction: Vector2
var previous_direction: String = 'Down'
var scared: bool = false

func _ready() -> void:
	if task_panel:
		task_panel.visible = true

	if inventory_panel:
		inventory_panel.visible = true
		
	if pause_screen:
		pause_screen.visible = false

func _physics_process(_delta: float) -> void:
	#toggle for task panel
	if task_panel and Input.is_action_just_pressed("task_toggle"):
		task_panel.visible = !task_panel.visible

	if inventory_panel and Input.is_action_just_pressed("inventory_toggle"):
		inventory_panel.visible = !inventory_panel.visible

	if pause_screen and Input.is_action_just_pressed("escape"):
		pause_screen.visible = !pause_screen.visible

	if scared:
		animated_sprite_2d.play("Idle"+previous_direction)
		return

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
	velocity = direction * speed
	move_and_slide()


func _on_scare_area_body_entered(body: Node2D) -> void:
	if body is Ghost:
		get_scared()
		
func get_scared() -> void:
	scared = true
	speed = 0
	scare_timer.start()

func _on_scare_timer_timeout() -> void:
	scared = false
	speed = 150

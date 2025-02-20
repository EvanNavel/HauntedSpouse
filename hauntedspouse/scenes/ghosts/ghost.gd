class_name Ghost
extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var interactible_component: InteractibleComponent = $InteractibleComponent
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var timeout: Timer = $Timeout
@onready var collision_shape_2d: CollisionShape2D = $InteractibleComponent/CollisionShape2D
@onready var collision_body: CollisionShape2D = $CollisionBody

@export var min_speed: float = 5.0
@export var max_speed: float = 10.0

var previous_direction: String = "Down"
var speed: float
var prev_speed: float = 0.0
var attacking: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	navigation_agent_2d.velocity_computed.connect(on_safe_velocity_computed)
	interactible_component.interactible_activated.connect(on_interactible_activated)
	interactible_component.interactible_deactivated.connect(on_interactible_deactivated)
	animated_sprite_2d.play("WalkHidden")
	call_deferred("character_setup")

func character_setup() -> void:
	await get_tree().physics_frame
	
	set_movement_target()
	
func set_movement_target() -> void:
	var target_position: Vector2 = NavigationServer2D.map_get_random_point(navigation_agent_2d.get_navigation_map(), navigation_agent_2d.navigation_layers, false)
	navigation_agent_2d.target_position = target_position
	speed = randf_range(min_speed, max_speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if navigation_agent_2d.is_navigation_finished():
		set_movement_target()
		return

	var target_position: Vector2 = navigation_agent_2d.get_next_path_position()
	var target_direction: Vector2 = global_position.direction_to(target_position)
	
	var velocity = target_direction * speed
	
	if target_direction.y < 0:
		previous_direction = "Up"
	elif target_direction.y > 0:
		previous_direction = "Down"
	elif target_direction.x < 0:
		previous_direction = "Left"
	elif target_direction.x > 0:
		previous_direction = "Right"
		
	if navigation_agent_2d.avoidance_enabled:
		animated_sprite_2d.flip_h = velocity.x < 0
		navigation_agent_2d.velocity = velocity
	else:
		velocity = velocity
		move_and_slide()

func on_safe_velocity_computed(safe_velocity: Vector2) -> void:
	animated_sprite_2d.flip_h = safe_velocity.x < 0
	velocity = safe_velocity
	move_and_slide()

func on_interactible_activated() -> void:
	animated_sprite_2d.play("Attack"+previous_direction)
	attacking = true
	prev_speed = speed
	speed = 0
	collision_shape_2d.set_deferred("disabled", true)
	collision_body.set_deferred("disabled", true)
	timeout.start()
	
func on_interactible_deactivated() -> void:
	pass

func _on_timeout_timeout() -> void:
	attacking = false
	collision_shape_2d.set_deferred("disabled", false)
	collision_body.set_deferred("disabled", false)
	speed = prev_speed
	animated_sprite_2d.play("WalkHidden")

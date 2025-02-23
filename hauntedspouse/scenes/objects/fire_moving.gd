extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

@export var screen_manager: Node2D
@export var min_speed: float = 400
@export var max_speed: float = 1000

var previous_direction: String = "Down"
var speed: float
var prev_speed: float = 0.0
var attacking: bool = false

var mouse_in_area: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	navigation_agent_2d.velocity_computed.connect(on_safe_velocity_computed)
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
	if mouse_in_area and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		screen_manager.count += 1
		queue_free()
		mouse_in_area = false

func _physics_process(delta: float) -> void:
	if navigation_agent_2d.is_navigation_finished():
		set_movement_target()
		return

	var target_position: Vector2 = navigation_agent_2d.get_next_path_position()
	var target_direction: Vector2 = global_position.direction_to(target_position)
	
	var velocity = target_direction * speed
		
	if navigation_agent_2d.avoidance_enabled:
		animated_sprite_2d.flip_h = velocity.x < 0
		navigation_agent_2d.velocity = velocity
	else:
		velocity = velocity
		move_and_slide()

func on_safe_velocity_computed(safe_velocity: Vector2) -> void:
	animated_sprite_2d.flip_h = safe_velocity.x < 0
	velocity = safe_velocity * 3
	move_and_slide()


func _on_fire_area_mouse_entered() -> void:
	mouse_in_area = true
	

func _on_fire_area_mouse_exited() -> void:
	mouse_in_area = false

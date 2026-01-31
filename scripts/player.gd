extends CharacterBody2D

var speed: int = 300
var movement_input: Vector2
var mouse_position: Vector2

@export var bullet_scene: PackedScene

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(_delta: float) -> void:
	look_at(mouse_position)
	
	mouse_position = get_global_mouse_position()
	PlayerData.player_location = global_position
	PlayerData.crosshair_location = mouse_position
	
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(_delta: float) -> void:
	movement_input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = movement_input * speed
	
	move_and_slide()

func shoot():
	var bullet = bullet_scene.instantiate()
	get_tree().get_root().add_child(bullet)
	bullet.global_position = global_position
	bullet.aim((PlayerData.crosshair_location - global_position).normalized())

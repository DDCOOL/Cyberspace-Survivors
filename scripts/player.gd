extends CharacterBody2D

var speed: int = 300
var movement_input: Vector2
var mouse_position: Vector2
var atack_on_cooldown: bool = false

@export var bullet_scene: PackedScene

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(_delta: float) -> void:
	movement_animation()
	mouse_position = get_global_mouse_position()
	#look_at(mouse_position)
	#use this to turn the player in the direction of the mouse
	#set rotation of sprite to 90 when used
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
	bullet.global_position = PlayerData.gun_position
	bullet.aim((PlayerData.crosshair_location - global_position).normalized())

func movement_animation():
	if movement_input.x > 0:
		$Sprite2D.play("move_right")
	elif movement_input.x < 0:
		$Sprite2D.play("move_left")
	elif movement_input.y < 0:
		$Sprite2D.play("move_up")
	elif movement_input.y > 0:
		$Sprite2D.play("move_down")
	else:
		$Sprite2D.play("idle")

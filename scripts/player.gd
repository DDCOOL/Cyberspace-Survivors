extends CharacterBody2D

var speed: int = 300
var movement_input: Vector2




var mouse_position: Vector2

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(_delta: float) -> void:
	mouse_position = get_global_mouse_position()
	PlayerData.player_location = global_position

func _physics_process(_delta: float) -> void:
	movement_input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = movement_input * speed
	move_and_slide()

extends CharacterBody2D

@export var bullet_speed: int = 1200
var direction: Vector2

func _physics_process(_delta: float) -> void:
	velocity =  direction * bullet_speed
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_wall_detector_body_entered(_body: Node2D) -> void:
	queue_free()

func aim(aim_direction):
	direction = aim_direction

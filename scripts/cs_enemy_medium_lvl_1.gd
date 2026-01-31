extends CharacterBody2D

var enemy_health: int = 10
var speed: int = 120
var direction: Vector2

func _physics_process(_delta: float) -> void:
	if PlayerData.player_location:
		look_at(PlayerData.player_location)
		direction =  PlayerData.player_location - position
	velocity = (direction).normalized() * speed
	move_and_slide()


func toggle_visibility():
	if $Sprite2D.visible == false:
		$Sprite2D.visible = true
	else:
		$Sprite2D.visible = false

func take_damage():
	enemy_health -= 5
	if enemy_health <= 0:
		enemy_health = 0
		queue_free()


func _on_hurtbox_body_entered(body: Node2D) -> void:
	take_damage()
	body.queue_free()

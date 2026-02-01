extends CharacterBody2D


var enemy_health: int = 10
var speed: int = 120
var direction: Vector2

var navPath
var currPathPoint 

var path_point_margin: float = 5

func _ready() -> void:
	setTarget()

func setTarget() -> void:
	navPath = NavigationServer2D.map_get_path(get_world_2d().get_navigation_map(), global_position, PlayerData.player_location, true)
	currPathPoint = 0

func _physics_process(_delta: float) -> void:
	if global_transform.origin.distance_to(navPath[currPathPoint]) <= path_point_margin:
		currPathPoint += 1
		if currPathPoint >= navPath.size():
			currPathPoint -= 1
	#look_at(PlayerData.player_location)
	direction =  global_transform.origin.direction_to(navPath[currPathPoint])
	velocity = direction.normalized() * speed
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


func _on_timer_timeout() -> void:
	setTarget()

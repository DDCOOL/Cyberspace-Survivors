extends Node2D
@export var budget:int = 100

@export var cyber_light_l1: PackedScene #10
@export var cyber_light_l2: PackedScene #100
@export var cyber_med_l1: PackedScene	#20
@export var cyber_med_l2: PackedScene	#200

@export var real_light_l1: PackedScene	#10
@export var real_light_l2: PackedScene	#100
@export var real_med_l1: PackedScene	#20
@export var real_med_l2: PackedScene	#200

@onready var player_camera: Camera2D = $Player/Camera2D
var camera_zoom_on: bool = true


var realspace_enemies:Array
var cyberspace_enemies:Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var cybermask_off = true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("debug_camera_zoom"):
		if camera_zoom_on:
			player_camera.zoom = Vector2(0.6, 0.6)
			camera_zoom_on = false
		else:
			player_camera.zoom = Vector2(1.2, 1.2)
			camera_zoom_on = true

	if Input.is_action_just_pressed("cybermask_toggle"):
		
		cybermask_off = !cybermask_off
		
		for i in $RealspaceEnemies.get_children():
			i.toggle_visibility()
		
		for i in $CyberspaceEnemies.get_children():
			i.toggle_visibility()


func _on_enemy_spawn_timer_timeout() -> void:
	budget += 10
	var localBudget = budget
	
	while localBudget > 0:
		var spawn = randi()%7
		match spawn:
			0:
				if(localBudget >= 200):
					localBudget -= 200
					var enemy = cyber_med_l2.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					enemy.visible = !cybermask_off
					$CyberspaceEnemies.add_child(enemy)
				else:
					spawn += 1
					continue
			1:
				if(localBudget >= 100):
					localBudget -= 100
					var enemy = cyber_light_l2.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					enemy.visible = !cybermask_off
					$CyberspaceEnemies.add_child(enemy)
				else:
					spawn += 1
					continue
			2:
				if(localBudget >= 20):
					localBudget -= 20
					var enemy = cyber_med_l1.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					enemy.visible = !cybermask_off
					$CyberspaceEnemies.add_child(enemy)
				else:
					spawn += 1
					continue
			3:
				if(localBudget >= 10):
					localBudget -= 10
					var enemy = cyber_light_l1.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc 
					enemy.visible = !cybermask_off
					$CyberspaceEnemies.add_child(enemy)
			4:
				if(localBudget >= 200):
					localBudget -= 200
					var enemy = real_med_l2.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					enemy.visible = cybermask_off
					$RealspaceEnemies.add_child(enemy)
				else:
					spawn += 1
					continue
			5:
				if(localBudget >= 100):
					localBudget -= 100
					var enemy = real_light_l2.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					enemy.visible = cybermask_off
					$RealspaceEnemies.add_child(enemy)
				else:
					spawn += 1
					continue
			6:
				if(localBudget >= 20):
					localBudget -= 20
					var enemy = real_med_l1.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					enemy.visible = cybermask_off
					$RealspaceEnemies.add_child(enemy)
				else:
					spawn += 1
					continue
			7:
				if(localBudget >= 10):
					localBudget -= 10
					var enemy = real_light_l1.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					enemy.visible = cybermask_off
					$RealspaceEnemies.add_child(enemy)

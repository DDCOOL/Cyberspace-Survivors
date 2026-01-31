extends Node2D
var budget:int = 10

@export var cyber_light_l1: PackedScene #10
@export var cyber_light_l2: PackedScene #100
@export var cyber_med_l1: PackedScene	#20
@export var cyber_med_l2: PackedScene	#200

@export var real_light_l1: PackedScene	#10
@export var real_light_l2: PackedScene	#100
@export var real_med_l1: PackedScene	#20
@export var real_med_l2: PackedScene	#200

var realspace_enemies:Array
var cyberspace_enemies:Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var cybermask_off = true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("cybermask_toggle"):
		
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
				if(localBudget >= 10):
					localBudget -= 10
					var enemy = cyber_light_l1.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc 
					$CyberspaceEnemies.add_child(enemy)
				break
			1:
				if(localBudget >= 100):
					localBudget -= 100
					var enemy = cyber_light_l2.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					$CyberspaceEnemies.add_child(enemy)
				break
			2:
				if(localBudget >= 20):
					localBudget -= 20
					var enemy = cyber_med_l1.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					$CyberspaceEnemies.add_child(enemy)
				break
			3:
				if(localBudget >= 200):
					localBudget -= 200
					var enemy = cyber_med_l2.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					$CyberspaceEnemies.add_child(enemy)
				break
			4:
				if(localBudget >= 10):
					localBudget -= 10
					var enemy = real_light_l1.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					$RealspaceEnemies.add_child(enemy)
				break
			5:
				if(localBudget >= 100):
					localBudget -= 100
					var enemy = real_light_l2.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					$RealspaceEnemies.add_child(enemy)
				break
			6:
				if(localBudget >= 20):
					localBudget -= 20
					var enemy = real_med_l1.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					$RealspaceEnemies.add_child(enemy)
				break
			7:
				if(localBudget >= 200):
					localBudget -= 200
					var enemy = real_med_l2.instantiate()
					var spawnLoc = NavigationServer2D.region_get_random_point($EnemyRoamRegion.get_rid(), 0, true)
					enemy.position = spawnLoc
					$RealspaceEnemies.add_child(enemy)
				break
				

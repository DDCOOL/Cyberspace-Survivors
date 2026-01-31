extends Node2D

@onready var realspace_enemies: Node2D = $RealspaceEnemies
@onready var cyberspace_enemies: Node2D = $CyberspaceEnemies
var cybermask_off = true


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("cybermask_toggle"):
		var realspace_enemies_children = realspace_enemies.get_children()
		var cyberspace_enemies_children = cyberspace_enemies.get_children()
		
		for i in realspace_enemies_children:
			i.toggle_visibility()
		
		for i in cyberspace_enemies_children:
			i.toggle_visibility()

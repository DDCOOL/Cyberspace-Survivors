extends Node2D

func _process(_delta: float) -> void:
	look_at(PlayerData.crosshair_location)
	PlayerData.gun_position = $Sprite2D.global_position

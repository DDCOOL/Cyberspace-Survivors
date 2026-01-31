extends Control

@onready var health_bar: TextureProgressBar = $health_bar
@onready var firewall_bar: TextureProgressBar = $firewall_bar


func _process(_delta: float) -> void:
	health_bar.value = PlayerData.player_health
	firewall_bar.value = PlayerData.player_firewall

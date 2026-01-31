extends Control

signal startGame


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/Level_1.tscn")


func _on_settings_button_pressed() -> void:
	$"../SettingsMenu".show()
	$"../MainMenuControl".hide()


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_settings_menu_is_closed() -> void:
	$"../SettingsMenu".hide()
	$"../MainMenuControl".show()

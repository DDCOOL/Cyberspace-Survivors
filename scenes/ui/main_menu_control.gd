extends Control

signal startGame

var button_type = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_button_pressed() -> void:
	button_type = "start"
	$scene_transition/Timer.start()
	$scene_transition/AnimationPlayer.play("easse_out")


func _on_settings_button_pressed() -> void:
	$"../SettingsMenu".show()
	$"../MainMenuControl".hide()


func _on_exit_button_pressed() -> void:
	button_type = "quit"
	$scene_transition/Timer.start()
	$scene_transition/AnimationPlayer.play("easse_out")


func _on_settings_menu_is_closed() -> void:
	$"../SettingsMenu".hide()
	$"../MainMenuControl".show()


func _on_fade_timer_timeout() -> void:
	if button_type == "start":
		get_tree().change_scene_to_file("res://scenes/levels/Level_1.tscn")
	
	if button_type == "quit":
		get_tree().quit()

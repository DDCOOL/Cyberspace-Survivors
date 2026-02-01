extends Control

var button_type = null

func _on_main_menu_button_pressed() -> void:
	button_type = "mainmenu"
	$scene_transition/Timer.start()
	$scene_transition/AnimationPlayer.play("easse_out")

func _on_restart_button_pressed() -> void:
	button_type = "start"
	$scene_transition/Timer.start()
	$scene_transition/AnimationPlayer.play("easse_out")


func _on_timer_timeout() -> void:
	if button_type == "start":
		get_tree().change_scene_to_file("res://scenes/levels/Level_1.tscn")

	if button_type == "mainmenu":
		get_tree().change_scene_to_file("res://scenes/ui/main_manu.tscn")

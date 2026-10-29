extends Control


func _on_exit_m_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/start_m.tscn")



func _on_reume_pressed() -> void:
	get_tree().paused=false
	$".".hide()


func _on_save_pressed() -> void:
	$"save game_m".show()


func _on_load_pressed() -> void:
	get_tree().paused=false
	Globle.load_game()

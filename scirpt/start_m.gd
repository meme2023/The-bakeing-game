extends Control


func _on_start_pressed() -> void:
	get_tree().paused=false
	get_tree().change_scene_to_file("res://scene/bakery_kitchen.tscn")




func _on_save_pressed() -> void:
	pass # Replace with function body.


func _on_load_pressed() -> void:
	get_tree().paused=false
	
			
	Globle.load_game()


func _on_exit_pressed() -> void:
	get_tree().quit()

extends Control


func _on_button_pressed() -> void:
	print("SAVE 1 CLICKED!")
	Globle.save_game()


func _on_delete_pressed() -> void:
	Globle.delete_game()

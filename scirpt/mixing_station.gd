extends Node2D
func _process(delta: float) -> void:
	pausing_the_game()
func pausing_the_game()->void:
	if Input.is_action_just_pressed("ui_cancel"):
		$pause_m.show()
		get_tree().paused=true

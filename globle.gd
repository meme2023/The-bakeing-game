extends Node
const SAVE_PATH = "user://save_game.tres"
var is_saved=false
var game_data: GameData = GameData.new()
func save_game()->void:
	var scene = get_tree().current_scene
	if game_data.scene_data == null:
		game_data.scene_data = scene_data.new()
	if scene ==null:
		return
	game_data.scene_data.current_scene_path=scene.scene_file_path
	if game_data.scene_data.current_scene_path.is_empty():
		return
	ResourceSaver.save(game_data, SAVE_PATH)
	print("Game saved!")
	is_saved=true
	
	
func load_game()->void:
	if not FileAccess.file_exists(SAVE_PATH):
		print("No saved game!")
	
		return
	var loaded_data = ResourceLoader.load(
		SAVE_PATH, "",
		ResourceLoader.CACHE_MODE_IGNORE
	) as GameData
	if loaded_data == null:
		return
	game_data = loaded_data
	if ResourceLoader.exists(game_data.scene_data.current_scene_path, "PackedScene"):
		get_tree().change_scene_to_file(game_data.scene_data.current_scene_path)
		

func delete_game() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		var result = DirAccess.remove_absolute(SAVE_PATH)
		if result == OK:
			game_data = GameData.new()
			is_saved = false
			print("Save deleted!")
		else:
			push_error("Failed to delete save!")
	else:
		print("No save file found!")

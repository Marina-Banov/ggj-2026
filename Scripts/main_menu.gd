extends CanvasLayer


func _on_play_solo_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_solo.tscn")


func _on_play_duo_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()

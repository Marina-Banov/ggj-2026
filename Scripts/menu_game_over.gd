extends CanvasLayer


func set_winner_text(text: String) -> void:
	%Winner.text = text


func _on_play_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_return_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu_main.tscn")

extends CanvasLayer


func set_winner_text(player_id: int) -> void:
	%Winner.text = "Player {0} won!".format([player_id])


func _on_play_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_return_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

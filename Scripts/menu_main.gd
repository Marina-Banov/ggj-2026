extends CanvasLayer


func _ready() -> void:
	get_tree().paused = false


func _on_play_solo_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_solo.tscn")


func _on_play_duo_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_duo.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()

extends CanvasLayer


func _ready():
	GameManager.game_state_changed.connect(_on_game_state_changed)


func _on_game_state_changed(state: GameManager.GameState):
	visible = state == GameManager.GameState.GAME_OVER


func set_winner_text(text: String) -> void:
	%Winner.text = text


func _on_play_pressed() -> void:
	get_tree().reload_current_scene()


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu_main.tscn")

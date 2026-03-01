extends CanvasLayer


func _ready():
	GameManager.game_state_changed.connect(_on_game_state_changed)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if GameManager.current_state == GameManager.GameState.PLAYING:
			GameManager.set_state(GameManager.GameState.PAUSED)
		elif GameManager.current_state == GameManager.GameState.PAUSED:
			GameManager.set_state(GameManager.GameState.PLAYING)


func _on_game_state_changed(state: GameManager.GameState):
	visible = state == GameManager.GameState.PAUSED

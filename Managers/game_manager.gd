extends Node

enum GameState {
	PLAYING,
	PAUSED,
	GAME_OVER
}

var current_state: GameState = GameState.PLAYING

signal game_state_changed(new_state)


func set_state(new_state: GameState):
	if current_state == new_state:
		return

	current_state = new_state
	game_state_changed.emit(new_state)

	match new_state:
		GameState.PLAYING:
			get_tree().paused = false
		GameState.PAUSED:
			get_tree().paused = true
		GameState.GAME_OVER:
			get_tree().paused = true

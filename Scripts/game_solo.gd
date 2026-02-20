extends Node2D

var score = 0


func _ready() -> void:
	_update_score_label()
	var vw = get_viewport_rect().size
	%Arena.position = vw / 2
	%Player.position = vw / 2


func _on_timer_timeout() -> void:
	%Arena.spawn_line()
	score += 1
	_update_score_label()


func _update_score_label():
	%ScoreLabel.text = "Score: {0}".format([score])


func _on_player_player_died(_player_id: int) -> void:
	get_tree().paused = true
	%GameOver.set_winner_text("Score: {0}".format([score]))
	%GameOver.visible = true

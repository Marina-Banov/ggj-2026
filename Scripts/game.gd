extends Node2D


func player_picked_up(player_name: String) -> void:
	if player_name == "Player1":
		%Arena2.spawn_line()
	if player_name == "Player2":
		%Arena1.spawn_line()

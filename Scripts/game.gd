extends Node2D


func player_picked_up(player_name: String) -> void:
	if player_name == "Player":
		%Arena2.spawn_line()
		%Arena1.spawn_line()

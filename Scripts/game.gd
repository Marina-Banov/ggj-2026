extends Node2D


func _ready() -> void:
	get_tree().node_added.connect(_on_node_added)


func _on_node_added(node: Node) -> void:
	if node.is_in_group("pickups"):
		node.collected.connect(_on_pickup_collected)


func _on_pickup_collected(player_id: int) -> void:
	if player_id == 1:
		%Arena2.call_deferred("spawn_line")
	if player_id == 2:
		%Arena1.call_deferred("spawn_line")


func _on_player_died(player_id: int) -> void:
	var winner = 1 if player_id == 2 else 2
	get_tree().paused = true
	%GameOver.set_winner_text(winner)
	%GameOver.visible = true

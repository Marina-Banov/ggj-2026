extends Area2D

@onready var game = get_node("/root/Game")


func _on_body_entered(body: Node2D) -> void:
	game.player_picked_up(body.name)
	queue_free()

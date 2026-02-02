extends Area2D

signal collected(player_id)

"""
If other nodes need to find you → _enter_tree()
If you need to find other nodes → _ready()
"""
func _enter_tree() -> void:
	add_to_group("pickups")


func _on_body_entered(body: Node2D) -> void:
	collected.emit(body.player_id)
	queue_free()

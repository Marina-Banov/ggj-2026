extends Node2D


func _ready() -> void:
	var vw = get_viewport_rect().size
	%Arena.position = vw / 2
	%Player.position = vw / 2

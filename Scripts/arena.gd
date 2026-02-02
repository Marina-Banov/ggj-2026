extends Node2D

const TARGETS = [
	Transform2D(PI, Vector2(550, 550)),
	Transform2D(-PI/2, Vector2( 0, 550)),
	Transform2D(PI/2, Vector2(550,  0)),
	Transform2D(0, Vector2( 0,  0))
]


func spawn_line() -> void:
	const PROJECTILE = preload("res://Scenes/projectile.tscn")
	var new_projectile = PROJECTILE.instantiate()
	var target = TARGETS.pick_random()
	new_projectile.global_position = target.get_origin()
	new_projectile.rotation = target.get_rotation()
	add_child(new_projectile)


func _spawn_pickup() -> void:
	const PICKUP = preload("res://Scenes/pickup.tscn")
	var new_pickup = PICKUP.instantiate()
	var rng = RandomNumberGenerator.new()
	new_pickup.global_position = Vector2(rng.randf_range(20.0, 530.0), rng.randf_range(20.0, 530.0))
	add_child(new_pickup)

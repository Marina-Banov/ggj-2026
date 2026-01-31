extends Node2D


func spawn_line():
	const PROJECTILE = preload("res://Scenes/projectile.tscn")
	var new_projectile = PROJECTILE.instantiate()
	new_projectile.global_position = Vector2.ZERO
	#new_projectile.rotation = -PI/2
	add_child(new_projectile)


func spawn_pickup():
	const PICKUP = preload("res://Scenes/pickup.tscn")
	var new_pickup = PICKUP.instantiate()
	var rng = RandomNumberGenerator.new()
	new_pickup.global_position = Vector2(rng.randf_range(20.0, 530.0), rng.randf_range(20.0, 530.0))
	add_child(new_pickup)

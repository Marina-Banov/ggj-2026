extends Node2D

var TARGETS = []
const HALF_SIZE = 275.0
const MARGIN = 20.0


func _ready() -> void:
	TARGETS = [
		Transform2D(PI, %WallBottom.position),
		Transform2D(-PI/2, %WallLeft.position),
		Transform2D(PI/2, %WallRight.position),
		Transform2D(0, %WallTop.position)
	]


func spawn_line() -> void:
	const PROJECTILE = preload("res://Scenes/projectile.tscn")
	var new_projectile = PROJECTILE.instantiate()
	var target = TARGETS.pick_random()
	new_projectile.global_position = target.get_origin()
	new_projectile.rotation = target.get_rotation()
	add_child(new_projectile)


func spawn_pickup() -> void:
	const PICKUP = preload("res://Scenes/pickup.tscn")
	var new_pickup = PICKUP.instantiate()
	var rng = RandomNumberGenerator.new()
	new_pickup.global_position = Vector2(
		rng.randf_range(-HALF_SIZE + MARGIN, HALF_SIZE - MARGIN),
		rng.randf_range(-HALF_SIZE + MARGIN, HALF_SIZE - MARGIN)
	)
	add_child(new_pickup)

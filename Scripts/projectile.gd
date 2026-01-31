extends Area2D

const SPEED = 200
const RANGE = 550

var travelled_distance = 0


func _physics_process(delta: float) -> void:
	var direction = Vector2.DOWN.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance >= RANGE:
		queue_free()

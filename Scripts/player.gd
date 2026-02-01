extends CharacterBody2D

const SPEED = 200
const MAX_HP = 3

var hp = MAX_HP


func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()


func _on_hurt_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("projectiles"):
		_take_damage()


func _take_damage():
	hp -= 1
	print("player hp: ", hp)

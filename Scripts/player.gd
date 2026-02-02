extends CharacterBody2D

@export var player_id = 0
signal player_died(player_id)

const SPEED = 200.0

const DASH_SPEED = 600.0
const DASH_DURATION = 0.15
const DASH_COOLDOWN = 0.5

const MAX_HP = 3
const HP_COLORS = [
	Color(0.09, 0.13, 0.25),
	Color(0.68, 0.26, 0.28), 
	Color(0.75, 0.69, 0.38), 
	Color(0.29, 0.63, 0.38), 
]

var dash_time_remaining = 0.0
var dash_cooldown_remaining = 0.0
var dash_direction = Vector2.ZERO

var hp = MAX_HP


func _physics_process(delta: float) -> void:
	if dash_cooldown_remaining > 0:
		dash_cooldown_remaining -= delta
	
	if dash_time_remaining > 0:
		dash_time_remaining -= delta
		velocity = dash_direction * DASH_SPEED
	else:
		var direction = Input.get_vector(
			"move_left_{0}".format([player_id]),
			"move_right_{0}".format([player_id]),
			"move_up_{0}".format([player_id]),
			"move_down_{0}".format([player_id])
		)
		velocity = direction * SPEED
		%HurtBox.monitoring = true
		if Input.is_action_just_pressed("dash_{0}".format([player_id])) and dash_cooldown_remaining <= 0 and direction != Vector2.ZERO:
			_start_dash(direction)
	
	_set_color_for_hp()
	move_and_slide()


func _on_hurt_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("projectiles"):
		_take_damage()


func _take_damage() -> void:
	if hp > 0:
		hp -= 1
	if hp == 0:
		player_died.emit(player_id)


func _start_dash(dir: Vector2) -> void:
	%HurtBox.monitoring = false
	dash_direction = dir
	dash_time_remaining = DASH_DURATION
	dash_cooldown_remaining = DASH_COOLDOWN


func _set_color_for_hp() -> void:
	%Polygon2D.color = HP_COLORS[hp]
	if not %HurtBox.monitoring:
		%Polygon2D.color = Color(%Polygon2D.color, 0.45)

extends Node2D
class_name ProgressiveTimer

@export var start_interval = 1.0
@export var min_interval = 0.1
@export var duration = 60.0
@onready var timer = $Timer

var elapsed_time = 0.0

signal progressed_timeout


func _ready():
	timer.timeout.connect(_on_timeout)
	timer.start()


func _process(delta):
	elapsed_time += delta
	var t = clamp(elapsed_time / duration, 0.0, 1.0)
	timer.wait_time = lerp(start_interval, min_interval, t)


func _on_timeout():
	progressed_timeout.emit()

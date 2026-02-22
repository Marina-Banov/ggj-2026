extends Timer
class_name ProgressiveTimer

@export_range(0.1, 10.0, 0.1) var start_interval = 1.0
@export_range(0.1, 10.0, 0.1) var min_interval = 0.1
@export_range(0.1, 300.0, 0.1) var duration = 60.0

var elapsed_time = 0.0

signal progressed_timeout


func _ready():
	one_shot = false
	wait_time = start_interval
	timeout.connect(_on_timeout)
	start()


func _on_timeout():
	elapsed_time += wait_time
	var t = clamp(elapsed_time / duration, 0.0, 1.0)
	wait_time = lerp(start_interval, min_interval, t)
	progressed_timeout.emit()

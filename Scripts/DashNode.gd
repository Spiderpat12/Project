extends Node2D

@onready var timer = $DashTimer
var dashOrNo = false



func start_dash(dur) -> void:
	timer.wait_time = dur
	timer.start()
	dashOrNo = true



func _on_dash_timer_timeout():
	dashOrNo = false
	pass # Replace with function body.

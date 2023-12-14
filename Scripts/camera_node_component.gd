extends Node2D


@export var Target : Node2D
@export var followSpeed : float



func _physics_process(delta):
	global_position = global_position.lerp(Target.global_position, followSpeed * delta)

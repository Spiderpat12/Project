extends CharacterBody2D

@export var speed : float
@export var jump : float
@export var gravit : float
@export var acceleration : float


func _physics_process(delta):
	Gravity(delta)
	MoveMent(delta)
	Jump()


func Gravity(delta) -> void:
	if (!is_on_floor()):
		velocity.y += gravit

func MoveMent(delta) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
		$Sprite2D.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration * delta)

	move_and_slide()


func Jump() -> void:
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -jump

extends CharacterBody2D

@export var speed : float
@export var jump : float
@export var gravit : float


func _physics_process(delta):
	Gravity(delta)
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()


func Gravity(delta) -> void:
	if (!is_on_floor()):
		velocity.y += gravit * delta

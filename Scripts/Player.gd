extends CharacterBody2D

var coyoteTimer : float = 0.3
var CanJump : bool = false
var dashSpeed : float
var dashLenght = 0.2


@export var normalSpeed : float
@export var jump : float
@export var gravit : float
@export var acceleration : float
@export var divMul : int # دي يا ريان علشان نقسم ونضرب سرعة الداش
@export_enum("Chapter1","Chapter2","Chapter3","Chapter4") var Chapters

@onready var dash = $Mechanics/DashNode

func _ready():
	dashSpeed = normalSpeed * divMul

func _physics_process(delta):
	Gravity(delta)
	MoveMent(delta)
	Jump()
	Chapter(delta)



func Gravity(delta) -> void:
	if (!is_on_floor()):
		velocity.y += gravit

func MoveMent(delta) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * normalSpeed, acceleration * delta)
		$Sprite2D.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration * delta)

	move_and_slide()


func Jump() -> void:
	
	if is_on_floor() && CanJump == false:
		CanJump = true
	elif CanJump == true && $Timer_Node/CoyoteTimer.is_stopped():
		$Timer_Node/CoyoteTimer.start(coyoteTimer)
	
	if CanJump:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = -jump

func _on_coyote_timer_timeout():
	CanJump = false

func Chapter(delta) -> void:
	match Chapters:
		0:
			DashFunciton(delta)
			pass
		1:
			print("element2")
		2:
			print("element3")
		3:
			print("element4")

func DashFunciton(delta) -> void:
		if dash.dashOrNo == true:
			normalSpeed = dashSpeed
		elif dash.dashOrNo == false:
			normalSpeed = dashSpeed / divMul
		if Input.is_action_just_pressed("DashButton"):
			dash.start_dash(dashLenght)

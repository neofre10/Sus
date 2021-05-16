extends KinematicBody

export var gravity = 0.5
export var speed = 1
export var jump_height = 2000
export var acceleration = 0.5
export var max_speed = 10
export var rotate_speed = PI/4
export var rotate_accel = 2
export var falling = Vector3()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouse_accel = -.3

#func _input(event):
	#if event is InputEventMouseMotion:
		#rotate_y(deg2rad(event.get_relative().x * mouse_accel ))

func get_input():
	var input = Vector3(
		-int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right")),
		-int(Input.is_action_just_pressed("ui_jump")),
		-int(Input.is_action_pressed("ui_up")) + int(Input.is_action_pressed("ui_down"))
	)
	
	if Input.is_action_pressed("ui_q"):
		rotate_y(deg2rad(rotate_speed * rotate_accel))
	elif Input.is_action_pressed("ui_e"):
		rotate_y(deg2rad(rotate_speed * -rotate_accel))
	input = input.normalized()
	return input
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var input = get_input()
	if input != Vector3.ZERO:
		speed += acceleration
		if speed > max_speed:
			speed = max_speed
	
	falling -= Vector3(0,gravity,0)
	move_and_slide(falling)
	if is_on_floor():
		falling = Vector3.ZERO

	var fwd = Vector3(global_transform.basis.z) * input.z * speed 
	var strafe = Vector3(global_transform.basis.x) * input.x * speed 	

	move_and_slide(fwd)
	move_and_slide(strafe)
	
	print(falling)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

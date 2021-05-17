extends KinematicBody

var velocity = Vector3(0,0,0)

const SPEED = 5
const ROTATE = 5
const GRAVITY = 9.81
export var rotate_speed = PI/4
export var rotate_accel = 2
export var falling = Vector3()

func _ready():
	pass
	
func get_input():
	if Input.is_action_pressed("ui_q"):
		rotate_y(deg2rad(rotate_speed * rotate_accel))
	elif Input.is_action_pressed("ui_e"):
		rotate_y(deg2rad(rotate_speed * -rotate_accel))

func _physics_process(delta):

	var input = get_input()

	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		#$MeshInstance.rotate_z(deg2rad(-ROTATE))
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		#$MeshInstance.rotate_z(deg2rad(ROTATE))
	else:
		velocity.x = lerp(velocity.x,0,0.1)

	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		#$MeshInstance.rotate_x(deg2rad(-ROTATE))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		#$MeshInstance.rotate_x(deg2rad(ROTATE))
	else:
		velocity.z = lerp(velocity.z,0,0.1)

	if Input.is_action_just_pressed("ui_jump"):
		velocity.y = SPEED
	
	velocity.y -= GRAVITY * delta
	move_and_slide(velocity)

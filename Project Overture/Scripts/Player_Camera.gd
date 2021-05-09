extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var rotation_speed = PI / 2
export var rotation_position = Vector3()

func get_input(delta):
	if Input.is_action_pressed("ui_left_cam"):
		rotation_position.y -= 1
	elif Input.is_action_just_released("ui_left_cam"):
		rotation_position.y = 0

	if Input.is_action_pressed("ui_right_cam"):
		rotation_position.y += 1
	elif Input.is_action_just_released("ui_right_cam"):
		rotation_position.y = 0
	rotate_object_local(Vector3.UP, rotation_position.y * rotation_speed * delta)

	if Input.is_action_pressed("ui_up_cam"):
		rotation_position.x -= 1
	elif Input.is_action_just_released("ui_up_cam"):
		rotation_position.x = 0

	if Input.is_action_pressed("ui_down_cam"):
		rotation_position.x += 1
	elif Input.is_action_just_released("ui_down_cam"):
		rotation_position.x = 0
	$Inner_Gimbal.rotate_object_local(Vector3.RIGHT, rotation_position.x * rotation_speed * delta)
	pass 
	
func _process(delta):
	get_input(delta)
	$Inner_Gimbal.rotation.x = clamp($Inner_Gimbal.rotation.x, -1.4, 0)
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

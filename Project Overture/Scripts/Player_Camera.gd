extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func get_input():
	if Input.is_action_just_pressed("ui_left_cam"):
		rotate_y(-45)

	elif Input.is_action_just_pressed("ui_right_cam"):
		rotate_y(45)

	elif Input.is_action_just_pressed("ui_up_cam"):
		rotate_x(45)

	elif Input.is_action_just_pressed("ui_down_cam"):
		rotate_x(-45)
	pass 
	
func _physics_process(delta):
	get_input()
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

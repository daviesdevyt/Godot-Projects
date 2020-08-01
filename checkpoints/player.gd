extends KinematicBody2D


var move = Vector2()
var speed = 400



func _ready():
	Glob.load_data()
	global_position.x = Glob.checkpoint_pos + 50

func _physics_process(delta):
	move.y += 10
	var mve_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	move.x = mve_x * speed
	
	if Input.is_action_pressed("ui_up") and is_on_wall():
		move.y = -300
	
	move_and_slide(move)


func hit_checkpoint():
	Glob.load_data()
	Glob.checkpoint_pos = global_position.x
	Glob.save_data()






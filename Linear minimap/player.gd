extends KinematicBody2D


var grounded = false
var move = Vector2()
var speed = 400

func _ready():
	global_position.x = Glob.data_var + 50


func _physics_process(delta):
	move.y += 10
	var mve_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	move.x = mve_x * speed
	
	if Input.is_action_pressed("ui_up") and grounded:
		move.y = -300
	
	move_and_slide(move)



func _on_Area2D_body_entered(body):
	if body.is_in_group('tile'):
		grounded = true
func _on_Area2D_body_exited(body):
	if body.is_in_group('tile'):
		grounded = false



func _on_Area2D_area_entered(area):
	if area.is_in_group('check_point'):
		if area.name == '5':
			get_tree().change_scene("res://menu.tscn")
		Glob.data_var = area.global_position.x
	
	












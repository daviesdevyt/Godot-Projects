extends KinematicBody2D


var grounded = false
var grv = true
var move = Vector2()
var LastDIR = 0
var climb = false

func _physics_process(delta):
	if grv:
		move.y += 10
	
	var mve = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	move.x = mve * 300
	if mve != 0:
		LastDIR = mve
	$climb_wall.rotation_degrees = LastDIR * 90
	
	grv = !climb
	if climb: move.y = 0
	
	# jump code
	if Input.is_action_pressed("ui_up") and (grounded or climb):
		move.y = -300
	if Input.is_action_pressed("ui_down") and climb:
		move.y = 300
	
	move_and_slide(move)



func _on_gnd_dtct_body_entered(body):
	if body.is_in_group('tilemap'):
		grounded = true

func _on_gnd_dtct_body_exited(body):
	if body.is_in_group('tilemap'):
		grounded = false


func _on_climb_wall_body_entered(body):
	if body.is_in_group('tilemap'):
		climb = true


func _on_climb_wall_body_exited(body):
	if body.is_in_group('tilemap'):
		climb = false

extends KinematicBody2D

var b = 0
var c = 0
func _process(delta):
	b += 5
	var a = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	c = 200 * a
	if Input.is_action_just_pressed("ui_up"):
		b = -200
		
	move_and_slide(Vector2(c, b))
	
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://levels.tscn")

extends KinematicBody2D

var bullet_inst = preload("res://bullet.tscn")
var can_fire = true
var move = Vector2()

func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	if Input.is_action_pressed("ui_up"):
		move.x = 1
	move_and_slide((move*200).rotated(rotation))
	
	if Input.is_action_pressed("ui_select") and can_fire:
		var bullet = bullet_inst.instance()
		bullet.global_position = $muzzle.global_position
		bullet.rotation = rotation
		get_tree().root.add_child(bullet)
		can_fire = false
		yield(get_tree().create_timer(0.2), "timeout")
		can_fire = true
	
	





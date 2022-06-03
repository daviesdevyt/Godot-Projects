extends KinematicBody2D

var bullet = preload("res://objects/bullet.tscn")
var vel = Vector2()
var speed = 200
var explode = preload("res://objects/explosion.tscn")

func _physics_process(delta):
	var x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	vel = Vector2(x,y).normalized()
	move_and_slide(vel*speed)
	
	if Input.is_action_just_pressed("ui_select"):
		shoot()

func shoot():
	var bullet_inst1 = bullet.instance()
	var bullet_inst2 = bullet.instance()
	bullet_inst1.global_position = $Position2D.global_position
	bullet_inst2.global_position = $Position2D2.global_position
	get_tree().root.add_child(bullet_inst1)
	get_tree().root.add_child(bullet_inst2)


func _on_hurtbox_area_entered(area):
	if area.is_in_group("meteors"):
		var e = explode.instance()
		e.global_position = global_position
		get_tree().root.add_child(e)
		get_node("/root/Game").died()
		queue_free()
	

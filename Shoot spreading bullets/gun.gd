extends Position2D

var bullet_scene = preload("res://bullet.tscn")
func _process(delta):
	if Input.is_action_pressed("ui_select"):
		for angle in [-0.2, -0.1, 0, 0.1, 0.2]:
			var bullet = bullet_scene.instance()
			bullet.rotation = get_parent().rotation + angle
			bullet.position = global_position
			bullet.set_as_toplevel(true)
			add_child(bullet)

		set_process(false) # ------ DELAY CODE
		yield(get_tree().create_timer(0.2), "timeout")
		set_process(true)



# ------- USING WHILE LOOPS AND AUTOMATING THINGS
# ------- THE DOWN SIDE IS THAT IT HAS A CONSTANT NUMBER OF BULLETS (3)

#func _process(delta):
#	if Input.is_action_pressed("ui_select"):
#
#		var a = -0.3 #   Distance of spread
#		var ab = abs(a)
#
#		while a != 2*ab:
#			var bullet = bullet_scene.instance()
#			bullet.rotation = get_parent().rotation + a
#			bullet.position = global_position
#			bullet.set_as_toplevel(true)
#			add_child(bullet)
#			a += ab
#		set_process(false)
#		yield(get_tree().create_timer(0.2), "timeout")
#		set_process(true)















